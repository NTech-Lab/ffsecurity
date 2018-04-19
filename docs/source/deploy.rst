.. _deploy:


Пошаговое развертывание
===============================================

Данный раздел содержит сведения о пошаговом развертывании компонентов FindFace Security на одиночном сервере. Выполните приведенные ниже инструкции, придерживаясь заданного порядка.

.. include:: _inclusions/prepare_install.rst


.. rubric:: В этом разделе:

.. contents::
   :local:


Установка необходимого стороннего ПО
-------------------------------------------

Для работы FindFace Security необходима система управления базами данных :program:`PostgreSQL` и сетевое хранилище :program:`Redis`. Установите их из репозитория Ubuntu:

.. code::

   sudo apt-get update
   sudo apt install -y postgresql-server-dev-9.5 redis-server


Подготовка deb-пакетов к установке
-------------------------------------------

Для того чтобы подготовить deb-пакеты FindFace Security к установке, выполните следующие действия:

#. Распакуйте пакет с компонентами.

   .. code::

      sudo dpkg -i <findface-security-repo>.deb

#. Добавьте ключ подписи.

   .. code::

      sudo apt-key add /var/findface-security-repo/public.key
      sudo apt-get update

#. Распакуйте пакеты с моделями нейронных сетей. 

   .. code::
   
      sudo dpkg -i findface-data*.deb


Установка локального сервера лицензий NTLS
----------------------------------------------------

Вы получаете файл лицензии вместе с установочными пакетами FindFace Security. Для лицензирования в закрытой сети вам также будет предоставлен ключ аппаратной защиты Guardant. 

Для того чтобы установить и настроить локальный сервер лицензий NTLS, выполните следующие действия:

#. Установите компонент NTLS:

   .. code::

      sudo apt-get update
      sudo apt-get install ntls

   .. tip::
       В файле конфигурации NTLS вы можете изменить папку для хранения файла лицензии и настроить удаленный доступ к веб-интерфейсу NTLS, используемому для управления лицензией. Для того чтобы открыть файл конфигурации NTLS, выполните команду::

         sudo vi /etc/ntls.cfg

       При необходимости укажите в параметре ``license-dir`` другую папку для хранения файла лицензии. По умолчанию файл лицензии хранится в папке ``/ntech/license``::

         license-dir = /ntech/license

       По умолчанию доступ в веб-интерфейс NTLS возможен с любого удаленного сервера в пределах сети (``ui = 0.0.0.0:3185``). Для того чтобы обеспечить доступ к веб-интерфейсу NTLS только с определенного IP-адреса, отредактируйте параметр ui::

         ui = 127.0.0.1:3185

#. Добавьте сервис NTLS в автозагрузку и запустите сервис:

   .. code::

      sudo systemctl enable ntls && sudo systemctl start ntls

#. Загрузите файл лицензии в веб-интерфейсе NTLS по адресу ``http://<IP-адрес NTLS>:3185/#/``. 
#. В случае лицензирования в закрытой сети вставьте ключ Guardant в USB-порт.


.. _basic-deployment:

Установка базовой конфигурации
------------------------------------------

Установка базовой конфигурации (базы данных c необходимыми расширениями, компонента ``ffsecurity`` и веб-интерфейса) выполняется следующим образом:

#. Установите расширение ``findface-postgres-9.5-facen`` к :program:`PostgreSQL` из пакета :program:`<ffsecurity-repo>.deb`:

   .. code::
  
      sudo apt install -y findface-postgres-9.5-facen

#. В консоли :program:`PostgreSQL` создайте пользователя ``ntech`` и базу данных ``ffsecurity``. Загрузите в базу данных расширение ``findface-postgres-9.5-facen`` с помощью метки ``facen-compare-bytea``.

   .. code::

      sudo -u postgres psql

      postgres=# CREATE ROLE ntech WITH LOGIN;

      postgres=# CREATE DATABASE ffsecurity WITH OWNER ntech ENCODING 'UTF-8' LC_COLLATE='en_US.UTF-8' LC_CTYPE='en_US.UTF-8' TEMPLATE template0;

      postgres=# \c ffsecurity;

      ffsecurity=# CREATE EXTENSION "facen-compare-bytea";

   Для выхода из консоли ``PostgreSQL`` введите ``\q`` и нажмите :kbd:`Enter`.   

#. Разрешите авторизацию в :program:`PostgreSQL` по UID  клиента сокета. Перезапустите :program:`PostgreSQL`.

   .. code::

      echo 'local all ntech peer' | sudo tee -a /etc/postgresql/9.5/main/pg_hba.conf

      sudo systemctl restart postgresql@9.5-main.service

#. Установите компонент ``ffsecurity`` из пакета :program:`<ffsecurity-repo>.deb`.

   .. note::
      Вместе с ``ffsecurity`` будет установлен nginx.

   .. code::

      sudo apt install -y ffsecurity

#. Установите веб-интерфейс ``ffsecurity-ui`` из пакета :program:`<ffsecurity-repo>.deb`.

   .. code::

      sudo apt install -y ffsecurity-ui

#. Откройте файл конфигурации ``/etc/ffsecurity/config.py``. В параметре ``EXTERNAL_ADDRESS`` укажите актуальный внешний IP-адрес или URL сервера установки, по которому будет доступен веб-интерфейс. Придумайте токен для авторизации видеодетектора лиц в сервисе ``ffsecurity`` и укажите его в параметре ``VIDEO_DETECTOR_TOKEN`` (данный токен также нужно будет продублировать в :ref:`настройках видеодетектора <identification>`). 

   .. tip::
      Если необходимо обеспечить безопасность данных, включите :ref:`SSL-шифрование <https>`. 

   .. tip::
      При необходимости установите ``'IGNORE_UNMATCHED': True``, чтобы отключить запись события в базу данных, если обнаруженное лицо отсутствует в списках наблюдения (верификация дала отрицательный результат). Данную настройку рекомендуется использовать при большом количестве посетителей. Пороговая степень схожести при верификации лиц определяется параметром ``CONFIDENCE_THRESHOLD``.
 
   .. _quality:   

   .. tip::
      Рекомендуется отредактировать значение параметра ``MINIMUM_DOSSIER_QUALITY``. Данный параметр определяет минимальное качество лица на фотографии в досье. Если качество лица хуже минимального, пользователь не сможет загрузить такую фотографию в досье. Прямые изображения лиц анфас считаются наиболее качественными. Им соответствуют значения вблизи 0, как правило, отрицательные (такие как -0.00067401276, например). Перевернутые лица и лица, повернутые под большими углами, характеризуются отрицательным значениям от -5 и меньше. По умолчанию ``'MINIMUM_DOSSIER_QUALITY': -7``, что означает, что в досье могут быть загружены лица в любом качестве.
     
   .. code::

      sudo vi /etc/ffsecurity/config.py
 
      MEDIA_ROOT="/var/lib/ffsecurity/uploads"
      STATIC_ROOT="/var/lib/ffsecurity/static"

      EXTERNAL_ADDRESS="192.168.104.204"

      DEBUG = False

      LANGUAGE_CODE = 'ru-ru'

      TIME_ZONE = 'UTC'

      DATABASES = {
         'default': {
             'ENGINE': 'django.db.backends.postgresql',
             'NAME': 'ffsecurity',
         }
      }

      FFSECURITY = {
         'VIDEO_DETECTOR_TOKEN': 'Ghj545dfd',
         'CONFIDENCE_THRESHOLD': 0.75,
         'MINIMUM_DOSSIER_QUALITY': -0.1,
         'IGNORE_UNMATCHED': False,
         'EXTRACTION_API': 'http://127.0.0.1:18666/',
      }

    
   .. tip::
      При необходимости также отредактируйте файл конфигурации ``/etc/nginx/sites-available/ffsecurity-nginx.conf``.
 
#. Отключите сервер nginx, используемый по умолчанию, и добавьте в список включенных серверов сервер ``ffsecurity``. Перезапустите nginx.

   .. code::

      sudo rm /etc/nginx/sites-enabled/default

      sudo ln -s /etc/nginx/sites-available/ffsecurity-nginx.conf /etc/nginx/sites-enabled/

      sudo nginx -s reload

#. Перенесите схему базы данных из FindFace Security в :program:`PostgreSQL`, создайте группы пользователей с :ref:`предустановленными правами <users>` и  первого пользователя с правами администратора (т. н. Супер Администратора).

   .. important::
      Отличие назначаемого администратора от Супер Администратора в том, что последний не может лишиться прав администратора даже при смене роли.       

   .. code::

      sudo findface-security migrate

      sudo findface-security create_groups

      sudo findface-security createsuperuser --username admin --email root@localhost

#. Запустите сервисы.

   .. important::
      Компонент ``ffsecurity`` включает в себя сервисы ``findface-security-proto`` (отвечает за HTTP и web-сокет) и ``findface-security-worker`` (обеспечивает взаимодействие остальных компонентов системы). Количество экземпляров ``findface-security-worker`` рассчитывается по формуле N=(количество ядер CPU-1). Количество экземпляров задается после знака ``@``, например, ``findface-security-worker@{1,2,3}`` для активации 3-х экземпляров.  

   .. code::

      sudo systemctl enable redis-server findface-security-proto findface-security-worker@{1,2,3,4}

      sudo systemctl start redis-server findface-security-proto findface-security-worker@{1,2,3,4}


.. _identification:

Установка модуля биометрической видео-идентификации
----------------------------------------------------------

Установка модуля биометрической видео-идентификации (компонентов ``fkvideo_detector`` и ``extraction-api``) выполняется следующим образом:

#. Установите видеодетектор лиц.

   .. code::

      sudo apt install -y fkvideo-detector 

#. Откройте файл конфигурации видеодетектора и отредактируйте в нем следующие настройки:

   .. note:: 
      Обратите внимание, что в параметре ``api-token`` нужно указать значение ``VIDEO_DETECTOR_TOKEN`` из ``/etc/ffsecurity/config.py`` (см. :ref:`basic-deployment`). 

   .. code:: 

      sudo vi /etc/fkvideo.ini
      
      api-url=127.0.0.1:8002

      api-token=<'VIDEO_DETECTOR_TOKEN'>

      detector-name=detector1

      request-url=/video-detector/frame/

      camera-url=/video-detector/cameras/

      realtime=0

   .. important::
      По умолчанию видеодетектор подбирает лучшее изображение лица в режиме реального времени (``realtime=1``). В этом режиме видеодетектор начинает отправлять в ``ffsecurity`` изображения лица сразу после его появления в поле зрения видеокамеры. Для более эффективного подбора лучшего изображения лица рекомендуется установить буферный режим (``realtime=0``). В буферном режиме видеодетектор использует меньший объем дискового пространства, поскольку для каждого лица отправляет в ``ffsecurity`` только одно изображение, но наивысшего качества.

#. Добавьте сервис ``fkvideo_detector`` в автозагрузку Ubuntu и запустите его. Убедитесь, что сервис активен. 

   .. code::

      sudo systemctl enable fkvideo_detector@fkvideo && sudo systemctl start fkvideo_detector@fkvideo

      sudo systemctl status fkvideo_detector@fkvideo

#. Установите компонент ``extraction-api``.

   .. code::

      sudo apt install -y findface-extraction-api

#. В файле конфигурации ``extraction-api`` включите опцию ``quality_estimator`` для оценки качества лица.

   .. note::
      :ref:`Минимальное качество лица <quality>` на фотографии в досье задается параметром ``MINIMUM_DOSSIER_QUALITY`` в файле конфигурации ``/etc/ffsecurity/config.py``.

   .. code::

      sudo vi /etc/findface-extraction-api.ini  
    
      quality_estimator: true

#. В файле конфигурации ``extraction-api`` выключите поиск моделей для распознавания пола, возраста и эмоций, передав пустые значения в параметры ``gender``, ``age`` и ``emotions``:

   .. warning::
      Не удаляйте сами параметры, поскольку в этом случае будет выполняться поиск моделей по умолчанию. 
  
   .. code::

      models:
        gender: ""
        age: ""
        emotions: ""

#. Добавьте сервис ``extraction-api`` в автозагрузку Ubuntu и запустите его. Убедитесь, что сервис активен.

   .. code::

      sudo systemctl enable findface-extraction-api && sudo systemctl start findface-extraction-api

      sudo systemctl status findface-extraction-api
      




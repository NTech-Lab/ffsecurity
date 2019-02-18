.. _ffsecurity-windows:


Развертывание в ОС Windows
===========================================================

.. rubric:: В этом разделе:

.. contents::
   :local:

Установка
--------------------------------------

Для развертывания FindFace Security в ОС Windows выполните следующие действия:

#. Установите среду виртуализации Docker, руководствуясь официальной справочной `документацией <https://docs.docker.com/docker-for-windows/install/>`__ по системе.
#. В настройках Docker добавьте диск, на который устанавливается FindFace Security, в список дисков в общем доступе. Для этого перейдите в :menuselection:`Settings --> Shared Drives`, выберите диск и выполните :guilabel:`Share`.
#. В настройках Docker увеличьте объем ресурсов для собственных нужд Docker и поддержания обработки необходимого количества камер, выделив максимально возможное количество ядер процессора и соответствующий объем памяти. См. :ref:`requirements`.

   .. tip::
      Например, для обработки одной камеры необходимо 6 Гб, для обработки 2-х - 8 Гб и т. д. 

#. Добавьте пользователя Windows, в учетной записи которого осуществляется установка, в группу ``docker-users``. 
  
   .. important::
      Не допускается использовать пользователя, если ему присвоен пустой пароль.

#. Скачайте дистрибутив FindFace Security для Windows, состоящий из файлов :program:`<Install-FindFaceSecurity>.exe` и :program:`<Install-FindFaceSecurity>.nsisbin`. Для успешной установки оба файла должны находится в корне одного каталога. 
#. Запустите :program:`<Install-FindFaceSecurity>.exe`.

    |choose_components|

    .. |choose_components| image:: /_static/choose_components.png
       :scale: 60%

#. Следуйте инструкциям мастера установки. В процессе установки потребуется выбрать IP-адрес компонента ``ffsecurity``, который будет использоваться для отображения веб-интерфейса в браузере. Список возможных IP-адресов пронумерован. В окне утилиты введите нужный номер и нажмите :kbd:`Enter`.

    |ip_address|

    .. |ip_address| image:: /_static/ip_address.png
       :scale: 60%

#. После завершения установки оставьте установленными флажки :guilabel:`Start FindFace Security and open its webpages` и :guilabel:`Show Readme` и нажмите :guilabel:`Finish`. Появится командная строка с информацией о запускаемых/запущенных компонентах. После этого будет открыта стартовая веб-страница FindFace Security, а также веб-интерфейс лицензионного сервера, через который нужно будет загрузить файл лицензии. 

    .. tip::
       Все необходимые для работы с FindFace Security ссылки и учетные данные вы найдете в открывшемся файле :file:`readme.txt`.

    .. note:: 
       Работа с FindFace Security выполняется через веб-интерфейс, доступный по http по порту ``8081``.

    |complete|

    .. |complete| image:: /_static/complete.png
       :scale: 60%

    |start|

    .. |start| image:: /_static/start.png
       :scale: 60%

    .. note::
       Readme-файл хранится в выбранном каталоге установки (по умолчанию :menuselection:`Program Files --> FindFace Security`).


Запуск и управление
-------------------------------------------

Для запуска, перезапуска и остановки FindFace Security используйте соответствующие ярлыки в меню :guilabel:`Пуск`.

    |menu_start|

    .. |menu_start| image:: /_static/menu_start.png
       :scale: 60%

.. note::
   Соответствующие файлы ``.exe`` хранятся в выбранном каталоге установке (по умолчанию :menuselection:`Program Files --> FindFace Security`).
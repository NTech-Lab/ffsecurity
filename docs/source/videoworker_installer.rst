.. _worker-installer:

Дополнительное развертывание ``video-worker`` на удаленных серверах
=======================================================================

В случае если на удаленном сервере нужно установить только компонент ``video-worker``,  можно использовать мини-инсталлятор.

Для развертывания ``video-worker`` из мини-инсталлятора выполните следующие действия:

#. Загрузите файл инсталлятора ``<fkvideo-worker-xxx>.run``.
#. Поместите файл ``.run`` в любой каталог на сервере установки (например, ``/home/username``).
#. Из данного каталога сделайте файл ``.run`` исполняемым.

   .. code::

       chmod +x <fkvideo-worker-xxx>.run

#. Запустите файл ``.run``. Компонент ``video-worker`` будет автоматически установлен.

   .. code::

       sudo ./<fkvideo-worker-xxx>.run

#. Откройте для редактирования файл конфигурации ``/etc/video-worker.ini``.

   .. code::   

      sudo vi /etc/video-worker.ini

#. В параметре ``ntls-addr`` укажите IP-адрес локального сервера лицензирования NTLS.

   .. code::

      ntls-addr=127.0.0.1:3133

#. В параметре ``mgr-static`` укажите IP-адрес сервера с установленным компонентом ``videomanager-api``, у которого компонент ``video-worker`` будет запрашивать настройки и список видеопотоков.

   .. code::

      mgr-static=127.0.0.1:18811

#. В параметре ``capacity`` укажите максимальное количество видеопотоков, обрабатываемых компонентом ``video-worker``. 

   .. code::

      capacity=10



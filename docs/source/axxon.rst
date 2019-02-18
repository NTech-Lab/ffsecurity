Axxon Next
=============================================

Интеграция FindFace Security с программным комплексом Axxon Next позволяет обрабатывать видеопотоки из системы безопасности на базе Axxon и анализировать их на предмет наличия лиц из досье. 

.. important::
   Один экземпляр FindFace Security поддерживает работу не более чем с одним сервером Axxon Next. 

Интеграция с Axxon Next выполняется с использованием плагина ``ffsecurity_axxon``. 

Для того чтобы настроить интеграцию с Axxon Next в ОС Ubuntu, выполните следующие действия:

#. Активируйте плагин, добавив в файл конфигурации ``/etc/ffsecurity/config.py`` строку ``INSTALLED_APPS.append('ffsecurity_axxon')``.

   .. code::

      sudo vi /etc/ffsecurity/config.py

      ...

      # integration plugins
      INSTALLED_APPS.append('ffsecurity_axxon') # remove or comment out this line to disable

#. В файл конфигурации добавьте секцию ``FFSECURITY->AXXON``. Заполните ее так, как показано в примере ниже. В параметре ``api`` укажите адрес сервера Axxon Next, по которому FindFace Security будет обращаться к API Axxon и за HLS-потоками архива. В параметре ``rtsp`` укажите общий адрес видеопотоков на сервере Axxon Next.

   .. code::
    
      FFSECURITY = {
     'AXXON': {
        'api': 'http://user:password@example.com/',
        'rtsp': 'rtsp://user:password@example.com:554/',
              }
     }


#. (Опционально). Если в событиях распознавания лиц требуется отображать клипы видео из Axxon Next, отредактируйте секцию ``FFSECURITY_UI_CONFIG`` так, как показано в примере ниже.

   .. code::

      FFSECURITY_UI_CONFIG = {
       'dossier': {
         'video': True,
       }
      }


#. Создайте камеры в FindFace Security (см. :ref:`cameras`). При создании камер вам потребуется ввести их URL в формате ``axxon:<friendlyNameLong>``, где ``friendlyNameLong`` - имя камеры на сервере Axxon Next. Данное имя можно посмотреть в интерфейсе Axxon, или через API Axxon, выполнив команду:

   .. code::
 
      curl http://user:password@127.0.0.1/video-origins/
      
      {
         "OLOLOE-DEV/DeviceIpint.vhod_1/SourceEndpoint.video:0:0" : {
            "friendlyNameLong" : "vhod_1.Vhod_1",
            "friendlyNameShort" : "Vhod_1",
            "origin" : "OLOLOE-DEV/DeviceIpint.vhod_1/SourceEndpoint.video:0:0",
            "state" : "signal_restored"
         }
      }

   Для единственной камеры из примера выше URL должен быть задан как ``axxon:vhod_1.Vhod_1``. 

На этом настройка интеграции будет завершена. Если интеграция настроена корректно, FindFace Security будет выполнять проверку наличия лиц из досье в видеопотоках Axxon Next, а в событиях распознавания лиц будут отображаться клипы видео из Axxon Next (при соответствующих настройках).

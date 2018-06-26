Аудит-логи
=====================

При разборе нештатных ситуаций используйте аудит-логи, содержащие подробную деталировку всех событий, произошедших в системе.

.. important::
   Для того чтобы включить хранение аудит-логов на жестком диске, в файле ``etc/systemd/journald.conf`` раскомментируйте и измените параметр ``Storage`` следующим образом:

   .. code::

       sudo vi etc/systemd/journald.conf
       ...
       [Journal]
       Storage=persistent

   При необходимости также раскомментируйте и измените значение параметра ``SystemMaxUse``. Данный параметр определяет в процентах максимальный объем логов на жестком диске (по умолчанию 10%).

   .. code::
 
      SystemMaxUse=15
       

Для того чтобы просмотреть аудит-логи, выполните следующую команду:

.. code::

   journalctl -o verbose SYSLOG_IDENTIFIER=ffsecurity


При расшифровке аудит-логов в первую очередь обращайте внимание на следующие параметры:

* ``REQUEST_USER``: пользователь, который выполнил изменения;
* ``REQUEST_PATH``: URL запроса;
* ``REQUEST_DATA``: данные запроса.

Ниже приведен пример лога создания досье с ``id=1879`` пользователем ``admin``.

.. code::

   Пт 2017-12-22 17:53:32.436258 MSK [s=0b5566699751426983e13241301205e9;i=e26015;b=907c34cc1fde4398af63bb575587d9ba;m=246f620c449;t=560eefaf59bc5;x=ed60a136c8fc6362]
      PRIORITY=6
      _UID=123
      _GID=130
      _CAP_EFFECTIVE=0
      _BOOT_ID=907c34cc1fde4398af63bb575587d9ba
      _MACHINE_ID=a3eea61c03e041ef8e64d5c72f5fce40
      _HOSTNAME=ntechadmin
      SYSLOG_IDENTIFIER=ffsecurity
      THREAD_NAME=MainThread
      _TRANSPORT=journal
      _PID=6579
      _COMM=findface-securi
      _EXE=/opt/ffsecurity/bin/python3
      _CMDLINE=/opt/ffsecurity/bin/python /opt/ffsecurity/bin/findface-security-manage runworker
      _SYSTEMD_CGROUP=/system.slice/system-findface\x2dsecurity\x2dworker.slice/findface-security-worker@4.service
      _SYSTEMD_UNIT=findface-security-worker@4.service
      _SYSTEMD_SLICE=system-findface\x2dsecurity\x2dworker.slice
      CODE_FILE=/opt/ffsecurity/lib/python3.5/site-packages/ffsecurity/mixins.py
      CODE_LINE=94
      CODE_FUNC=finalize_response
      REQUEST_USER=admin
      LOGGER=ffsecurity.audit
      MESSAGE=N8Be05il POST /dossier-faces/ 201 by admin
      REQUEST_DATA={"dossier": "'1879'", "source_photo": "<InMemoryUploadedFile: 14927016033292449.jpeg (image/jpeg)>"}
      REQUEST_PATH=/dossier-faces/
      REQUEST_ID=N8Be05il
      _SOURCE_REALTIME_TIMESTAMP=1513954412436258

В следующем примере для досье с ``id=1879`` запрашивается список лиц.

.. code::

   Пт 2017-12-22 17:53:32.475467 MSK [s=0b5566699751426983e13241301205e9;i=e26016;b=907c34cc1fde4398af63bb575587d9ba;m=246f6215d82;t=560eefaf634fe;x=b1374a144a46b5cd]
      PRIORITY=6
      _UID=123
      _GID=130
      _CAP_EFFECTIVE=0
      _BOOT_ID=907c34cc1fde4398af63bb575587d9ba
      _MACHINE_ID=a3eea61c03e041ef8e64d5c72f5fce40
      _HOSTNAME=ntechadmin
      SYSLOG_IDENTIFIER=ffsecurity
      THREAD_NAME=MainThread
      _TRANSPORT=journal
      _COMM=findface-securi
      _EXE=/opt/ffsecurity/bin/python3
      _CMDLINE=/opt/ffsecurity/bin/python /opt/ffsecurity/bin/findface-security-manage runworker
      _SYSTEMD_SLICE=system-findface\x2dsecurity\x2dworker.slice
      _PID=6588
      _SYSTEMD_CGROUP=/system.slice/system-findface\x2dsecurity\x2dworker.slice/findface-security-worker@2.service
      _SYSTEMD_UNIT=findface-security-worker@2.service
      CODE_FILE=/opt/ffsecurity/lib/python3.5/site-packages/ffsecurity/mixins.py
      CODE_LINE=94
      CODE_FUNC=finalize_response
      REQUEST_USER=admin
      REQUEST_DATA={}
      LOGGER=ffsecurity.audit
      MESSAGE=Dee7Qvy4 GET /dossier-faces/?dossier=1879&limit=1000 200 by admin
      REQUEST_ID=Dee7Qvy4
      REQUEST_PATH=/dossier-faces/?dossier=1879&limit=1000
      _SOURCE_REALTIME_TIMESTAMP=1513954412475467




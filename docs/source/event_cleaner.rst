.. _event-cleaner:

***************************************************
Очистка базы данных событий c ``event-cleaner``
***************************************************

Для удаления устаревших событий используйте утилиту ``event-cleaner``.

Cправка по утилите вызывается следующей командой:

.. code::

   sudo findface-security cleanup_events --help

.. code::

   usage: findface-security-manage cleanup_events [-h] [--version] [-v {0,1,2,3}]
                                                  [--settings SETTINGS]
                                                  [--pythonpath PYTHONPATH]
                                                  [--traceback] [--no-color]
                                                  --age AGE

   Delete old events

   optional arguments:
    -h, --help            show this help message and exit
    --version             show program's version number and exit
    -v {0,1,2,3}, --verbosity {0,1,2,3}
                          Verbosity level; 0=minimal output, 1=normal output,
                          2=verbose output, 3=very verbose output
    --settings SETTINGS   The Python path to a settings module, e.g.
                          "myproject.settings.main". If this isn't provided, the
                          DJANGO_SETTINGS_MODULE environment variable will be
                          used.
    --pythonpath PYTHONPATH
                          A directory to add to the Python path, e.g.
                          "/home/djangoprojects/myproject".
    --traceback           Raise on CommandError exceptions
    --no-color            Don't colorize the command output.
    --age AGE             Minimum age in days of events to clean up
   
Для удаления событий старше определенного количества дней используйте опцию ``--age``. Например, для удаления событий старше 5 дней выполните команду: 

.. code::

   sudo findface-security cleanup_events --age 5

Для автоматического удаления событий создайте задание в планировщике ``cron``. Команда в примере ниже добавляет в ``cron`` файл скрипта ``/etc/cron.d/cleanup``, который удаляет события старше 60 дней. Скрипт выполняется ежедневно в 00:05.

.. code::

   echo '5 0 * * * root /usr/bin/findface-security cleanup_events --age 60' | sudo tee /etc/cron.d/cleanup



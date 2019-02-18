.. _event-cleaner:

Очистка базы данных событий
==========================================================

.. rubric:: В этом разделе:

.. contents::
   :local:


Очистка устаревших событий в ОС Windows
--------------------------------------------------------

Для удаления устаревших событий в ОС Windows используйте утилиту ``cleanup-events.exe``. Запуск утилиты выполняется из консоли. Для автоматического удаления событий используйте bat-файл или создайте задачу в Планировщике заданий Windows или любом другом планировщике.

Для удаления событий старше определенного количества дней используется опция ``--age``. Например, для удаления событий старше 5 дней выполните команду: 

.. code::

   cleanup-events.exe --age 5

При создании задачи в Планировщике Windows в качестве единственного аргумента добавьте ``--age DAYS``, где ``DAYS`` - минимальный возраст удаляемого события.

.. tip::
   Минимальная инструкция для запуска утилиты ``cleanup-events.exe`` на регулярной основе выглядит следующим образом:
   
   #. Откройте Планировщик Windows и выберите :guilabel:`Создать задачу`.
   #. При создании задачи в общих настройках укажите имя новой задачи и версию ОС.
   #. На вкладке :guilabel:`Триггер` создайте новый триггер, указав в какое время и в какие дни должна выполняться задача (очистка базы данных), например, еженедельно по четвергам в 1:00.
   #. На вкладке :guilabel:`Действия` выберите вид выполняемого действия :guilabel:`Запуск программы`, указав путь к файлу ``cleanup-events.exe``. В качестве аргумента добавьте возраст событий, которые должны быть удалены.
   #. Нажмите :guilabel:`OK`. Теперь задача очистки базы данных будет отрабатывать в автоматическом режиме, включая открытие и автоматическое закрытие cmd-консоли.



Очистка устаревших событий в ОС Ubuntu
----------------------------------------------------

Для удаления устаревших событий в ОС Ubuntu используйте утилиту ``event-cleaner``.

Cправка по утилите вызывается следующей командой:

.. code::

   sudo findface-security cleanup_events --help

.. code::

   usage: findface-security cleanup_events [-h] [--version] [-v {0,1,2,3}]
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


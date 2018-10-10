��          D      l       �     �   �  �  L   I  
  �  z  �  �     �   �     |  �   �                          Для удаления событий старше определенного количества дней используется опция ``--age``. Например, для удаления событий старше 5 дней выполните команду: Для удаления устаревших событий используйте утилиту ``cleanup-events.exe``. Запуск утилиты выполняется из консоли. Для автоматического удаления событий используйте bat-файл или создайте задание в Планировщике Windows или любом другом планировщике. Очистка базы данных событий c ``cleanup-events.exe`` При создании задания в Планировщике Windows в качестве единственного аргумента добавьте ``--age DAYS``, где ``DAYS`` - минимальный возраст удаляемого события. Project-Id-Version: FindFace Security 1.0
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2018-10-10 18:45+0700
PO-Revision-Date: 2018-10-10 18:48+0700
Last-Translator: 
Language: en
Language-Team: 
Plural-Forms: nplurals=2; plural=(n != 1);
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.5.3
X-Generator: Poedit 2.1.1
 In order to remove events older than a given number of days, use the ``--age`` option. For example, to remove events older than 5 days, execute: Use the ``cleanup-events.exe`` utility to remove old events from the database. Launch it from the console. To automatically remove events, use a batch file, or add a scheduled job to Windows Task Scheduler. Purge Old Events from Database When creating a task in Windows Task Scheduler, specify ``--age DAYS`` as an argument, where ``DAYS`` is the minimum age of events to be purged. 
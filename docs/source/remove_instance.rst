Удаление экземпляра продукта
==============================================

Вы можете автоматически удалить FindFace Security вместе с базой данных с помощью скрипта :program:`ffsecurity_uninstall.sh`. Перед удалением будут созданы резервные копии файлов конфигурации и базы данных.

Выполните следующие действия: 

#. Загрузите скрипт :download:`ffsecurity_uninstall.sh <_scripts/ffsecurity_uninstall.sh>` в любой каталог на сервере установки (например, в ``/home/username/``).

#.  Из данного каталога сделайте скрипт :program:`ffsecurity_uninstall.sh` исполняемым. 

   .. code::

      chmod +x ffsecurity_uninstall.sh

#. Запустите скрипт :program:`ffsecurity_uninstall.sh`. 

   .. code::

      sudo ./ffsecurity_uninstall.sh

#. Ответьте **all** на вопрос интерактивного мастера удаления, чтобы полностью удалить FindFace Security вместе с базой данных.
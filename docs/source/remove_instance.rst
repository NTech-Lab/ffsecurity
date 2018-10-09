Удаление экземпляра продукта
==============================================

Вы можете автоматически удалить FindFace Security 1.1 вместе с базой данных с помощью скрипта :download:`ffsec_1.1_uninstall.sh <_scripts/ffsec_1.1_uninstall.sh>`. Перед удалением будут созданы резервные копии файлов конфигурации и базы данных.

.. note::
   Для удаления FindFace Security 1.0 используйте скрипт :download:`ffsec_1.0_uninstall.sh <_scripts/ffsec_1.0_uninstall.sh>`.

Выполните следующие действия: 

#. Загрузите скрипт :download:`ffsec_1.1_uninstall.sh <_scripts/ffsec_1.1_uninstall.sh>` в любой каталог на сервере установки (например, в ``/home/username/``).

#.  Из данного каталога сделайте скрипт исполняемым. 

   .. code::

      chmod +x ffsec_1.1_uninstall.sh

#. Запустите скрипт. 

   .. code::

      sudo ./ffsec_1.1_uninstall.sh

#. Ответьте **all** на вопрос интерактивного мастера удаления, чтобы полностью удалить FindFace Security вместе с базой данных.

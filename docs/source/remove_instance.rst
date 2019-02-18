Удаление экземпляра продукта
==============================================

.. rubric:: В этом разделе:

.. contents::
   :local:


Удаление FindFace Security в ОС Windows
---------------------------------------------

Для удаления FindFace Security используйте соответствующий ярлык в меню :guilabel:`Пуск`.

    |menu_start|

    .. |menu_start| image:: /_static/menu_start.png
       :scale: 60%

.. note::
   Файл ``uninstall.exe`` хранятся в выбранном каталоге установке (по умолчанию :menuselection:`Program Files --> FindFace Security`).


Удаление FindFace Security в ОС Ubuntu
------------------------------------------

Вы можете автоматически удалить FindFace Security 1.1 вместе с базой данных с помощью скрипта :download:`ffsec_1.1_uninstall.sh <_scripts/ffsec_1.1_uninstall.sh>`. Перед удалением будут созданы резервные копии файлов конфигурации и базы данных.

Выполните следующие действия: 

#. Загрузите скрипт :download:`ffsec_1.1_uninstall.sh <_scripts/ffsec_1.1_uninstall.sh>` в любой каталог на сервере установки (например, в ``/home/username/``).

#.  Из данного каталога сделайте скрипт исполняемым. 

   .. code::

      chmod +x ffsec_1.1_uninstall.sh

#. Запустите скрипт. 

   .. code::

      sudo ./ffsec_1.1_uninstall.sh

#. Ответьте **all** на вопрос интерактивного мастера удаления, чтобы полностью удалить FindFace Security вместе с базой данных.

.. _architecture:

*******************************
Архитектура
*******************************

FindFace Security в ОС Windows развертывается на одиночном сервере.

.. tip:: 
   См. :ref:`requirements`.

Работоспособность FindFace Security обеспечивается взаимодействием следующих компонентов:

.. csv-table::
   :header: "Компонент", "Описание"
   :widths: 15 40
   :file: _tables/components.csv
   :encoding: UTF-8
   :delim: ;

.. note::
   Работа с FindFace Security выполняется через веб-интерфейс.

.. note::
   Для очистки базы данных от устаревших событий используйте :ref:`утилиту <event-cleaner>` ``cleanup-events.exe``.

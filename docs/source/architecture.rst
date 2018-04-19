.. _architecture:

*******************************
Архитектура
*******************************

FindFace Security развертывается на одиночном сервере или нескольких серверах.

.. tip:: 
   См. :ref:`requirements`.

Для установки FindFace Security используются следующие установочные пакеты:

* Пакет с компонентами :program:`<findface-security-repo>.deb`.
* Пакеты с моделями нейронных сетей для извлечения биометрических образцов лиц :program:`<findface-data>.deb`.


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
   Для очистки базы данных от устаревших событий используйте :ref:`утилиту <event-cleaner>` ``event-cleaner``.

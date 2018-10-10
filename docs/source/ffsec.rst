.. _ffsecurity:

*******************************************
Развертывание и запуск FindFace Security
*******************************************

.. rubric:: В этой главе:

.. contents::
   :local:

Развертывание FindFace Security
=================================

Для развертывания FindFace Security в ОС Windows выполните следующие действия:

#. Установите среду виртуализации Docker, руководствуясь официальной справочной `документацией <https://docs.docker.com/docker-for-windows/install/>`__ по системе.
#. В настройках Docker добавьте диск, на который устанавливается FindFace Security, в список дисков в общем доступе. Для этого перейдите в :menuselection:`Settings --> Shared Drives`, выберите диск и выполните :guilabel:`Share`.
   
   .. important::
      В настройках Docker также рекомендуется увеличить объем ресурсов для собственных нужд Docker, выделив максимально возможное количество ядер процессора и 4 Гб памяти.

#. Запустите :program:`Install-FindFaceSecurity-1.1.exe`.

    |choose_components|

    .. |choose_components| image:: /_static/choose_components.png
       :scale: 60%

#. Следуйте инструкциям мастера установки. В процессе установки потребуется выбрать IP-адрес компонента ``ffsecurity``, который будет использоваться для отображения веб-интерфейса в браузере. Список возможных IP-адресов пронумерован. В командной строке введите нужный номер и нажмите :kbd:`Enter`.

    |ip_address|

    .. |ip_address| image:: /_static/ip_address.png
       :scale: 60%

#. После завершения установки установите флажки :guilabel:`Start FindFace Security and open its webpages` и :guilabel:`Show Readme` и нажмите :guilabel:`Finish`. Появится командная строка с информацией о запускаемых/запущенных компонентах. После этого будет открыта стартовая веб-страница FindFace Security. Все необходимые для работы с FindFace Security ссылки и учетные данные вы найдете в открывшемся файле :file:`readme.txt`.

    |complete|

    .. |complete| image:: /_static/complete.png
       :scale: 60%

    |start|

    .. |start| image:: /_static/start.png
       :scale: 60%

    .. note::
       Readme-файл хранится в каталоге :menuselection:`Program Files --> FindFace Security`.


Запуск, управление и удаление FindFace Security
===================================================

Для запуска, перезапуска, остановки и удаления FindFace Security используйте соответствующие ярлыки в меню :guilabel:`Пуск`.

    |menu_start|

    .. |menu_start| image:: /_static/menu_start.png
       :scale: 60%

.. note::
   Соответствующие файлы ``.exe`` хранятся в каталоге :menuselection:`Program Files --> FindFace Security`.
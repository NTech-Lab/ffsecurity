.. _genetec:


*******************************************
Настройка интеграции
*******************************************

Интеграция с Genetec Security Center реализуется через плагин ``findface-genetec``. По умолчанию плагин активен и на панели навигации FindFace Security есть вкладка :guilabel:`Genetec`. 

.. note::
   Если это не так в FindFace Security, откройте файл конфигурации ``ffsecurity`` и проверьте, есть ли в нем активная строка ``INSTALLED_APPS.append('ffsecurity_genetec')``.

   .. code::

      sudo vi /etc/ffsecurity/config.py

      ...

      FFSECURITY_UI_CONFIG = {
      }

      # integration plugins
      INSTALLED_APPS.append('ffsecurity_genetec') # remove or comment out this line to disable
 
Перед настройкой интеграции на стороне FindFace Security разверните программное обеспечение Genetec Web SDK и Media Gateway и создайте в Genetec Security Center оповещение ``Alarm``, которое будет отображаться при наступлении в FindFace Security события распознавания лица. 

.. rubric:: В этой главе:

.. contents::
   :local:

.. _websdk-media:
 
Настройка Genetec Web SDK и Media Gateway
================================================

Для того чтобы развернуть Web SDK, используйте ПО Genetec Config Tool. Детали настройки приведены в официальной справочной документации :menuselection:`Security Center Administrator Guide -> Chapter 52: Role Types -> Web-based SDK configuration tabs`.

    |websdk|

    .. |websdk| image:: /_static/websdk.jpg
        :scale: 60%

Для того чтобы развернуть Media Getaway в Genetec Config Tool, ознакомьтесь с содержанием главы :menuselection:`Security Center Administrator Guide -> Chapter 24: Video Deployment`.  

    |mediagw|

    .. |mediagw| image:: /_static/mediagw.jpg
        :scale: 60%

.. important::
   Убедитесь, что файрвол настроен таким образом, что порты WebSDK и Media Gateway остаются открытыми.


.. _alarm:

Создание оповещения в Genetec Security Center
===================================================

Создайте и настройте новое оповещение ``Alarm`` в Genetec Config Tool, руководствуясь разделом :menuselection:`Security Center Administrator Guide  -> Chapter 48: Alarms -> Creating Alarms` документации.

    |alarm_properties|

    .. |alarm_properties| image:: /_static/alarm_properties.jpg
        :scale: 60%

.. tip::
   На вкладке :guilabel:`Properties` выберите ту опцию отображения видео :guilabel:`Video display option`, которая в наибольшей степени соответствует вашим нуждам. Доступные опции :guilabel:`Live`, :guilabel:`Playback`, и т. д. 

.. tip::
   Для того чтобы активировать операции с оповещением Alarm Procedures и автоповорот видео непосредственно во всплывающем окне оповещения, включите :guilabel:`Content cycling`.

При настройке интеграции на стороне FindFace Security вам потребуется ввести логическое id  оповещения, которое задается на вкладке :guilabel:`Identity`.

    |alarm_identity|

    .. |alarm_identity| image:: /_static/alarm_identity.jpg
        :scale: 60%


Настройка точек доступа в FindFace Security
=============================================

Для того чтобы установить соединение между FindFace Security и Genetec Security Center, выполните следующие действия:

#. Перейдите на вкладке :guilabel:`Genetec` в FindFace Security.

    |genetec_config_ru|

    .. |genetec_config_ru| image:: /_static/genetec_config_ru.png
        :scale: 60%

    .. |genetec_config_en| image:: /_static/genetec_config_en.png
        :scale: 60%

#. В секциях :guilabel:`Сервер` и :guilabel:`Media`, укажите :ref:`настройки <websdk-media>` точек доступа Web SDK и Media Gateway.

   .. important::
      Порты WebSDK и Media Gateway должны быть открыты.

#. В секции :guilabel:`Ids`, укажите :ref:`логический id <alarm>` оповещения ``Alarm``, которое будет отображаться в Genetec Security Center при наступлении события распознавания лица в FindFace Security.
#. Нажмите :guilabel:`Сохранить`. Если соединение с Genetec Security Center успешно установлено, статус :guilabel:`State` будет автоматически изменен на :guilabel:`Сконфигурирован`.

Импорт камер из Genetec Security Center
===============================================

Как только соединение с Genetec Security Center установлено, можно импортировать камеры. Для этого выберите :guilabel:`Камеры` на вкладке :guilabel:`Genetec` и нажмите :guilabel:`Импорт`.

    |genetec_cameras_ru|

    .. |genetec_cameras_en| image:: /_static/genetec_cameras_en.png
        :scale: 60%

    .. |genetec_cameras_ru| image:: /_static/genetec_cameras_ru.png
        :scale: 60%

Данное действие создаст :ref:`группу камер <cameras>` ``Genetec``, включающую в себя все камеры из Genetec Security Center.

    |genetec_group_ru|

    .. |genetec_group_en| image:: /_static/genetec_group_en.png
        :scale: 60%

    .. |genetec_group_ru| image:: /_static/genetec_group_ru.png
        :scale: 60%

Для того чтобы посмотреть список камер, на панели навигации FindFace Security перейдите на вкладку :guilabel:`Камеры`. Для того чтобы исключить камеру из распознавания лиц, просто дезактивируйте ее в этом списке.

Создание списков наблюдения и досье в FindFace Security
===========================================================

После настройки точек доступа и импорта камер завершите интеграцию, создав :ref:`базу данных досье <guests>`. После этого оповещения о событиях распознания лиц будут автоматически отправляться в Genetec Security Center. См. :ref:`gsc`.





 


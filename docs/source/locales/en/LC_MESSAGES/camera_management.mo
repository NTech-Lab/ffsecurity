��          �      L      �  j   �  _   ,     �  i   �  �     p   �  �   ;  g   �  1   e  �  �      W  <   x  @   �  =   �  �   4  g  "	  (   �
  /   �
  O  �
  .   3  8   b     �  &   �  P   �  -   $  }   R  /   �        �                  7     O  {   i  �   �     �     �                                                             	                
                       В веб-интерфейсе перейдите на вкладку :guilabel:`Группы камер`. В веб-интерфейсе перейдите на вкладку :guilabel:`Камеры`. В этой главе: Введите имя группы и при необходимости комментарий к ней. Введите название камеры и добавьте ее в одну из групп. При необходимости введите комментарий к камере. Для добавления камеры в группу выполните следующие действия: Для настройки видео-идентификации лиц добавьте камеры в FindFace Security, сгруппировав их c учетом расположения. Для создания группы камер выполните следующие действия: Добавление камеры в группу Если события от камер, принадлежащих одной группе, требуется дедуплицировать, т. е. исключить одинаковые события, поставьте флажок :guilabel:`Дедуплицировать` и задайте таймаут дедупликации (интервал, с которым события проверяются на уникальность). Задайте URL камеры. Нажмите на кнопку :guilabel:`Создать`. Нажмите на кнопку :guilabel:`Сохранить`. Поставьте флажок :guilabel:`Активный`. При небходимости включите отправку в компонент ``ffsecurity`` только тех лиц, которые были обнаружены внутри интересующей области ``ROI``. При необходимости включите детектирование и отслеживание лиц только внутри заданной прямоугольной области, задав параметр ``ROT``. Используйте данную опцию, чтобы уменьшить нагрузку на ``fkvideo_detector``. Создание группы камер Управление видеокамерами Project-Id-Version: FindFace Security 1.0
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2018-02-06 17:05+0800
PO-Revision-Date: 2018-02-12 16:11+0700
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.5.3
Last-Translator: 
Language-Team: 
Language: en
X-Generator: Poedit 2.0.6
 Navigate to the :guilabel:`Camera groups` tab. In the web interface, go to the :guilabel:`Cameras` tab. In this chapter: Specify the group name. Add a comment. Specify the name of a camera and add it to a group. If necessary, add a comment. To add a camera to a group, do the following: To configure video-based biometric identification, add cameras to FindFace Security, grouping them subject to their location. To create a group of cameras, do the following: Add Camera to Group If you want to deduplicate events from cameras that belong to the same group, i. e. exclude coinciding events, check :guilabel:`Deduplicate` and specify the deduplication timeout (interval between 2 consecutive checks for event uniqueness). Specify the camera URL. Click :guilabel:`Create`. Click :guilabel:`Save`. Check :guilabel:`Active`. If necessary, specify the value of the ``ROI`` parameter to enable posting faces detected only inside a region of interest. If necessary, specify the value of the ``ROT`` parameter to enable detecting and tracking faces only inside a clipping rectangle. You can use this option to reduce the ``fkvideo_detector`` load. Create Group of Cameras Camera Management 
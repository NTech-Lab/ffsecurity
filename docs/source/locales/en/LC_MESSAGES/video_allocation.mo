��          \      �       �   j   �     4  �   N  <     �   Z  ,   E  Q   r  O  �  .     [   C  �   �     ,  �   L     �  )                                          В веб-интерфейсе перейдите на вкладку :guilabel:`Группы камер`. В поле :guilabel:`Метки` создайте или выберите из уже созданных одну или несколько меток для привязки группы камер к экземпляру ``video-worker``. Сохраните изменения. Для обработки видео с группы камер в определенном экземпляре компонента ``video-worker`` выполните следующие действия: Откройте настройки группы камер. Откройте файл конфигурации экземпляра ``video-worker`` и укажите в нем заданные метки в формате ``имя_метки=true`` (``terminal_1`` в примере ниже). Перезапустите ``video-worker``. Привязка группы камер к экземпляру ``video-worker`` Project-Id-Version: FindFace Security 1.0
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2018-10-01 17:13+0700
PO-Revision-Date: 2018-10-01 17:35+0700
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.5.3
Last-Translator: 
Language-Team: 
Language: en
X-Generator: Poedit 2.1.1
 Navigate to the :guilabel:`Camera groups` tab. In the :guilabel:`Labels`, create or select one or several allocation labels. Save changes. FindFace Security allows you to allocate a certain ``video-worker`` instance to process video streams from a camera group. Do the following: Open the camera group settings. Open the ``video-worker`` configuration file and specify the allocation labels in the following format: ``label_name=true`` (label ``terminal_1`` in the example below). Restart ``video-worker``. Allocate ``video-worker`` to Camera Group 
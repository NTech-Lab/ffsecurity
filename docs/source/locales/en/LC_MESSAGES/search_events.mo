��          �            h  �   i       �     �   �  }   M  �   �  ^   �    "  >   ?    ~  �   �  �  M  s   '
  C   �
  z  �
  F   Z     �  Z   �  _     3   h  �   �     #  �   B  '   �  t   �  X   g  �   �  ;   �  0   �            
                                                     	               FindFace Security позволяет выполнять идентификацию лица по базе данных обнаруженных на видео лиц. |search_ru| В интерфейсе база данных представлена списком событий (вкладка :guilabel:`События`). Вместо фотографии можно указать ID события, лицо из которого нужно найти в базе данных. Для идентификации лица по базе данных выполните следующие действия: Загрузите фотографию. Фотография будет отображена в одноименном поле. Если на фотографии присутствует несколько лиц, выберите нужное. Идентификация лица по базе данных обнаруженных лиц Нажмите :guilabel:`Поиск`. Результаты поиска будут отображены ниже. Для каждого найденного лица будет указана вероятность его совпадения с лицом на фотографии. Перейдите на вкладку :guilabel:`Поиск`. По умолчанию в результатах поиска отображаются лица, степень схожести которых с искомым равна или превышает 0.75. При необходимости измените данное значение. При необходимости укажите группу камер и период времени, в течение которого произошло событие. Результаты поиска могут быть отсортированы как в порядке уменьшения степени схожести лиц, так и по дате события (сначала самые последние события). Выберите нужную опцию в списке :guilabel:`Сортировка`: :guilabel:`Точность распознавания` или :guilabel:`Дата` соответственно. Укажите максимальное количество событий в результатах поиска. Укажите место поиска: :guilabel:`События`. Project-Id-Version: FindFace Security 1.0
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2018-08-30 17:45+0700
PO-Revision-Date: 2018-08-30 17:46+0700
Last-Translator: 
Language: en
Language-Team: 
Plural-Forms: nplurals=2; plural=(n != 1);
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.5.3
X-Generator: Poedit 2.1.1
 FindFace Security allows you to search the database of detected faces. |search_en| You can access this database by navigating to the event list (the :guilabel:`Events` tab). Instead of a photo, you can specify the ID of an event that features the face you want to find. To find a face in the event list, do the following: Upload a photo. It will be displayed in the :guilabel:`Photo` area. If there are multiple faces in the image, select the one you want. Search for Faces in Event List Click :guilabel:`Search`. You will see the search results appear below. For each face found, the matching confidence level is provided. Navigate to the :guilabel:`Search` tab. By default, the system searches for faces using the identification threshold 0.75. If necessary, set your own value. (Optional) Specify a group of cameras and a time period within which the event occurred. You can sort the search results by face similarity (in descending order), or by event date (first the most recent events). Select the sorting method from the :guilabel:`Sort` list: :guilabel:`Confidence` or :guilabel:`Date` respectively. Specify the maximum number of events in the search results. Select a database to search: :guilabel:`Events`. 
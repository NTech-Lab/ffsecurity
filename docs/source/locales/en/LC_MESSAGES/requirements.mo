��          �            h  	  i  �  s  "     �  :     -  L  E  o  �  '   	     *	     ;	  �   H	     C
  '   V
     ~
  z  �
  �     �   �     �    �     �  �   �  �   Y     .     ?     K  �   O     �     �     �                 	              
                                                 FindFace Security развертывается на одиночном сервере или нескольких серверах. Для расчета характеристик сервера(ов) используйте следующие требования: Intel Xeon E5 c поддержкой AVX или аналогичный ему процессор. Характеристики зависят от количества камер. Для одной камеры ``1080p@25FPS`` требуется 2 ядра с HT с частотой >2 ГГц под обработку видео и 2 ядра с HT c частотой >2ГГц под распознавание лиц. Ubuntu 16.04 LTS (64-битная) Для улучшения качества работы системы при использовании камер с разрешением более ``1920x1080p`` настоятельно рекомендуется установить версию FindFace Security с обработкой видео на GPU. Для получения GPU-версии обратитесь к менеджеру Ntech Lab или в службу технической поддержки (info@ntechlab.com). Жесткий диск Минимальная конфигурация, необходимая для обработки 1 видеопотока 720p (1280×720) 25 FPS, состоит из процессора INTEL Core i5 6-го поколения с 4-мя физическими ядрами 2,8 ГГц и 6 ГБ оперативной памяти. На собственные нужды операционной системы и FindFace Security требуется 10 ГБ. Суммарный объем определяется в зависимости от требуемой глубины архива событий в базе данных и в логе из расчета 1.5 Мб на 1 событие. Операционная система Описание Память Потребление памяти зависит от количества камер. Для одной камеры ``1080p@25FPS`` требуется 4 ГБ под обработку видео и 4 ГБ под распознавание лиц. Процессор Системные требования Требование Project-Id-Version: FindFace Security 1.0
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2018-10-31 19:54+0700
PO-Revision-Date: 2018-10-31 19:55+0700
Last-Translator: 
Language: en
Language-Team: 
Plural-Forms: nplurals=2; plural=(n != 1);
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.5.3
X-Generator: Poedit 2.1.1
 FindFace Security can be deployed on a single host (standalone) or in a cluster environment. To calculate the host(s) characteristics, use the following requirements: Intel Xeon E5 with AVX support or similar CPU. The characteristics depend on the number of cameras in use. A single camera ``1080p@25FPS`` requires 2 cores HT >2 GHz for video processing and 2 cores HT >2 GHz for face recognition. Ubuntu 16.04 LTS (x64) If the resolution of cameras in use is more than `` 1920x1080p``, it is strongly recommended to deploy FindFace Security from the GPU-accelerated package. Contact your Ntech Lab manager or Ntech Lab support experts to request the package (info@ntechlab.com). HDD The minimum configuration to process a video stream 1x720p (1280×720) 25 FPS is 6th generation INTEL Core i5 CPU with 4 physical cores 2,8 GHz, and 6 GB RAM. The own needs of the operating system and FindFace Security require 10 GB. The total volume is subject to the required depth of the event archive in the database and in the log, at the rate of 1.5 Mb per 1 event. Operating system Description RAM Depends on the number of cameras in use. A single camera ``1080p@25FPS`` requires 4 GB for video processing and 4 GB for face recognition. CPU System Requirements Requirement 
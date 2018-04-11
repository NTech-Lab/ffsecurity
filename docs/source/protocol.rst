.. _https:

*******************************************
Приложение. Настройка шифрования данных
*******************************************

Для обеспечения безопасности данных включите SSL-шифрование. Выполните следующие действия:

#. В директории с конфигурацией nginx создайте каталог для хранения информации о SSL-шифровании:

   .. code::

      sudo mkdir /etc/nginx/ssl

#. Создайте ключ и сертификат SSL:

   .. code::

      sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/nginx.crt

   Для заполнения полей сертификата вам будет предложено несколько вопросов. Ответьте на них, уделив особое внимание строке ``Common Name``. В ней нужно ввести имя или публичный IP-адрес домена, связанного с сервером.  Созданные файлы ключа ``nginx.key`` и сертификата ``nginx.crt`` будут сохранены в каталоге ``/etc/nginx/ssl``.

#. Настройте nginx для использования SSL. Откройте файл конфигурации nginx. Добавьте в него строку ``listen 443 ssl`` и данные о сертификате ``ssl_certificate`` и ключе ``ssl_certificate_key`` (отмечены знаком комментария ## в примере ниже). 

   .. code::

      sudo vi /etc/nginx/nginx.conf

      server {
              listen 80 default_server;
              listen [::]:80 default_server ipv6only=on;
              
              ##
              listen 443 ssl;

              root /usr/share/nginx/html;
              index index.html index.htm;

              server_name your_domain.com;
              ##
              ssl_certificate /etc/nginx/ssl/nginx.crt;
              ##
              ssl_certificate_key /etc/nginx/ssl/nginx.key;

              location / {
                      try_files $uri $uri/ =404;
              }
      }

#. Перезапустите nginx.

   .. code::

      sudo service nginx restart

#. Внесите изменения в файл конфигурации ``ffsecurity``. В параметре ``EXTERNAL_ADDRESS`` измените приставку ``http://`` на ``https://``.

   .. code::

      sudo vi /etc/ffsecurity/config.py
 
      EXTERNAL_ADDRESS="https://192.168.104.204"




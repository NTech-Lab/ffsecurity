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

      sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/my-example-domain.com.key -out /etc/nginx/ssl/my-example-domain.com.crt

   Для заполнения полей сертификата вам будет предложено несколько вопросов. Ответьте на них, уделив особое внимание строке ``Common Name``. В ней нужно ввести имя или публичный IP-адрес домена, связанного с сервером.  Созданные файлы ключа ``my-example-domain.com.key`` и сертификата ``my-example-domain.com.crt`` будут сохранены в каталоге ``/etc/nginx/ssl``.

#. Настройте nginx для использования SSL. Откройте файл конфигурации nginx. Скопируйте в него код из примера ниже. 

   .. code::

      sudo vi /etc/nginx/nginx.conf

      # redirect from http to https version of the site
      server {
              listen 80; 
              server_name my-example-domain.com www.my-example-domain.com;
              rewrite ^(.*) https://my-example-domain.com$1 permanent;
              access_log off;
      }

      server {
              listen 443 ssl;
              server_name my-example-domain.com;

              ssl_certificate     /etc/nginx/ssl/my-example-domain.com.crt;
              ssl_certificate_key /etc/nginx/ssl/my-example-domain.com.key;

              root /usr/share/ffsecurity-ui

              location / { 
                      try_files $uri $uri/ @ffsec;
              }   

              location @ffsec {
                      proxy_pass http://127.0.0.1:8002;
              }   
      }

#. Перезапустите nginx.

   .. code::

      sudo service nginx restart

#. Внесите изменения в файл конфигурации ``ffsecurity``. В параметре ``EXTERNAL_ADDRESS`` измените приставку ``http://`` на ``https://``.

   .. code::

      sudo vi /etc/ffsecurity/config.py
 
      EXTERNAL_ADDRESS="https://my-example-domain.com"




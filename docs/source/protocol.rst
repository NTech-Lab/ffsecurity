.. _https:

******************************************************
Приложение. Настройка шифрования данных в ОС Ubuntu
******************************************************

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

      upstream ffsecurity {
              server 127.0.0.1:8002;
      }

      # redirect from http to https version of the site
      server {
              listen 80;
              server_name domain.ru www.domain.ru;
              rewrite ^(.*) https://domain.ru$1 permanent;
              access_log off;
      }

      server {
              listen 443 ssl;

              ssl_certificate     /etc/nginx/ssl/domain.pem;
              ssl_certificate_key /etc/nginx/ssl/domain.key;

              root /var/lib/ffsecurity;

              autoindex off;

              server_name domain.ru;
        
              location @ffsec {
                      proxy_set_header Host $http_host;
                      proxy_set_header X-Forwarded-For $remote_addr;
                      proxy_set_header X-Forwarded-Proto $scheme;
                      proxy_http_version 1.1;
                      proxy_set_header Upgrade $http_upgrade;
                      proxy_set_header Connection "upgrade";
                      proxy_pass http://ffsecurity;
              }

               location /static/ {
              }
              location /uploads/ {
                      add_header 'Access-Control-Allow-Origin' '*';
                      add_header 'Access-Control-Allow-Methods' 'GET';
                      add_header 'Access-Control-Allow-Headers' 'DNT,User-Agent,X-Requested-With,If-Modified-Since,Cache-Control,Content-Type,Range,Authorization';
                      add_header 'Access-Control-Expose-Headers' 'Content-Length,Content-Range';
                      add_header 'Access-Control-Max-Age' 2592000;
              }
              location /ui-static/ {
                      alias /usr/share/ffsecurity-ui/ui-static/;
              }
              location /doc/ {
                      alias /opt/ffsecurity/doc/;
              }
              location / {
                      try_files $uri $uri/ @ffsec;
                      client_max_body_size 100m;
                      alias /usr/share/ffsecurity-ui/;

              }
      }

#. Перезапустите nginx.

   .. code::

      sudo service nginx restart

#. Внесите изменения в файл конфигурации ``ffsecurity``. В параметре ``EXTERNAL_ADDRESS`` измените приставку ``http://`` на ``https://``.

   .. code::

      sudo vi /etc/ffsecurity/config.py
 
      EXTERNAL_ADDRESS="https://my-example-domain.com"

#. Если есть запущенные процессы ``findface-video-worker``, нужно либо пересоздать камеры в веб-интерфейсе, либо изменить значение параметра ``router_url`` в job-заданиях, заменив приставку ``http://`` на ``https://``. Это можно сделать с помощью команды, аналогичной следующей:

   .. code::

      curl -s localhost:18810/jobs | jq -r '.[]‌‌["id"]' | xargs -I {} curl -X PATCH -d '{"router_url": "https://domain.ru/video-detector/frame"}' http://localhost:18810/job/{}


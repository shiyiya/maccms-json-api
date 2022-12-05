# maccms-json-api

## docker

docker-compose up
docker-compose up --build

## brew

brew install nginx
brew tap shivammathur/php
brew install shivammathur/php/php@7.3
brew services restart shivammathur/php/php@7.3

```bash
➜  ~ cat /opt/homebrew/etc/nginx/servers/maccms.conf
server {
    listen    8080;

    #server_name  www.test.com;

    root /Users/g/code/maccms-restful/maccms10;

    index index.php index.html;

    location / {
        try_files $uri $uri/ /index.php?$query_string;
        autoindex on;
    }

    #access_log /usr/local/var/log/www.test.com-access.log main;
    #error_log /usr/local/var/log/www.test.com-error.log error;

    location ~ \.php$ {
        fastcgi_pass     127.0.0.1:9000;
        fastcgi_index    index.php;
        include          fastcgi_params;
        fastcgi_param    SCRIPT_FILENAME  $document_root$fastcgi_script_name;
    }
}
```

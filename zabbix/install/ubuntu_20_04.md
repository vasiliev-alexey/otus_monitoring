## **Установка Zabbix на Ubuntu**

[Основная документация по устновке]( https://www.zabbix.com/ru/download?zabbix=5.0&os_distribution=ubuntu&os_version=20.04_focal&db=postgresql&ws=nginx)


Расмотрим напримере Ubuntu


- Установите репозиторий Zabbix 

    wget https://repo.zabbix.com/zabbix/5.0/ubuntu/pool/main/z/zabbix-release/zabbix-release_5.0-1+focal_all.deb
    dpkg -i zabbix-release_5.0-1+focal_all.deb
    apt update 

- Установите Zabbix сервер, веб-интерфейс и агент 

    apt install zabbix-server-pgsql zabbix-frontend-php php7.4-pgsql zabbix-nginx-conf zabbix-agent 


- Устналиваем postgresql

     Create the file repository configuration:  

        sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'

     Import the repository signing key:

        wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -

     Update the package lists:

        sudo apt-get update

    Install the latest version of PostgreSQL.
     If you want a specific version, use 'postgresql-12' or similar instead of 'postgresql':

        sudo apt-get install postgresql

    -  Создайте базу данных 
    Выполните следующие комманды на хосте, где будет распологаться база данных. 

      sudo -u postgres createuser --pwprompt zabbix
      sudo -u postgres createdb -O zabbix zabbix 

    На хосте Заббикс сервера импортируйте начальную схему и данные. Вам будет предложено ввести недавно созданный пароль. 

        zcat /usr/share/doc/zabbix-server-pgsql*/create.sql.gz | sudo -u zabbix psql zabbix 


- Настройте базу данных для Zabbix  
Отредактируйте файл /etc/zabbix/zabbix_server.conf 

        DBPassword=password

- Настройте PHP для веб-интерфейса  
Отредактируйте файл /etc/zabbix/nginx.conf, раскомментируйте и настройте директивы 'listen' и 'server_name'. 

        listen 80;
        server_name zabbix.local; 

    Отредактируйте файл /etc/zabbix/php-fpm.conf, раскомментируйте строку и укажите свой часовой пояс 

        ; php_value[date.timezone] = Europe/Moscow 

- Запустите процессы Zabbix сервера и агента  
    Запустите процессы Zabbix сервера и агента и настройте их запуск при загрузке ОС. 

        systemctl restart zabbix-server zabbix-agent nginx php7.4-fpm
        systemctl enable zabbix-server zabbix-agent nginx php7.4-fpm 

-  Настройте веб-интерфейс Zabbix   
    Откройте установленный веб-интерфейс Zabbix: 

        http://server_ip_or_name

 
## ДЗ: Настройка zabbix, создание LLD, оповещение на основе триггеров

0. Разворачиваем zabbix  через [docker-compose](../zabbix/install/docker-compose_v3_ubuntu_pgsql_latest.yaml.yaml)
1. Cоздаем [скрипт](../zabbix/alert/produce.sh). отдающий через  zabbix_sender  метрики на zabbix сервер
2. [Регистрируем локальный хост](./img/z_srv_reg.png)  как наблюдаемый узел в Zabbix
3. Создаем [наблюдаемые метрики](./img/z-metrics.png)
4. Создаем [триггер](./img/z-metrics.png) для оповещеия 
5. Создаем бота по [инструкции](https://git.zabbix.com/projects/ZBX/repos/zabbix/browse/templates/media/telegram)
6. Настраиваем [канал публикации аллертов](./img/z-tlgr-stt.png) 
7. Настраиваем [действие по оповещению](./img/z_tlg_act_1.png) и [операции](./img/z_tlg_act_1.png)
8. Высталяем [пользователю тип оповещения](./img/z_user_tlgr_type.png) 
9. Тестируем - [работает](./img/z_tlgr_notif.png)

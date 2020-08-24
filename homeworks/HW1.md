## ДЗ: Настройка zabbix, создание LLD, оповещение на основе триггеров

0. Разворачиваем zabbix  через [docker-compose](../zabbix/install/docker-compose_v3_ubuntu_pgsql_latest.yaml.yaml)
1. Cоздаем [скрипт](../zabbix/alert/produce.sh). отдающий через  zabbix_sender  метрики на zabbix сервер
2. [Регистрируем локальный хост](./img/z_srv_reg.png)  как наблюдаемый узел в Zabbix
3. [Создаем правила обнаружения](./img/z-2020-08-24_11-33-08.png)
4. Создаем [наблюдаемые метрики](./img/z-metrics.png)
5. Создаем [триггер](./img/z-metrics.png) для оповещеия 
6. Создаем бота по [инструкции](https://git.zabbix.com/projects/ZBX/repos/zabbix/browse/templates/media/telegram)
7. Настраиваем [канал публикации аллертов](./img/z-tlgr-stt.png) 
8. Настраиваем [действие по оповещению](./img/z_tlg_act_1.png) и [операции](./img/z_tlg_act_1.png)
9. Высталяем [пользователю тип оповещения](./img/z_user_tlgr_type.png) 
10. Тестируем - [работает](./img/z_tlgr_notif.png)

11. Графики [наблюдений машины](./img/z-2020-08-24_11-29-05.png)




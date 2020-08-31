# Хранения данных в Prometheus

##
В данном дз предлагается использовать Vikotoria metrics:

* Для успешного выполнения дз вам достаточно развернуть один инстанс Viktoria metrics. При это вам нельзя использовать docker образ. Viktoria metrics должна управляться при помощи Systemd.

* Далее вам предстоит настроить remote write самого prometheus и подключить новый data source для Grafana.

* В качестве результата дз вам нужно приложить часть конфига prometheus с описанием remote write и Systemd unit file для Viktoria metrics в примечание для преподавателя. Так же приложите скриншот дашборда любого экспортера использующий в качестве datasource Viktoria metrics. 

## Установка Victoria metrics

1. Качаем бинарный файл  со [страницы релизов](https://github.com/VictoriaMetrics/VictoriaMetrics/releases)

2. Кладем его в дирреотрию и даем права на исполнение
    ~~~ sh
    chmod +x victoria-metrics-prod  
    ~~~

3. Создаем каталог для хранения данных

    ~~~ sh
    mkdir $VM/data
    ~~~

4. Можно запустить локально бинарь с передачей аргументов

    ~~~ sh
    victoria-metrics-prod -storageDataPath /lab/victoria-metrics/data -retentionPeriod 12
    ~~~

    * storageDataPath /lab/victoria-metrics/data - каталог для хранения на Storage
    * retentionPeriod 12 - период хранения в днях

5. пишем свой [Unit файл](../victoria-metrics/victoria-metrics.service)

~~~ sh
    [Unit]
    Description=victoria-metrics
    Documentation=
    After=network-online.target

    [Service]
    LimitNOFILE=65536
    ExecStart=/lab/victoria-metrics/victoria-metrics-prod -storageDataPath /lab/victoria-metrics/ -retentionPeriod 12
    KillMode=control-group
    Restart=on-failure

    [Install]
    WantedBy=multi-user.target
    Alias=victoria-metrics.service
~~~
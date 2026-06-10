# Docker BI Homework

Решение находится в папке `HW`.

## Запуск

cd HW

./run.sh build_generator
./run.sh run_generator

./run.sh build_reporter
./run.sh run_reporter

После запуска файлы будут созданы в папке `data`:

data/data.csv
data/report.html

## Дополнительные команды

./run.sh create_local_data
./run.sh structure
./run.sh clear_data
./run.sh inside_generator
./run.sh inside_reporter

## Запуск отчёта через веб-сервер

./run.sh report_server

После запуска во вкладке Ports появится порт 8080. Откройте его forwarded URL и добавьте в конец:

/report.html

Итоговый адрес будет выглядеть так:

<forwarded-url>/report.html
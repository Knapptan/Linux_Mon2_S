#!/bin/bash
if [ $# != 0 ] ; then
    echo "Error: Не принимаются аргументы командной строки"
    exit 1
fi


html_output="logs_report.html"  # Имя файла для вывода отчета в формате HTML

if ! [[ -n $(dpkg -l | grep goaccess) ]];  # Проверка наличия пакета goaccess
then sudo apt install -y goaccess  # Установка goaccess, если он не установлен
fi

sudo touch $html_output && chmod 777 $html_output  # Создание и разрешение для файла вывода отчета
goaccess ../04/logs/access_*.log --log-format=COMBINED -o ./$html_output  # Генерация отчета с использованием goaccess
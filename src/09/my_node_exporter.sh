#!/bin/bash

while true; do
    # Получение метрик
    cpu_usage=$(top -b -n 1 | awk '/%Cpu/{print $2}')
    memory_usage=$(free -m | awk '/Mem/{printf "%.2f", $3/$2*100}')
    disk_usage=$(df -h / | awk '/\//{print $5}')

    # Формирование HTML-страницы
    cat <<EOF > my_metrics.html
# HELP cpu_usage CPU Usage
# TYPE cpu_usage gauge
cpu_usage $cpu_usage

# HELP memory_usage Memory Usage
# TYPE memory_usage gauge
memory_usage $memory_usage

# HELP disk_usage Disk Usage
# TYPE disk_usage gauge
disk_usage $disk_usage
EOF

    # Пауза перед следующим обновлением (5 секунды)
    sleep 5
done

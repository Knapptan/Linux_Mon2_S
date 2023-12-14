#!/bin/bash

# Проверяем переданный аргументы
if [[ $# < 1 ]]; then
    echo "Неправильный аргумент. Используйте 1, 2 или 3."
    exit 1
elif [ "$1" == "1" ]; then
    chmod +x cleanup_by_log.sh
    ./cleanup_by_log.sh "$2"
elif [ "$1" == "2" ]; then
    # Пример вызова: ./main.sh 2 "01.01.22 00:00" "01.01.22 23:59"
    chmod +x cleanup_by_datetime.sh
    ./cleanup_by_datetime.sh "$2" "$3"
elif [ "$1" == "3" ]; then
    chmod +x cleanup_by_mask.sh
    ./cleanup_by_mask.sh
else
    echo "Неправильный аргумент. Используйте 1, 2 или 3."
    exit 1
fi

echo "Cleanup completed."

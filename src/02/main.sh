#!/bin/bash

file_log="file_log.txt"

start_date="$(date +"%d.%m.%y %H:%M:%S")"
get_start="$(date +%s)"
echo "Start: $start_date"
echo "Start: $start_date" >> "$file_log"

# Проверка наличия необходимого числа аргументов
if [[ "$#" -ne 3 ]]; then
    echo "Ошибка: нужно минимум 3 параметра"
    echo "Пример: ./main.sh az az.az 3Mb"
    exit 1
fi

chmod +x check_args.sh
./check_args.sh "$@"
chmod +x create.sh
./create.sh "$@"

end="$(date +%s)"
end_date="$(date +"%d.%m.%y %H:%M:%S")"
echo "Finish: $end_date"
echo "Finish: $end_date" >> "$file_log"
echo "Script execution time (in seconds) = $(($end - $get_start))"
echo "Script execution time (in seconds) = $(($end - $get_start))" >> "$file_log"

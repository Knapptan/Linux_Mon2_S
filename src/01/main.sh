#!/bin/bash

# Проверка количества  аргументов функций
if [ "$#" -ne 6 ]; then
    echo "Ошибка: Необходимо передать ровно 6 параметров."
    exit 1
fi
chmod +x check_args.sh
./check_args.sh "$@"
# Вызов скрипта для создания папок
chmod +x create.sh
./create.sh "$@"
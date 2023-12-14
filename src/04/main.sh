#!/bin/bash

# Проверяем что аргументы отсутствуют
if [[ $# < 1 ]]; then
    mkdir -p logs
    chmod +x generate_random_log.sh
    ./generate_random_log.sh
    exit 1
else
    echo "Неправильный аргумент. Не используйте аргументы."
fi

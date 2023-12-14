#!/bin/bash

read -p "Введите до файла логов для удаления : " log_file

deleted_files=0
deleted_folders=0

if [ ! -f "$log_file" ]; then
echo "ОШИБКА: Лог файл не найден!"  # Выводим сообщение об ошибке, если лог-файл не найден
return 1  # Возвращаем код ошибки 1
fi

while IFS= read -r line; do
    if [[ $line =~ "Directory:" ]]; then
        directory=$(echo "$line" | awk '{print $2}')
        if [ -e "$directory" ]; then
            sudo rm -r "$directory" 2>/dev/null
            deleted_folders=$((deleted_folders + 1))
            echo "Deleted directory: $directory"
        fi
    elif [[ $line =~ "File:" ]]; then
        file=$(echo "$line" | awk '{print $2}')
        if [ -e "$file" ]; then
            sudo rm "$file" 2>/dev/null
            deleted_files=$((deleted_files + 1))
            echo "Deleted file: $file"
        fi
    fi
done < "$log_file"

echo "Total deleted files: $deleted_files"
echo "Total deleted folders: $deleted_folders"

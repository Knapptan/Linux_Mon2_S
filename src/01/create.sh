#!/bin/bash

free_mem() {
    size_mem=$(df -h --output=avail / | tail -1)
    if [[ ${size_mem: -1} == "M" ]]; then
        echo "Свободного места осталось - 1 GB. Нужно больше места для продолжения."
        exit
    fi
}

base_path="$1"
num_folders="$2"
folder_chars="$3"
num_files="$4"
file_chars="$5"
file_size="${6%"kb"}" 
date="$(date +%d%m%y)"
log_file="file_log.txt"

folder_name_length=4  # Начальная длина имени папки
for ((i = 0; i < $num_folders; i++)); do
    free_mem
    file_name_length=4  # Начальная длина имени файла
    folder_name=""
    for ((j = 0; j < folder_name_length; j++)); do
        if [[ $j < ${#folder_chars} ]]; then
            folder_name+=${folder_chars:j:1}
        else
            folder_name+=${folder_chars: -1}  # Если достигнут конец списка, добавляем последний символ
        fi
    done
    folder_name_length=$((folder_name_length + 1)) # Увеличиваем длину имени на каждой итерации
    unique_folder_name="${folder_name}_${date}"  # Уникальное имя папки

    folder_path="${base_path}/${unique_folder_name}"

    sudo mkdir -m777 "$folder_path" 2>/dev/null
    echo "Directory: $folder_path" >> "$log_file"
    for ((k = 0; k < $num_files; k++)); do
        free_mem
        file_name=""
        for ((j = 0; j < file_name_length; j++)); do
            if [[ $j < ${#folder_chars} ]]; then
                file_name+=${folder_chars:j:1}
            else
                file_name+=${folder_chars: -1}  # Если достигнут конец списка, добавляем последний символ
            fi
        done
        file_name_length=$((file_name_length + 1)) # Увеличиваем длину имени на каждой итерации
        unique_file_name="${file_name}_${date}"  # Уникальное имя файла
        file_name="${unique_file_name}${file_chars: -3}"

        sudo fallocate -l "${file_size}KB" "$folder_path/$file_name" 2>/dev/null
        sudo chmod 744 "$folder_path/$file_name"
        echo "File: $folder_path/$file_name $date $(($file_size))kb" >> "$log_file"
    done
done


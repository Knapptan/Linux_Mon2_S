#!/bin/bash

clean_by_mask() {
  read -p "Введите маску имени для удаления : " name_mask  # Запрашиваем у пользователя маску имени для удаления
  if [ -z "$name_mask" ]; then  # Проверяем, не пустая ли маска имени
    echo "ОШИБКА: Маска имени не может быть пустой!"  # Выводим сообщение об ошибке, если маска имени пустая
    return 1  # Возвращаем код ошибки 1
  fi
  find / -name "$name_mask" -exec rm -rf {} \; 2>/dev/null  # Ищем и удаляем файлыи папки, соответствующие маске имени
}

# Проверяем переданный аргумент
if [ "$#" -eq 0 ]; then
    clean_by_mask "$1"
else
    echo "Неправильное количество аргументов. Используйте: ./clean_by_mask.sh"
    exit 1
fi

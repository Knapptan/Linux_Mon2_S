#!/bin/bash

# Функция для удаления файлов и папок на основе даты и времени создания
function cleanup_by_datetime() {
  read -p "Введите дату и время начала(Формат: YYYY-mm-dd HH:MM): " start_time  # Запрашиваем у пользователя время начала
  read -p "Введите дату и время конца (Формат: YYYY-mm-dd HH:MM): " finish_time  # Запрашиваем у пользователя время окончания
  check_datetime_format "$start_time" || { echo "ОШИБКА: Некорректный формат даты и времени начала!"; return 1; }  # Проверяем формат времени начала
  check_datetime_format "$finish_time" || { echo "ОШИБКА: IНекорректный формат даты и времени конца!"; return 1; }  # Проверяем формат времени окончания
  find / -newerct "$start_time" ! -newerct "$finish_time" -exec sudo rm -rf {} \; 2>/dev/null  # Ищем и удаляем файлы и папки, созданные в указанном временном диапазоне
  echo "Удаление выполнено!"  # Выводим сообщение о завершении удаления
}

# Функция для проверки формата даты и времени

function check_datetime_format() {
  local datetime="$1"
  if [[ ! $datetime =~ ^[0-9]{4}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[01])\ (0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]$ ]]; then  # Проверяем, соответствует ли формат даты и времени указанному шаблону YYYY-mm-dd HH:MM
    return 1  # Возвращаем код ошибки 1, если формат некорректный
  fi
  return 0  # Возвращаем успешный код, если формат корректный
}

# Проверяем переданные аргументы
if [ "$#" > 0 ]; then
    cleanup_by_datetime
    echo "Total deleted files: $deleted_files"
else
    echo "Неправильное количество аргументов. Используйте: ./clean_by_date.sh"
    exit 1
fi

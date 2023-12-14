#!/bin/bash

# Проверка абсолютного пути
if [ ! -d "$1" ]; then
    echo "Ошибка: Первый параметр должен быть абсолютным путем к директории."
    exit 1
fi

# Проверка количества вложенных папок
if ! [[ "$2" =~ ^[1-9][0-9]*$ ]]; then
    echo "Ошибка: Второй параметр должен быть положительным целым числом."
    exit 1
fi

# Проверка списка букв для названия папок
if ! [[ "$3" =~ ^[a-zA-Z]{1,7}$ ]]; then
    echo "Ошибка: Третий параметр должен быть строкой из букв английского алфавита (не более 7 символов)."
    exit 1
fi

# Проверка количества файлов в каждой папке
if ! [[ "$4" =~ ^[1-9][0-9]*$ ]]; then
    echo "Ошибка: Четвертый параметр должен быть положительным целым числом."
    exit 1
fi

# Проверка списка букв для имени файла и расширения
if ! [[ "$5" =~ ^[a-zA-Z]{1,7}\.[a-zA-Z]{1,3}$ ]]; then
    echo "Ошибка: Пятый параметр должен быть строкой в формате 'X.X', где X - буквы английского алфавита (не более 7 символов для имени и 3 символов для расширения)."
    exit 1
fi

# Проверка размера файлов
if ! [[ "$6" =~ ^([1-9]|[1-9][0-9]|100)kb$ ]]; then
    echo "Ошибка: Шестой параметр должен быть в формате, например, '3kb', '100kb', '1kb' и т.д., не превышая 100kb."
    exit 1
fi
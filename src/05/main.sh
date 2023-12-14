#!/bin/bash

type_print="$1"

if [[ $type_print -eq 1 ]]; then 
    echo "1 День..."
     sort -k2 ../04/logs/access_1.log  
      echo "2 День..."
     sort -k2 ../04/logs/access_2.log 
      echo "3 День..."
     sort -k2 ../04/logs/access_3.log 
      echo "4 День..."
     sort -k2 ../04/logs/access_4.log 
      echo "5 День..."
     sort -k2 ../04/logs/access_5.log 
elif [[ $type_print -eq 2 ]]; then
    echo "Уникальные IP-адреса из access_1.log:"
    awk '{print $1}' ../04/logs/access_1.log  | sort -u
    echo "Уникальные IP-адреса из access_2.log:"
    awk '{print $1}' ../04/logs/access_2.log  | sort -u
    echo "Уникальные IP-адреса из access_3.log:"
    awk '{print $1}' ../04/logs/access_3.log  | sort -u
    echo "Уникальные IP-адреса из access_4.log:"
    awk '{print $1}' ../04/logs/access_4.log  | sort -u
    echo "Уникальные IP-адреса из access_5.log:"
    awk '{print $1}' ../04/logs/access_5.log  | sort -u
elif [[ $type_print -eq 3 ]]; then
    echo " Все запросы с ошибками (код ответа - 4хх или 5хх) из access_1.log:"
    awk '$8 ~ /^[45][0-9][0-9]$/ {print $7}' ../04/logs/access_1.log
     echo " Все запросы с ошибками (код ответа - 4хх или 5хх) из access_2.log:"
    awk '$8 ~ /^[45][0-9][0-9]$/ {print $7}' ../04/logs/access_2.log
     echo " Все запросы с ошибками (код ответа - 4хх или 5хх) из access_3.log:"
    awk '$8 ~ /^[45][0-9][0-9]$/ {print $7}' ../04/logs/access_3.log
     echo " Все запросы с ошибками (код ответа - 4хх или 5хх) из access_4.log:"
    awk '$8 ~ /^[45][0-9][0-9]$/ {print $7}' ../04/logs/access_4.log
     echo " Все запросы с ошибками (код ответа - 4хх или 5хх) из access_5.log:"
    awk '$8 ~ /^[45][0-9][0-9]$/ {print $7}' ../04/logs/access_5.log
elif [[ $type_print -eq 4 ]]; then
    echo " Уникальные IP(код ответа - 4хх или 5хх) из access_1.log:"
    awk '$8 ~ /^[45][0-9][0-9]$/ {print $1}' ../04/logs/access_1.log | sort -u
    echo " Уникальные IP(код ответа - 4хх или 5хх) из access_2.log:"
    awk '$8 ~ /^[45][0-9][0-9]$/ {print $1}' ../04/logs/access_2.log | sort -u
    echo " Уникальные IP(код ответа - 4хх или 5хх) из access_3.log:"
    awk '$8 ~ /^[45][0-9][0-9]$/ {print $1}' ../04/logs/access_3.log | sort -u
    echo " Уникальные IP(код ответа - 4хх или 5хх) из access_4.log:"
    awk '$8 ~ /^[45][0-9][0-9]$/ {print $1}' ../04/logs/access_4.log | sort -u
    echo " Уникальные IP(код ответа - 4хх или 5хх) из access_5.log:"
    awk '$8 ~ /^[45][0-9][0-9]$/ {print $1}' ../04/logs/access_5.log | sort -u
    
else
  echo "Некорректный параметр"  # Выводим сообщение об ошибке, если параметр некорректный
fi
#! /bin/bash

if [[ $# -ne 0 ]]; then
  echo "Ошибка: не испоьзуйте аргументов"
else
  chmod +x my_node_exporter.sh
  ./my_node_exporter.sh
fi
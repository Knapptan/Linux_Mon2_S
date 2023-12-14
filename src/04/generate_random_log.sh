
# Функция для случайного выбора элемента из массива
random_element() {
    local array=("$@")
    local array_length=${#array[@]}
    local index=$((RANDOM % array_length))
    echo "${array[index]}"
}

# Генерация случайного IP-адреса
generate_ip() {
    echo "$((RANDOM % 256)).$((RANDOM % 256)).$((RANDOM % 256)).$((RANDOM % 256))"
}

# Массивы для кодов ответа, методов, агентов
response_codes=(
  "200 - OK"
  "201 - Created"
  "400 - Bad Request"
  "401 - Unauthorized"
  "403 - Forbidden"
  "404 - Not Found"
  "500 - Internal Server Error"
  "501 - Not Implemented"
  "502 - Bad Gateway"
  "503 - Service Unavailable"
)

# Methods
methods=(
  "GET"
  "POST"
  "PUT"
  "PATCH"
  "DELETE"
)

# User agents
user_agents=(
  "Mozilla"
  "Google Chrome"
  "Opera"
  "Safari"
  "Internet Explorer"
  "Microsoft Edge"
  "Crawler and bot"
  "Library and net tool"
)

# Генерация логов
for i in {1..5}; do
    log_file="logs/access_$i.log"
    num_entries=$((RANDOM % 901 + 100))  # Случайное число записей от 100 до 1000

    for ((j = 0; j < num_entries; j++)); do
        ip=$(generate_ip)
        code=$(random_element "${response_codes[@]}")
        method=$(random_element "${methods[@]}")
        date=$(date -d "2023-12-01 +$i days $((RANDOM % 24)) hours $((RANDOM % 60)) minutes $((RANDOM % 60)) seconds" "+%d/%b/%Y:%H:%M:%S ")
        url="/page_$((RANDOM % 10))"
        agent=$(random_element "${user_agents[@]}")

        log_entry="$ip - - [$date] \"$method HTTP/1.1$url\" $code - \"$agent\""
        echo "$log_entry" >> "$log_file"
    done

    echo "Generated log file: $log_file"
done

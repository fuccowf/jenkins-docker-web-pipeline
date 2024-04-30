# Используйте официальный образ Go как базовый
FROM golang:1.16 as builder

# Установите рабочий каталог
WORKDIR /app

# Скопируйте исходный код
COPY . .

# Соберите приложение
RUN go build -o server server.go

# Используйте образ httpd как финальный
FROM httpd:2.4

# Копируйте собранный бинарный файл из предыдущего шага
COPY --from=builder /app/server /usr/local/apache2/htdocs/

# Запустите сервер
CMD ["./server"]

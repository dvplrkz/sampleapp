#!/bin/bash

# Удаляем старую директорию (если существует)
rm -rf tempdir

# Создаем новую структуру
mkdir -p tempdir/templates
mkdir -p tempdir/static

# Копируем файлы
cp sample_app.py tempdir/.
cp -r templates/* tempdir/templates/.
cp -r static/* tempdir/static/.

# Создаем правильный Dockerfile
cat > tempdir/Dockerfile <<EOF
FROM python:3.11-slim-bullseye

# Установка Flask
RUN pip install --no-cache-dir flask

# Рабочая директория
WORKDIR /app

# Копируем файлы
COPY . .

# Проверка установки Flask
RUN python -c "import flask; print(f'Flask version: {flask.__version__}')"

# Порт и команда запуска
EXPOSE 8080
CMD ["python", "sample_app.py"]
EOF

# Собираем и запускаем контейнер
cd tempdir
docker build -t sampleapp .
docker run -d -p 8080:8080 --name sampleruntst sampleapp
docker ps -a

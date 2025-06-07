FROM python:3.11-slim-bullseye

# Установка Flask в основную среду Python
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

FROM python:3.11-slim

WORKDIR /app

# تثبيت git + بعض الأدوات الأساسية
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

# نسخ الملفات المطلوبة
COPY FINAL/ FINAL/
COPY requirements.txt .
COPY *.session .
COPY main.py .
COPY data.py .

RUN pip install --no-cache-dir -r requirements.txt

CMD ["python", "main.py"]

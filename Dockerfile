FROM python:3.11-slim

WORKDIR /app

# نسخ الملفات المطلوبة
COPY FINAL/ FINAL/
COPY requirements.txt .
COPY *.session .
COPY main.py .
COPY data.py .

RUN pip install --no-cache-dir -r requirements.txt

CMD ["python", "main.py"]

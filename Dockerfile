# صورة كاملة من Python 3.11 (فيها أدوات أكثر من slim)
FROM python:3.11

# تعيين مسار العمل
WORKDIR /app

# تحديث النظام + تثبيت git و ffmpeg
RUN apt-get update && \
    apt-get install -y git ffmpeg && \
    rm -rf /var/lib/apt/lists/*

# نسخ الملفات
COPY FINAL/ FINAL/
COPY requirements.txt .
COPY *.session .
COPY main.py .
COPY data.py .

# تثبيت المتطلبات
RUN pip install --no-cache-dir -r requirements.txt

# تشغيل الملف الرئيسي
CMD ["python", "main.py"]

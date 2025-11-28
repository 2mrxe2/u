# 1) صورة أساسية فيها Python 3.11
FROM python:3.11-slim

# 2) تحديث النظام + تثبيت ffmpeg (ضروري)
RUN apt-get update && apt-get install -y ffmpeg && apt-get clean

# 3) إنشاء مجلد للتطبيق
WORKDIR /app

# 4) نسخ ملفات المشروع كلها
COPY . .

# 5) تثبيت مكتبات بايثون من requirements.txt (لو موجود)
RUN pip install --no-cache-dir -r requirements.txt || true

# 6) تشغيل البوت تلقائيًا عند بدء الحاوية
CMD ["python", "main.py"]

FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Expose Render's standard port
EXPOSE 10000

# Start command for Flask/Gunicorn:
CMD ["gunicorn", "--bind", "0.0.0.0:10000", "app:app"]

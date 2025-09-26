FROM python:3.11-slim

WORKDIR /app

COPY backend/ backend/
COPY frontend/ frontend/
COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 5000

CMD ["python3", "-m", "backend.app"]
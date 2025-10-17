# Dockerfile for serving the FastAPI model
FROM python:3.11-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential gcc libpq-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

# Copy application files
COPY app.py /app/
COPY final_medcost_model.joblib /app/

# Create non-root user
RUN useradd --create-home appuser && chown -R appuser /app
USER appuser

EXPOSE 8000

CMD ["gunicorn", "app:app", "-k", "uvicorn.workers.UvicornWorker", "--workers", "2", "--bind", "0.0.0.0:8000"]

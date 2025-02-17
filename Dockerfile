FROM python:3.13-slim

ENV PYTHONUNBUFFERED=1
WORKDIR /app

COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

COPY . /app/

ENV PORT=8080

CMD exec gunicorn simple_app.wsgi:application \
    --bind :$PORT \
    --workers 1 \
    --threads 8 \
    --timeout 0

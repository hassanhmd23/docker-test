FROM python:3.12-slim

WORKDIR /app

COPY ./requirements.txt ./

RUN pip install --no-cache-dir -r requirements.txt

COPY . ./

CMD exec gunicorn --bind :$8080 --workers 1 --threads 8 --timeout 0 app:app
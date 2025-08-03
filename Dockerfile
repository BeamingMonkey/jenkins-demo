FROM python:3.10-slim

WORKDIR /app
COPY app.py .

EXPOSE 80

CMD ["python", "-m", "http.server", "80"]

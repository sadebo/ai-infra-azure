FROM python:3.10-slim-bullseye

WORKDIR /app
RUN pip install prefect

COPY flow.py .
EXPOSE 4200

CMD ["prefect", "orion", "start", "--host", "0.0.0.0", "--port", "4200"]

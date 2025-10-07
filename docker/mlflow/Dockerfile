FROM python:3.10-slim-bullseye

WORKDIR /app
RUN pip install mlflow[extras]

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 5000
CMD ["/entrypoint.sh"]

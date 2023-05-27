FROM python:3.11-slim

RUN pip3 install mlflow

CMD [ "mlflow", "server", "-h", "0.0.0.0"]
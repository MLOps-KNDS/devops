FROM python:3.11-slim

RUN pip3 install mlflow

CMD mlflow server \
    --host 0.0.0.0 \
    --port 5000

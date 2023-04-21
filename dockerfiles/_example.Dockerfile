# THIS FILE IS ONLY SERVING EXEMPLARY PURPOSES

FROM python:slim

RUN mkdir /app

WORKDIR /app

RUN pip install fastapi && pip install "uvicorn[standard]"

COPY ./main.py /app/

EXPOSE 8000

CMD ["uvicorn", "main:app", "--host=0.0.0.0", "--port=8000"]
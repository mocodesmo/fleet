FROM python:3.9-slim

WORKDIR /app

COPY ./requirements.txt /app/requirements.txt

RUN pip install -r requirements.txt

COPY ./api /app/api
COPY ./crud /app/crud
COPY ./model /app/model
COPY ./pkg /app/pkg
COPY ./main.py /app/main.py

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]

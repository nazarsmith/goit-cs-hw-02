FROM python:3.10

RUN apt update

COPY Pipfile .
RUN python -m pip install pipenv
RUN pipenv install --system --skip-lock

COPY fast-api-service fast-api-service/
WORKDIR fast-api-service

RUN python

ENTRYPOINT ["python", "main.py"]

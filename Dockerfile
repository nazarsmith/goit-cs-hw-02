FROM python:3.10

RUN apt update

COPY Pipfile .
RUN python -m pip install pipenv
RUN pipenv install --system --skip-lock

COPY Computer-Systems-hw02 Computer-Systems-hw02/
WORKDIR Computer-Systems-hw02

RUN python

ENTRYPOINT ["python", "main.py"]

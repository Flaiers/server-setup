FROM python:3.9
ENV PYTHONUNBUFFERED=1
ARG PROJECT_NAME

WORKDIR /usr/projects/${PROJECT_NAME}
COPY . /usr/projects/${PROJECT_NAME}/
RUN pip install -U pip && pip install -r requirements.txt

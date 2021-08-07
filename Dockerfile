FROM python:3.9
ENV PYTHONUNBUFFERED=1

WORKDIR /usr/projects/<project-name>
COPY . /usr/projects/<project-name>/
RUN pip install -U pip && pip install --no-cache-dir -r requirements.txt

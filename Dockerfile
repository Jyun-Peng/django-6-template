FROM python:3.14.2-slim-trixie

ENV PYTHONDONTWRITEBYTECODE=1 \
	PYTHONUNBUFFERED=1

WORKDIR /

ENV DJANGO_VERSION=6.0
ENV DJANGO_PROJECT_NAME=src
ENV DJANGO_PROJECT_DIR=/src

RUN python -m pip install --upgrade pip \
	&& python -m pip install "Django==${DJANGO_VERSION}"

COPY ./requirements.txt /tmp/requirements.txt
RUN pip install --no-cache-dir -r /tmp/requirements.txt \
    && rm /tmp/requirements.txt

RUN django-admin startproject "${DJANGO_PROJECT_NAME}" "${DJANGO_PROJECT_DIR}"

WORKDIR "${DJANGO_PROJECT_DIR}"

EXPOSE 80 443

CMD ["python", "manage.py", "runserver", "0.0.0.0:80"]
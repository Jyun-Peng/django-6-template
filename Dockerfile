FROM python:3.14.2-slim-trixie

ENV PYTHONDONTWRITEBYTECODE=1 \
	PYTHONUNBUFFERED=1

WORKDIR /

# Allow overriding Django/project name at build time.
ARG DJANGO_VERSION=6.0
ARG DJANGO_PROJECT_NAME=src
ARG DJANGO_PROJECT_DIR=/src

RUN python -m pip install --upgrade pip \
	&& python -m pip install "Django==${DJANGO_VERSION}"

# Initialize a Django project at the root of /app inside the image.
# Creates manage.py and the project package directly in /app.
RUN django-admin startproject "${DJANGO_PROJECT_NAME}" "${DJANGO_PROJECT_DIR}"

WORKDIR "${DJANGO_PROJECT_DIR}"

EXPOSE 80 443

CMD ["python", "manage.py", "runserver", "0.0.0.0:80"]
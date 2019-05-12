# Use an official Python runtime as a parent image
FROM python:3.7
LABEL maintainer="trevore23@gmail.com"

# Set environment variables
ENV PYTHONUNBUFFERED 1
ENV DJANGO_SETTINGS_MODULE=app.settings.dev

COPY ./requirements.txt /requirements.txt
# RUN pip install --upgrade pip
# Install any needed packages specified in requirements.txt
RUN pip install -r /requirements.txt

RUN mkdir /app
# Set the working directory to /app
WORKDIR /app
# Copy the current directory contents into the container at /app
COPY ./app /app

# RUN python manage.py migrate - commented out for now to set up custom user

RUN useradd wagtail
RUN chown -R wagtail /app
USER wagtail


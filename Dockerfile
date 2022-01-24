# pull the official base image
FROM python:3.8.3-alpine

# set work directory
WORKDIR /usr/src/app

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# install dependencies
RUN pip install --upgrade pip 
COPY ./requirements.txt /usr/src/app
RUN pip install -r requirements.txt
RUN pip install --no-cache-dir "Django>=3.0,<4"

# copy project
COPY . /usr/src/app

EXPOSE 8001

CMD ["python", "manage.py", "runserver", "0.0.0.0:8001"]
# docker build -t falcon-boilerplate .
# docker run -it -p8000:8000 falcon-boilerplate

FROM python:3.7.3-alpine

RUN apk add --no-cache \
    libev \
    python py-pip \
    python-dev build-base \
&& pip install gevent \
&& apk del python-dev build-base

EXPOSE 8000

COPY gunicorn.config.py /app/gunicorn.config.py

# Add demo app
COPY ./myapp /myapp
WORKDIR /myapp

RUN pip3 install  -r requirements/base.txt
RUN pip3 install -r requirements/testing.txt

CMD ["gunicorn", "-b", "0.0.0.0:8000", "resources.app:api", "--config", "/app/gunicorn.config.py", "--reload", "--max-requests=1"]

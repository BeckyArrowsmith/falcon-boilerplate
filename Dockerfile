# Build:
#   $ docker build -t trakkin . 
#       OPTIONAL: --no-cache
# Run:
#   docker run -p 127.0.0.1:8000:8000 trakkin
FROM python:3.7.2

LABEL maintainer=”BeckyArrowsmith” version=”0.1.0” maintainer_email=”iam@becky.codes”

# Environment setting
ENV APP_ENVIRONMENT staging

COPY ./myapp /myapp
RUN pip install -r /myapp/requirements/testing.txt

# Gunicorn installation
RUN pip install gunicorn gevent

# Gunicorn default configuration
COPY gunicorn.config.py /app/gunicorn.config.py

WORKDIR /myapp

EXPOSE 8000

CMD ["gunicorn", "routing:api","--config", "/app/gunicorn.config.py"]
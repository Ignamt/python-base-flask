FROM python:3.8

COPY {src/,requirements.txt,setup.py,gunciorn.conf.py} /var/sources/.

WORKDIR /var/sources

RUN pip install -U pip setuptools; \
    pip install -r requirements.txt; \
    pip install .

EXPOSE 8080

CMD [gunicorn --config gunciorn_conf.py "app.api:instance_api()"]

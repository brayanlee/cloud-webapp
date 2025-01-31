FROM python:3.10-slim

LABEL maintainer "kevin.lee"

RUN pip install --upgrade pip
RUN mkdir -p /cloud-web

ENV APP_PATH /cloud-web

COPY requirements.txt $APP_PATH/
RUN pip install --no-cache-dir -r $APP_PATH/requirements.txt

COPY app.py $APP_PATH/
COPY templates/ $APP_PATH/templates/
COPY static/ $APP_PATH/static/

EXPOSE 8899

CMD ["python3", "/cloud-web/app.py"]

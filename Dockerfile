FROM python:3.7-alpine
WORKDIR /code
ENV FLASK_APP app.py
ENV FLASK_RUN_HOST 0.0.0.0
RUN apk update
RUN apk upgrade
RUN apk add --no-cache gcc musl-dev linux-headers libffi-dev openssl-dev libgcc

RUN \
   echo 'alias python="/usr/bin/python3"' >> /root/.bashrc && \
   echo 'alias pip="/usr/bin/pip3"' >> /root/.bashrc && \
   source /root/.bashrc
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
COPY . .
CMD ["flask", "run"]

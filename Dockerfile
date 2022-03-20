FROM python:3.10.3-alpine3.15

COPY requirements.txt ./

RUN apk add --no-cache g++ musl-dev libffi-dev libstdc++ && \
    pip install --no-cache-dir -r requirements.txt && \
    rm requirements.txt && \
    apk del g++ musl-dev libffi-dev

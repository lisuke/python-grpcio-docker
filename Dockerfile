FROM python:3.12.4-alpine3.20@sha256:7f15e22f496c65cffbbac5e30e7e98d60f3e3b9cc5ee5d51cf3c55ed604787c8

# checkov:skip=CKV_DOCKER_3:"Allow root user"
# checkov:skip=CKV_DOCKER_2:"No healthcheck"

WORKDIR /app

COPY requirements.txt ./

RUN apk add --no-cache g++ musl-dev libffi-dev libstdc++ 
RUN python -m pip install --upgrade pip
RUN python -m pip install -r requirements.txt
RUN apk del g++ musl-dev libffi-dev

# python is located in venv/bin

FROM python:3.13.2-alpine3.20@sha256:e885b40c1ed9f3134030e99a27bd61e98e376bf6d6709cccfb3c0aa6e856f56a

# checkov:skip=CKV_DOCKER_3:"Allow root user"
# checkov:skip=CKV_DOCKER_2:"No healthcheck"

WORKDIR /app

COPY requirements.txt ./

RUN apk add --no-cache g++ musl-dev libffi-dev libstdc++ 
RUN python -m pip install --upgrade pip
RUN python -m pip install --use-deprecated=legacy-resolver -r requirements.txt
RUN apk del g++ musl-dev libffi-dev

# python is located in venv/bin

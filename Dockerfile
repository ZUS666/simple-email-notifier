FROM python:3.12.2-alpine

WORKDIR /app

COPY . .

RUN ls

ENV POETRY_VERSION=1.7.1 \
 POETRY_VIRTUALENVS_CREATE=false \
 POETRY_CACHE_DIR='/var/cache/pypoetry' \
 POETRY_HOME='/usr/local' \
 PYTHONPATH=/app

RUN apk --no-cache add curl gcc python3-dev musl-dev linux-headers

RUN curl -sSL https://install.python-poetry.org | python3 -

RUN poetry install --no-root --no-cache --no-dev

CMD ["python", "email_notify_service/main.py"]

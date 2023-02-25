FROM python:3.10.4-buster

WORKDIR /app

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV PYTHONPATH /app
ENV LC_ALL=C.UTF-8 LANG=C.UTF-8

RUN pip install --upgrade pip \
&& pip install poetry

RUN poetry config virtualenvs.create false
RUN poetry config virtualenvs.in-project true

COPY src/pyproject.toml pyproject.toml
RUN poetry install

CMD ["bash"]
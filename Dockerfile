FROM python:3.9-slim

RUN apt-get update && apt-get install -y \
    curl \
    unzip \
    git \
    libpq-dev && \
    apt-get clean

RUN curl -L https://github.com/duckdb/duckdb/releases/download/v0.8.1/duckdb_cli-linux-amd64.zip -o duckdb.zip && \
    unzip duckdb.zip && \
    mv duckdb /usr/local/bin/duckdb && \
    chmod +x /usr/local/bin/duckdb && \
    rm duckdb.zip

# dbt-coreとdbt-duckdbをインストール
RUN pip install --upgrade pip && \
    pip install dbt-core==1.8.9 dbt-duckdb==1.8.4

WORKDIR /dbt_project

COPY . /dbt_project

CMD ["tail", "-f", "/dev/null"]


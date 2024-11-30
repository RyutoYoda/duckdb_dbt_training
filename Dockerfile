FROM python:3.9-slim

# 必要なツールをインストール
RUN apt-get update && apt-get install -y \
    curl \
    unzip \
    git \
    libpq-dev && \
    apt-get clean

# DuckDB CLIのインストール
RUN curl -L https://github.com/duckdb/duckdb/releases/download/v0.8.1/duckdb_cli-linux-amd64.zip -o duckdb.zip && \
    unzip duckdb.zip && \
    mv duckdb /usr/local/bin/duckdb && \
    chmod +x /usr/local/bin/duckdb && \
    rm duckdb.zip

# dbt-coreとdbt-duckdbをインストール
RUN pip install --upgrade pip && \
    # pip install dbt-core dbt-duckdb
    pip install dbt-core==1.8.9 dbt-duckdb==1.8.4


# 作業ディレクトリを設定
WORKDIR /dbt_project

# プロジェクトディレクトリをコピー
COPY . /dbt_project

# デフォルトのコマンドを設定
CMD ["tail", "-f", "/dev/null"]

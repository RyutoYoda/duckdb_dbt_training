# ベースイメージ
FROM python:3.8-slim

# 必要なパッケージをインストール
RUN apt-get update && apt-get install -y \
    duckdb \
    libpq-dev \
    python3-pip \
    && apt-get clean

# dbtとDuckDBアダプタのインストール
RUN pip install dbt-core dbt-duckdb

# 作業ディレクトリを設定
WORKDIR /dbt_project

# プロジェクトディレクトリをコピー
COPY . /dbt_project

FROM continuumio/anaconda3

EXPOSE 8888
ARG UID=1001

COPY ./ /code
COPY conda_env.yml /code/

RUN set -xe; \
    apt-get update;\
    apt-get install -y python3 python3-pip ; \
    rm -rf /var/cache/apt/*;\
    conda env create -f /code/conda_env.yml ; \
    pip install --upgrade pip;\
    pip install -r /code/requirements.txt; \
    useradd -u ${UID} -g 0 -d /code default; \
    chown -R ${UID}:0 /code; \

USER 1001

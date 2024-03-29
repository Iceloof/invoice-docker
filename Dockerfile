# pull official base image
FROM ubuntu:20.04

# set working directory
WORKDIR /

ENV TZ=Pacific/Auckland
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update \
 && apt-get install -yq --no-install-recommends \
    wget \
    curl \
    bzip2 \
    ca-certificates \
    sudo \
    locales \
    fonts-liberation \
    run-one \
    build-essential \
    wkhtmltopdf \
    libpq-dev \
    python3-dev \
    python3-pip

RUN python3 -m pip install psycopg2 pdfkit psutil

COPY start /
COPY invoice /
COPY .config /

RUN echo 'alias invoice=/invoice' >> ~/.bashrc

# start app
CMD ["/start"]

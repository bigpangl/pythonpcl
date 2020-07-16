FROM bigpangl/python:3.6-ubuntu-16.04
RUN apt-get update \
    && apt-get install -y libpcl-dev=1.7.2-14build1 \
    && pip --no-cache-dir install  python-pcl \
    && apt-get autoremove \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

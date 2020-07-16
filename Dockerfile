FROM bigpangl/python:3.6-ubuntu-16.04
RUN set -ex \
	&& apt-get update && apt-get upgrade\
    && apt-get install -y --no-install-recommends --no-install-suggests libpcl-dev \
    && pip --no-cache-dir install  python-pcl \
    && apt-get remove -y make \
        bzip2 \
        python2.7 \
        makedev \
    && apt-get clean \
    && rm -rf /var/cache/apk/* \
    && rm -rf /var/lib/apt/lists/* \
    && find /usr/local -type f -executable -not \( -name '*tkinter*' \) -exec ldd '{}' ';' \
		| awk '/=>/ { print $(NF-1) }' \
		| sort -u \
		| xargs -r dpkg-query --search \
		| cut -d: -f1 \
		| sort -u \
		| xargs -r apt-mark manual \
	&& find /usr/local -depth \
		\( \
			\( -type d -a \( -name test -o -name tests -o -name idle_test \) \) \
			-o \
			\( -type f -a \( -name '*.pyc' -o -name '*.pyo' \) \) \
		\) -exec rm -rf '{}' +;
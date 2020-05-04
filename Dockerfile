FROM centos:7

ENV PYTHONUNBUFFERED=1
ENV LANG en_US.UTF-8

RUN yum update -y \
    && yum install -y make build-essential gcc wget vim openssl-devel bzip2-devel libffi-devel && yum clean all

WORKDIR /opt
RUN wget -q https://www.python.org/ftp/python/3.8.2/Python-3.8.2.tgz && tar xzf Python-3.8.2.tgz

WORKDIR /opt/Python-3.8.2
RUN ./configure --enable-optimizations
RUN make altinstall
RUN make install
RUN python3 -m pip install -U pip
RUN python3 -m venv venv
COPY requirements.txt requirements.txt
RUN source venv/bin/activate && pip3 install -r requirements.txt

COPY runner.py runner.py

RUN useradd -u 8877 moshe
USER moshe
COPY --chown=moshe test_billiard.py /opt/test_billiard.py
CMD source venv/bin/activate && python3 runner.py

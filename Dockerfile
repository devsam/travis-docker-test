FROM centos:7.2.1511
RUN yum update -y \
    && yum install -y yum-plugin-ovl \
    && yum install -y epel-release gcc zlib-devel python-devel

# Install jdk-1.8.0
# ADD ./archive/jdk-8u111-linux-x64.tar.gz /usr/local/src/
# ENV JAVA_HOME=/usr/local/src/jdk1.8.0_111
# ENV PATH=$JAVA_HOME/bin:$PATH

# Install python pip
RUN mkdir -p /gaia/tools/python
RUN curl -O https://bootstrap.pypa.io/get-pip.py && mv get-pip.py /gaia/tools/python/
WORKDIR /gaia/tools/python
RUN python get-pip.py

# Install librdkafka-devel
ADD confluent.repo /etc/yum.repos.d/
RUN rpm --import http://packages.confluent.io/rpm/3.3/archive.key
RUN yum clean all
RUN yum install -y librdkafka-devel


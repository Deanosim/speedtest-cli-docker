FROM ubuntu:bionic

ENV INSTALL_KEY=379CE192D401AB61
ENV DEB_DISTRO=$(lsb_release -sc)

RUN apt-get update && \
        apt-get install --no-install-recommends -y \
        nano \
        curl \
        git \
        gnupg1 \
        apt-transport-https \
        dirmngr \
        apt-get autoremove \
    &&  rm -rf /var/lib/apt/lists/*

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys $INSTALL_KEY
RUN echo "deb https://ookla.bintray.com/debian ${DEB_DISTRO} main" | tee  /etc/apt/sources.list.d/speedtest.list
RUN apt-get update \
&& apt-get install --no-install-recommends speedtest \
&&  rm -rf /var/lib/apt/lists/*
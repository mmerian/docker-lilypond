FROM debian:stretch-slim

ENV LILYPOND_VERSION=2.19.83-1

RUN apt-get update                 && \
    apt-get upgrade -y             && \
    apt-get install                   \
        --no-install-recommends -y    \
        wget bzip2                 && \
    apt-get clean

RUN cd /tmp                                                                                      && \
    wget http://lilypond.org/download/binaries/linux-64/lilypond-${LILYPOND_VERSION}.linux-64.sh && \
    sh lilypond-${LILYPOND_VERSION}.linux-64.sh --batch                                          && \
    rm -f /tmp/lilypond-${LILYPOND_VERSION}.linux-64.sh

COPY fonts/otf/* /usr/local/lilypond/usr/share/lilypond/current/fonts/otf/
COPY fonts/svg/* /usr/local/lilypond/usr/share/lilypond/current/fonts/svg/
COPY stylesheets/* /usr/local/lilypond/usr/share/lilypond/current/ly/

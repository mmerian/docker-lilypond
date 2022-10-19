FROM debian:bullseye-slim

ENV LILYPOND_VERSION=2.22.2-1

RUN apt-get update                                                                               && \
    apt-get upgrade -y                                                                           && \
    apt-get install                                                                                 \
        --no-install-recommends -y                                                                  \
        wget bzip2 ca-certificates                                                               && \
    apt-get clean                                                                                && \
    cd /tmp                                                                                      && \
    wget http://lilypond.org/download/binaries/linux-64/lilypond-${LILYPOND_VERSION}.linux-64.sh && \
    wget https://github.com/OpenLilyPondFonts/lilyjazz/archive/master.tar.gz                     && \
    sh lilypond-${LILYPOND_VERSION}.linux-64.sh --batch                                          && \
    tar zxf master.tar.gz                                                                        && \
    cp lilyjazz-master/otf/* /usr/local/lilypond/usr/share/lilypond/current/fonts/otf/           && \
    cp lilyjazz-master/svg/* /usr/local/lilypond/usr/share/lilypond/current/fonts/svg/           && \
    cp lilyjazz-master/stylesheet/* /usr/local/lilypond/usr/share/lilypond/current/ly/           && \
    rm -rf /tmp/*                                                                                && \
    apt-get clean                                                                                && \
    rm -rf /var/lib/apt/lists/*


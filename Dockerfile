FROM alpine:3.5
MAINTAINER Francesco Tonini <francescoantoniotonini@gmail.com>
ENV REFRESHED_AT 2017-02-25

# Install dependencies + gm sources
RUN apk add --update g++ gcc make wget cairo-dev pango-dev libtool
RUN wget http://netcologne.dl.sourceforge.net/project/gnuplot/gnuplot/5.0.4/gnuplot-5.0.4.tar.gz

# Unzip + compile
RUN tar zxvf gnuplot-5.0.4.tar.gz
RUN cd gnuplot-5.0.4 && ./configure --prefix=/usr && make && make install

# Cleanup
RUN rm -rf gnuplot-*
RUN apk del g++ gcc make wget

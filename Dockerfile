# FROM node:lts-alpine
FROM mhart/alpine-node:slim-12

ADD xvfb-chromium /usr/bin/xvfb-chromium

RUN set -e \
  && echo " ------ INSTALLING PACKAGES ------" \
  && apk -U --no-cache add udev chromium xvfb dbus ttf-freefont bash git \
  \
  && echo " ------ SETTING UP CHROMIUM ------" \
  && rm -f /usr/bin/chromium-browser \
  && ln -s /usr/bin/xvfb-chromium /usr/bin/google-chrome \
  && ln -s /usr/bin/xvfb-chromium /usr/bin/chromium-browser \
  && chmod 755 /usr/bin/xvfb-chromium \
  \
  && echo " ------ CLEANING UP ------" \
  && rm -rf /var/cache/apk/*

ENV CHROMIUM_BIN=/usr/bin/chromium-browser
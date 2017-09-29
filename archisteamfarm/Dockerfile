FROM microsoft/dotnet:2.0-runtime
MAINTAINER wcen <cew1350@gmail.com>

ARG ASF_VERSION=3.0.3.0

RUN apt-get update && \
  apt-get install -y unzip

RUN mkdir /ASF && \
  curl -L https://github.com/JustArchi/ArchiSteamFarm/releases/download/$ASF_VERSION/ASF-linux-x64.zip -o /ASF/ASF-linux-x64.zip && \
  unzip /ASF/ASF-linux-x64.zip -d /ASF && \
  chmod +x /ASF/ArchiSteamFarm

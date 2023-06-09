FROM openjdk:8-jdk-alpine
RUN apk update && apk add bash curl git unzip zip libstdc++ && rm -rf /var/cache/apk/*
RUN curl https://storage.googleapis.com/flutter_infra/releases/stable/linux/flutter_linux_2.2.0-stable.tar.xz -o flutter.tar.xz && tar xf flutter.tar.xz
ENV PATH=$PATH:/flutter/bin
COPY build/app/outputs/flutter-apk/app-release.apk app-release.apk
CMD ["flutter", "run", "app-release.apk"]

FROM debian:latest AS build-env

RUN apt-get update && apt-get install -y curl git unzip xz-utils zip libglu1-mesa

RUN git clone https://github.com/flutter/flutter.git /usr/local/flutter
ENV PATH="/usr/local/flutter/bin:/usr/local/flutter/bin/cache/dart-sdk/bin:${PATH}"

RUN flutter doctor
RUN flutter config --enable-web

COPY . /app
WORKDIR /app

RUN cp .env.example .env

ARG WEBHOOK_URL

RUN if [ -n "$WEBHOOK_URL" ]; then echo "WEBHOOK_URL=$WEBHOOK_URL" > .env; fi

RUN flutter build web --release

FROM nginx:alpine
COPY --from=build-env /app/build/web /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
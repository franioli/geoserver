FROM alpine:3.20 AS extract
RUN apk add --no-cache unzip
COPY plugins/cog-http.zip /tmp/cog-http.zip
RUN mkdir -p /tmp/cog && unzip -o /tmp/cog-http.zip -d /tmp/cog

FROM docker.osgeo.org/geoserver:2.28.2
COPY --from=extract /tmp/cog/*.jar /usr/local/tomcat/webapps/geoserver/WEB-INF/lib/
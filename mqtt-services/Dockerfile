ARG BUILD_FROM
FROM $BUILD_FROM
RUN \
	apk add --no-cache build-base git ruby ruby-dev ruby-etc && \
	gem install bundler && \
	git clone https://idleengineers.com/bitbucket/scm/hiq/mqtt-services.git /app && \
	cd /app && \
	bundle install

WORKDIR /app
COPY run.sh /
CMD [ "/run.sh" ]


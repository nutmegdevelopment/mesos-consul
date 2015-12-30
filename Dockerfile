FROM gliderlabs/alpine:3.1

COPY . /go/src/github.com/nutmeglondon/mesos-consul
RUN apk add --update go git mercurial \
	&& cd /go/src/github.com/nutmeglondon/mesos-consul \
	&& export GOPATH=/go \
	&& go get \
	&& go build -o /bin/mesos-consul \
	&& rm -rf /go \
	&& apk del --purge go git mercurial

ENTRYPOINT [ "/bin/mesos-consul" ]

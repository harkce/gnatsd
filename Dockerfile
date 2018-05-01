FROM golang:1.9.4

MAINTAINER Ivan Kozlovic <ivan@synadia.com>

COPY . /go/src/github.com/harkce/gnatsd
WORKDIR /go/src/github.com/harkce/gnatsd

RUN CGO_ENABLED=0 go install -v -a -tags netgo -installsuffix netgo -ldflags "-s -w -X github.com/harkce/gnatsd/server.gitCommit=`git rev-parse --short HEAD`"

EXPOSE 4222 8222
ENTRYPOINT ["gnatsd"]
CMD ["--help"]

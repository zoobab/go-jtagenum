FROM golang:1.11.3-stretch
COPY . /go/src/go-jtagenum
WORKDIR /go/src/go-jtagenum
RUN go get .
RUN CGO_ENABLED=0 GOOS=linux GOARCH=linux/arm go install -a -ldflags '-s -w -extldflags "-static"' .
ENTRYPOINT ["/bin/cp", "-v", "/go/bin/go-jtagenum", "/out"]

FROM golang:1.20-buster
WORKDIR /app
COPY . /app

RUN go install -v github.com/cweill/gotests/gotests@latest \
  && go install -v github.com/fatih/gomodifytags@latest \
  && go install -v github.com/josharian/impl@latest \
  && go install -v github.com/haya14busa/goplay/cmd/goplay@latest \
  && go install -v github.com/go-delve/delve/cmd/dlv@latest \
  && go install -v honnef.co/go/tools/cmd/staticcheck@latest \
  && go install -v golang.org/x/tools/gopls@latest
#   && go install -v github.com/ramya-rao-a/go-outline@latest \
#   && go install -v github.com/spf13/cobra-cli@latest \
#   && go install -v github.com/kyleconroy/sqlc/cmd/sqlc@latest \
#   && go install github.com/cosmtrek/air@latest

RUN go mod download && go build -buildvcs=false -o bino
CMD ["./bino"]
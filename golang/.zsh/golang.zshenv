if [ -z "${GOPATH}" ]; then
  GOPATH="${HOME}/.go"
fi

export GOPATH
export PATH=$PATH:${HOME}/.go/bin

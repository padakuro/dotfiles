if [ -z "${GOPATH}" ]; then
  GOPATH="${HOME}/.go"
else
  GOPATH="${GOPATH}:${HOME}/.go"
fi

export GOPATH

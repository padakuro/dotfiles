# node: global npm packages should be local for every user and not conflict with system installed npm packagesi
export NPM_PACKAGES="${HOME}/.npm-packages"
export NODE_PATH="${NPM_PACKAGES}/lib/node_modules:${NODE_PATH}"

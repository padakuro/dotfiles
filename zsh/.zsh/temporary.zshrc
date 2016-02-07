if [ ! -d "${TMPDIR}" ]; then
  export TMPDIR="/tmp/${USER}"
  mkdir -p -m 700 "${TMPDIR}"
fi

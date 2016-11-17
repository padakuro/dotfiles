# load custom env variables
for rcfile in "${ZDOTDIR:-$HOME}"/.zsh/*.zshenv; do
  source "${rcfile}"
done
unset rcfile

if [[ ! -o login ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

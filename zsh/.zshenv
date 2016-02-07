# load custom env variables
for rcfile in "${ZDOTDIR:-$HOME}"/.zsh/*.zshenv; do
  source "${rcfile}"
done

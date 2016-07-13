# dotfiles

* `dotfiles/bin/dotfiles.sh` management script.
* ZSH as the primary shell.
* Supported distributions: [ArchLinux](https://www.archlinux.org/).

## Requirements

* ZSH
* Git

## Usage

```
# clone
git clone https://github.com/padakuro/dotfiles.git ~/.dotfiles

# init
~/.dotfiles/dotfiles/dotfiles.sh init

# setup X
~/.dotfiles/dotfiles/dotfiles.sh setup zsh
~/.dotfiles/dotfiles/dotfiles.sh setup nvim
~/.dotfiles/dotfiles/dotfiles.sh setup gnupg
```

## systemd units

```
systemctl --user start ~/.dotfiles/systemd-units/gpg-agent.service
systemctl --user enable ~/.dotfiles/systemd-units/gpg-agent.service
```

# License

MIT.

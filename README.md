# dotfiles

* `dotfiles/bin/dotfiles.sh` management script.
* ZSH as the primary shell.
* Intended for use with: (might work with lower versions and other distributions too)
  * [ArchLinux](https://www.archlinux.org/)
  * Git 2.16+
  * ZSH 5.4+

## Usage

```
# clone
git clone https://github.com/padakuro/dotfiles.git ~/.dotfiles

# init
~/.dotfiles/dotfiles/dotfiles.sh init

# setup X
~/.dotfiles/dotfiles/dotfiles.sh setup dotfiles
~/.dotfiles/dotfiles/dotfiles.sh setup zsh
~/.dotfiles/dotfiles/dotfiles.sh setup nvim
~/.dotfiles/dotfiles/dotfiles.sh setup gnupg
```

# License

MIT.

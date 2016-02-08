# dotfiles

`./setup.sh` for the initial configuration.

* Using `stow` as symlink manager, eg. `stow -t ~ zsh`.
* ZSH as the primary shell.
* Supported distributions: [ArchLinux](https://www.archlinux.org/).

## systemd units

```
systemctl --user start ~/.dotfiles/systemd-units/gpg-agent.service
systemctl --user enable ~/.dotfiles/systemd-units/gpg-agent.service
```

# License

MIT.

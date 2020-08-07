# dotfiles

These dotfiles are self contained, ie. no external tool is used to manage the files.

## Requirements

* `dotfiles/bin/dotfiles.sh` management script.
* ZSH as the primary shell.
* Intended for use with: (might work with lower versions and other distributions too)
  * [ArchLinux](https://www.archlinux.org/)
  * Git 2.16+
  * ZSH 5.4+

## Usage

### Initial setup

```sh
git clone https://github.com/padakuro/dotfiles.git ~/.dotfiles

~/.dotfiles/dotfiles/dotfiles.sh init
~/.dotfiles/dotfiles/dotfiles.sh setup zsh
~/.dotfiles/dotfiles/dotfiles.sh setup dotfiles
```

Exit and re-login to start a new ZSH shell.

### Everyday usage

The `dotfiles.sh` command should now be globally available.

```sh
dotfiles.sh setup nvim
dotfiles.sh setup gnupg
```

# dotfiles.sh

The `dotfiles.sh` script is used to manage the dotfiles (install and update). It is not a full blown solution an rather a simple script to handle my most common use cases: copying and updating my dotfiles. No special multi-machine logic as of yet. Should not be invoked multiple times in parallel.

* `dotfiles.sh`: The main script which acts as a command dispatcher.
* `dotfiles/lib/*`: Helper functions available to all `setup.sh`.
* `*/setup.sh`: Usually found in a subfolder. It contains additional logic in case it's there's more to do than copying files.
* `$HOME/.dotfiles-db`: Contains a list of files copied including a hash. This is used to detect changes on either side.

## Without setup.sh

1. Copy all files recursively to the `$HOME` directory
2. Write the SHA512 to `.dotfiles-db` for each file

## With setup.sh

1. Invoke `setup.sh`.
2. The rest is now specified inside that script, so it can even contain further subcommands.

# License

MIT.

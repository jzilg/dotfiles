# dotfiles
my dotfiles for unix like applications

##  Usage

### Clone repository

```shell
git clone git@github.com:jzilg/dotfiles.git ~/.dotfiles
```

### Go into directory and create symlinks via stow

```shell
cd .dotfiles && stow .
```

### Install zsh plugins

```shell
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/plugins/zsh-autosuggestions
```

### Local files

The following files can be used to extend configuration while not being tracked by git:

- .zshrc.local.zsh will be imported by .zshrc
- .gitconfig.local will be imported by .gitconfig

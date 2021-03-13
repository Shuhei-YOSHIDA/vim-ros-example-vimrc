vim-ros-example-vimrc
====

This repository introduces a example to use vim-ros.
[vim-ros](https://github.com/taketwo/vim-ros) is a vim-plugin for coding ROS1.
In this repository, [forked version](https://github.com/Shuhei-YOSHIDA/vim-ros) is used.

# Preparation

## Install latest and huge Vim
```bash
$ sudo apt install software-properties-common
$ sudo apt update
$ sudo add-apt-repository ppa:jonathonf/vim
$ sudo apt update
$ sudo apt install vim-gtk3
$ vim --version
```

## Prepare vimrc to use some plugins with dein.vim
In this example, rather than vim-ros, some plugins are installed.
They are mainly for complete by LSP.

And some configurations of vim are also done in the vimrc.

Make symboric-link in a file and a directory in this repository(or copy them to specified path)
```
$ # cd to this repository
$ mkdir ~/.vim
$ ln -sr ./vimrc ~/.vimrc
$ ln -sr ./plugins ~/.vim/plugins
```

## Install dein.vim as plugin manager
Install [dein.vim](https://github.com/Shougo/dein.vim).

```bash
$ cd
$ curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
$ sh ./installer.sh ~/.vim/bundles
$ vim
```

Execute a command `:call dein#install()` in normal mode, and install dein.

# Example of how to use

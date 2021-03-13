vim-ros-example-vimrc
====

This repository introduces a example to use vim-ros.
[vim-ros](https://github.com/taketwo/vim-ros) is a vim-plugin for coding ROS1.
In this repository, [forked version](https://github.com/Shuhei-YOSHIDA/vim-ros) is used.
Moreover, it is supposed that you use `catkin-tools`.

Contents of this repository is checked by docker image "ros:noetic".

# Preparation

## Install latest and huge Vim
```terminal
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

Make symbolic-link to a file and a directory in this repository(or copy them to specified path)
```terminal
$ # cd to this repository
$ mkdir ~/.vim
$ ln -sr ./vimrc ~/.vimrc
$ ln -sr ./plugins ~/.vim/plugins
```

## Add some codes to your bashrc
This is not necessary. And if you already added equivalent codes, you don't need to do.

Make symboric-link.
```terminal
$ ln -sr ./bash_user_specific ~/.bash_user_specific
```

Add next code to your `.bashrc`
```bash
if [ -f ~/.bash_user_specific ]; then
    source ~/.bash_user_specific
fi
```

## Install dein.vim as plugin manager
Install [dein.vim](https://github.com/Shougo/dein.vim).

```terminal
$ cd
$ curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
$ sh ./installer.sh ~/.vim/bundles
$ vim
```

Execute a command `:call dein#install()` in normal mode, and install dein.

# Example of how to use
In this configuration, vim-ros plugin is not yet loaded to use Vim in other projects without ROS1.

To use vim-ros plugins, follow below steps.
```terminal
$ cd your_ws
$ catkin source # source ./devel/setup.bash
$ catkin-compile-commands-json # When you applied above bash_user_specific
$ vim
```
`catkin-compile-commands-json` sets catkin-configuration `-DCMAKE_EXPORT_COMPILE_COMMANDS=ON`,
and make symbolic-link of `compile_commands.json` for each package.
The `compile_commands.json` is used for auto-completation such as LSP.

Execute a command ':VimRos' in normal mode to load vim-ros plugin.

## make
By `:make`, you can build your workspace.
However, to treat error-message from gcc in Vim, you may need next configuration of catkin workspace.

```terminal
$ catkin config -a --cmake-args -DCMAKE_CXX_FLAGS=-fdiagnostics-color=never
```

You can check build-command by calling next command in Vim
```vim
:set makeprg
```


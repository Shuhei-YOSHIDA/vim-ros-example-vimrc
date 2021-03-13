" @file vimrc
" @author Shuhei-YOSHIDA

""Based on vimrc_example.vim-------------------------------------
" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
" Some settings may be overwritten
source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif
""End Based on vimrc_example.vim---------------------------------

""dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

let s:toml_dir = expand('~/.vim/plugins')
let s:dein_dir = expand('~/.vim/bundles') " Case when dein is install here instead of ~/.cache

" Required:
"set runtimepath+=/root/.vim/bundles/repos/github.com/Shougo/dein.vim
execute 'set runtimepath+=' . fnamemodify(s:dein_dir . '/repos/github.com/Shougo/dein.vim', ':p')

" Required:
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " Let dein manage dein
  " Required:
  call dein#add(s:dein_dir . '/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here like this:

  call dein#load_toml(s:toml_dir . '/vim-airline.toml', {})
  call dein#load_toml(s:toml_dir . '/vim-airline-themes.toml', {})
  call dein#load_toml(s:toml_dir . '/vim-lsp-settings.toml', {'merged' : 0})
  call dein#load_toml(s:toml_dir . '/vim-ros.toml', {'lazy' : 1})

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

""End dein Scripts-------------------------

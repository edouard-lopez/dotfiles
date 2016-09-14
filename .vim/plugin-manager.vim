set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'L9'  " vim library/utilities
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}  " emmet-lize
Plugin 'chriskempson/vim-tomorrow-theme'
Plugin 'kien/ctrlp.vim'  " Fuzzy file, buffer, mru, tag, etc finder.
Plugin 'airblade/vim-gitgutter'  " shows a git diff in the gutter.
Plugin 'valloric/youcompleteme'  " code-completion engine for Vim
Plugin 'raimondi/delimitmate'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

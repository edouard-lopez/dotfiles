set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'L9'  " vim library/utilities
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}  " emmet-lize
Plugin 'chriskempson/base16-vim'  " base-16 tomorrow
Plugin 'kien/ctrlp.vim'  " Fuzzy file, buffer, mru, tag, etc finder.
Plugin 'airblade/vim-gitgutter'  " shows a git diff in the gutter.
Plugin 'valloric/youcompleteme'  " code-completion engine for Vim
Plugin 'raimondi/delimitmate'   " auto close quote/bracket/parenthesis
Plugin 'editorconfig/editorconfig-vim'
Plugin 'nathanaelkane/vim-indent-guides'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

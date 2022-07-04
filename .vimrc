set encoding=utf-8

" Tmux fixes "
" Handle tmux $TERM quirks in vim
if $TERM =~ '^screen-256color'
    map <Esc>OH <Home>
    map! <Esc>OH <Home>
    map <Esc>OF <End>
    map! <Esc>OF <End>
endif

" using the fish shell: add 
set shell=/bin/bash

" User Interface
set matchpairs+=<:> " Show matching <> as well
set cursorline " Highlight current line
set mouse=a " Enable the mouse for everything
set t_Co=256

" Editor config
set nobackup    " Don't create backup files
set noswapfile " Don't create swap files

" == Identation and tabs
set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab


" Searching
set ignorecase " Ignore case when searching
set smartcase " Ignore case if search pattern is all lowercase,
" Case-sensitive otherwise
set hlsearch " Highlight search terms
nmap <silent> ,/ :nohlsearch<CR>
set gdefault " Search all occurrences by default

" Plugin settings
source ~/.vim/filetype.vim
source ~/.vim/plugin-manager.vim
" BEGIN Added by ansbible `vim` task
let base16colorspace=256  " Access colors present in 256 colorspace
colorscheme base16-tomorrow
" END Added by ansbible `vim` task

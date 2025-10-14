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

" NerdTree https://github.com/preservim/nerdtree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-o> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | call feedkeys(":quit\<CR>:\<BS>") | endif
" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | call feedkeys(":quit\<CR>:\<BS>") | endif

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
source ~/.vim/plugins.vim

" BEGIN Added by ansbible `vim` task
set termguicolors  " Only needed for terminal vim"
let tinted_colorspace=256
colorscheme base16-ayu-light " Set to same theme as your"
" END Added by ansbible `vim` task

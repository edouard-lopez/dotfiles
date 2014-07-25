""""""""""""""
" tmux fixes "
""""""""""""""
" Handle tmux $TERM quirks in vim
if $TERM =~ '^screen-256color'
    map <Esc>OH <Home>
    map! <Esc>OH <Home>
    map <Esc>OF <End>
    map! <Esc>OF <End>
endif

" Toggle paste mode
set pastetoggle=<F7>

" == User Interface
set history=1000 " Keep 1000 lines of history
set undolevels=1000
set clipboard+=unnamed
set ruler
set hidden " Don't whine when trying to move away from an unsaved buffer
set showcmd
set showmode
set showmatch " Show matching brackets
set nowrap " Don't wrap long lines

set matchpairs+=<:> " Show matching <> as well
set title
set noerrorbells visualbell t_vb= " No noise
set cursorline " Highlight current line

set mouse=a " Enable the mouse for everything
set cmdheight=2 " Make command line 2 lines high
set laststatus=2 " always show status line
set scrolloff=3 " Keep 3 lines below and above the cursor
set autoread " Autoreload changed files
set winwidth=85

set t_Co=256
set background=dark
colorscheme Tomorrow
"colorscheme Tomorrow-Night


" == Identation and tabs
set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab
set backspace=indent,eol,start

" == Searching
set ignorecase " Ignore case when searching
set smartcase " Ignore case if search pattern is all lowercase,
" Case-sensitive otherwise
set hlsearch " Highlight search terms
nmap <silent> ,/ :nohlsearch<CR>
set incsearch
set gdefault " Search all occurrences by default

set foldmethod=indent " Indentation based folding
set foldlevelstart=99 " Start editing with no fold closed

autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab "Makefiles require hard tabs
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType ruby setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType php setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType html setlocal indentkeys-=*<Return>

autocmd FileType sh nmap <F10> :!. %<CR>

autocmd FileType c set omnifunc=ccomplete#Complete

autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags


autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd BufRead,BufNewFile *.py set ai sw=4 sts=4 et
autocmd BufRead,BufNewFile *.wsgi setfiletype python


autocmd BufRead *.js set makeprg=jshint\ %
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType javascript map <buffer> <F8> :w<CR>:JSHint<CR>
autocmd FileType javascript setlocal ts=2 sts=2 sw=2 expandtab

autocmd BufNewFile,BufRead *.coffee setfiletype coffee
autocmd BufRead *.coffee setfiletype coffee
autocmd FileType coffee setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType coffee set omnifunc=javascriptcomplete#CompleteJS

autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType html set equalprg=tidy\ -i\ -q

autocmd FileType html nmap <F10> :!firefox %<CR>

autocmd BufNewFile,BufRead *.rss setfiletype xml

" CSS
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType css set equalprg=csstidy
autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab

" LessCSS
autocmd BufNewFile,BufRead *.less setfiletype css
"autocmd FileType less set omnifunc=csscomplete#CompleteCSS
"autocmd FileType less setlocal ts=2 sts=2 sw=2 expandtab

" SASS / SCSS
autocmd BufRead,BufNewFile *.scss set filetype=scss
autocmd FileType scss setlocal ts=2 sts=2 sw=2 expandtab

autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType php set ft=php.html
autocmd FileType php set equalprg=php_beautifier\ -l\ \"Pear()\ ArrayNested()\"\ -s2
autocmd FileType php noremap <C-M> :w!<CR>:!php %<CR> " Run script with php-cli
autocmd FileType php noremap <S-F8> :!php -l %<CR> " php syntax check
autocmd FileType php noremap <F8> :!phpcs %<CR> " php CodeSniffer
" Shortcuts to php-docs
autocmd FileType php inoremap <C-D> <ESC>:call PhpDocSingle()<CR>i
autocmd FileType php nnoremap <C-D> :call PhpDocSingle()<CR>
autocmd FileType php vnoremap <C-D> :call PhpDocRange()<CR>


" Save file with sudo
cmap w!! w !sudo tee % > /dev/null


let s:pattern = '^\(.* \)\([1-9][0-9]*\)$'
let s:minfontsize = 6
let s:maxfontsize = 16
function! AdjustFontSize(amount)
  if has("gui_gtk2") && has("gui_running")
    let fontname = substitute(&guifont, s:pattern, '\1', '')
    let cursize = substitute(&guifont, s:pattern, '\2', '')
    let newsize = cursize + a:amount
    if (newsize >= s:minfontsize) && (newsize <= s:maxfontsize)
      let newfont = fontname . newsize
      let &guifont = newfont
    endif
  else
    echoerr "You need to run the GTK2 version of Vim to use this function."
  endif
endfunction

function! LargerFont()
  call AdjustFontSize(1)
endfunction
command! LargerFont call LargerFont()

function! SmallerFont()
  call AdjustFontSize(-1)
endfunction
command! SmallerFont call SmallerFont()

map <silent> <C-S-Up> :LargerFont<CR>
map <silent> <C-S-Down> :SmallerFont<CR>


if has('vim_starting')
   set nocompatible               " Be iMproved

   " Required:
   set runtimepath+=~/.vim/bundle/neobundle.vim/
 endif

 " Required:
 call neobundle#begin(expand('~/.vim/bundle/'))

 " Let NeoBundle manage NeoBundle
 " Required:
 NeoBundleFetch 'Shougo/neobundle.vim'

 " My Bundles here:
 " Refer to |:NeoBundle-examples|.
 " Note: You don't set neobundle setting in .gvimrc!

 call neobundle#end()

 " Required:
 filetype plugin indent on

 " If there are uninstalled bundles found on startup,
 " this will conveniently prompt you to install them.
 NeoBundleCheck

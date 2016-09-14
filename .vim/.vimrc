" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
syntax enable 	" turn on all the magic, including Explorer and syntax highlighting
set showmode	" Show me when I'm in insert/overtype mode
set showcmd	" Show (partial) command in status line.
		" When a command is in progress, show it in the status bari
set wildmenu	" magic for completion at the : command line.
set autoindent	" indent in a smart way, instead of returning to the left margin all the time
" set expandtab	" expand tabs to spaces
set hlsearch 	" Highlight all matches in text when you search
set showmatch	" Show matches for braces, parens, etc.
set wrap	" Long lines wrap
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
			" When a search phrase has uppercase, don't be case insensitive
set spelllang=en_us	" when I want spell-checking, I want it to be english
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden             " Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)
set ts=4	" Tabstop number of spaces a <Tab> in the text stands for (local to buffer)
" set sw=8	" shiftwidth  number of spaces used for each step of (auto)indent


" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

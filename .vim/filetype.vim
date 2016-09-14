" FileType
autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab "Makefiles require hard tabs
autocmd FileType sh nmap <F10> :!. %<CR>
" Python
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd BufRead,BufNewFile *.py set ai sw=4 sts=4 et
autocmd BufRead,BufNewFile *.wsgi setfiletype python
" JS
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType javascript setlocal ts=2 sts=2 sw=2 expandtab
" HTML
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType html set equalprg=tidy\ -i\ -q
" CSS
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType css set equalprg=csstidy
autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
" SASS / SCSS
autocmd BufRead,BufNewFile *.scss set filetype=scss
autocmd FileType scss setlocal ts=2 sts=2 sw=2 expandtab


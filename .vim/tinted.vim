let theme_script_path = expand("~/.local/share/tinted-theming/tinty/base16-vim-colors-file.vim")

function! FileExists(file_path)
      return filereadable(a:file_path) == 1
endfunction

function! HandleFocusGained()
      if FileExists(g:theme_script_path)
              execute 'source ' . g:theme_script_path
                endif
endfunction

if FileExists(theme_script_path)
      set termguicolors
        let g:tinted_colorspace = 256
          execute 'source ' . theme_script_path
            autocmd FocusGained * call HandleFocusGained()
endif

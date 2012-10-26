set nocompatible number
setl tabstop=8 softtabstop=4
set shiftwidth=4 expandtab smarttab autoindent smartindent

syntax on

filetype plugin on
autocmd FileType python let g:pydiction_location = '‾/.vim/pydiction/complete-dict'
autocmd FileType python setl autoindent
autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python setl tabstop=4 expandtab shiftwidth=4 softtabstop=4

function! s:ExecPy()
    exe "!" . &ft . " %"
:endfunction
command! Exec call <SID>ExecPy()
autocmd FileType python map <silent> <C-P> :call <SID>ExecPy()<CR>


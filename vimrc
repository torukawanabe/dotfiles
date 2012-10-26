"-----------------------------------------
" Vundle
"-----------------------------------------
set nocompatible
filetype off

set rtp+=~/.vim/vundle/
call vundle#rc()
Bundle 'fugitive.vim'
Bundle 'surround.vim'
Bundle 'matchit.zip'
Bundle 'mru.vim'
Bundle 'The-NERD-tree'
Bundle 'The-NERD-Commenter'
Bundle 'EasyMotion'
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'AutoClose'
Bundle 'desert256.vim'
Bundle 'Shougo/neocomplcache'
Bundle 'shelling/railscasts.vim'
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rails'
Bundle 'ZenCoding.vim'
Bundle 'jQuery'

"-----------------------------------------
" General
"-----------------------------------------
syntax on
filetype plugin indent on

set number
set showmode
set title
set ruler
set list
set listchars=tab:>-,trail:-,extends:>,precedes:< ",eol:$
set laststatus=2
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]

set autoindent
set smartindent
set expandtab
set smarttab
set tabstop=2 shiftwidth=2 softtabstop=0
set showmatch
set wildmenu
set clipboard=unnamed
set autoread
set hidden
set showcmd
set backspace=indent,eol,start
highlight link ZenkakuSpace Error
match ZenkakuSpace /　/

set visualbell
set t_vb=

"-----------------------------------------
" Search
"-----------------------------------------
set incsearch
set ignorecase
set smartcase

"-----------------------------------------
" Key bind
"-----------------------------------------
noremap j gj
nnoremap k gk
set whichwrap=b,s,h,l,<,>,[,]

imap <c-o> <END>
imap <c-a> <HOME>
imap <c-h> <LEFT>
imap <c-j> <DOWN>
imap <c-k> <UP>
imap <c-l> <Right>"

"-----------------------------------------
" Color
"-----------------------------------------
set t_Co=256
colorscheme railscasts

"-----------------------------------------
" Plguin
"-----------------------------------------
" NERD Commenter
let NERDSpaceDelims = 1

" neocomplcache
let g:neocomplcache_enable_at_startup = 1
function InsertTabWrapper()
  if pumvisible()
    return "\<c-n>"
  endif
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k\|<\|/'
    return "\<tab>"
  elseif exists('&omnifunc') && &omnifunc == ''
    return "\<c-n>"
  else
    return "\<c-x>\<c-o>"
  endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>

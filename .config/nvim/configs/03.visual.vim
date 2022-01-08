set nocompatible
colorscheme gruvbox
let g:python3_host_prog='/usr/bin/python3'
let g:airline_theme='minimalist'
autocmd TermOpen * setlocal nonumber norelativenumber 
set linebreak
set number
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4
set autoindent
set wildmode=longest,list
filetype plugin indent on
syntax on

" Telekasten settings
hi tklink ctermfg=72 guifg=#689d6a cterm=bold,underline gui=bold,underline
hi tkBrackets ctermfg=gray guifg=gray
hi link CalNavi CalRuler
hi tkTagSep ctermfg=gray guifg=gray
hi tkTag ctermfg=175 guifg=#d3869B

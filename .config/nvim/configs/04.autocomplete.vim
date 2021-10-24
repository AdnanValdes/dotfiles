let g:deoplete#enable_at_startup = 1
let g:jedi#use_splits_not_buffers = "right" " open go-to function in split, not another buffer
let g:jedi#completions_enabled = 0 " Disable jedi-autocompletion, since deoplete is being used
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

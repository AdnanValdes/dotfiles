set nocompatible
colorscheme gruvbox
let g:python3_host_prog='/usr/bin/python3'
autocmd TermOpen * setlocal nonumber norelativenumber 
set linebreak
set number
set tabstop=4
set softtabstop=4
set expandtab
set autoindent
set si
set ai
set shiftwidth=4
set wildmode=longest,list
highlight Normal ctermbg=none
filetype plugin indent on
syntax on

" Indent Blankline set up
lua << END
require("indent_blankline").setup {
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
}
END

augroup VCenterCursor
  au!
  au BufEnter,WinEnter,WinNew,VimResized *,*.*
        \ let &scrolloff=winheight(win_getid())/2
augroup END

" Disable Netrw on start
let g:netrw_banner=0
let ghregex='\(^\|\s\s\)\zs\.\S\+'
let g:netrw_list_hide=ghregex


" LuaLine set up
lua << END
require('lualine').setup {
    options = {
        icons_enabled = false,
        theme = 'gruvbox_dark',
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        disabled_filetypes = {},
        always_divide_middle = false,
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {},
        lualine_x = {'filename','filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    extensions = {}
}
END

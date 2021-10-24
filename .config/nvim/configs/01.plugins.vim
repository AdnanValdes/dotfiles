augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end

call plug#begin()
Plug 'nvim-lua/plenary.nvim' 
Plug 'davidhalter/jedi-vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'
Plug 'preservim/nerdtree'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'machakann/vim-highlightedyank' " Highlights yank areas
Plug 'morhetz/gruvbox' " Colorscheme choice
call plug#end()

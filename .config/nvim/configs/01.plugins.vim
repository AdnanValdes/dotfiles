augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


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
Plug 'mattn/emmet-vim' " Expanding HTML abbreviations
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-lua/popup.nvim'
Plug 'sudormrfbin/cheatsheet.nvim'
Plug 'nvim-telescope/telescope-media-files.nvim'
Plug 'renerocksai/telekasten.nvim'
Plug 'renerocksai/calendar-vim'
Plug 'nvim-telescope/telescope-symbols.nvim'
Plug 'mzlogin/vim-markdown-toc'
call plug#end()

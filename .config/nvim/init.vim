for f in split(glob('~/Projects/dotfiles/.config/nvim/configs/*.vim'), '\n')
    exe 'source' f
endfor

lua require('config')

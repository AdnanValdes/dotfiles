for f in split(glob('~/Software/dotfiles/.config/nvim/configs/*.vim'), '\n')
    exe 'source' f
endfor

lua require('config')

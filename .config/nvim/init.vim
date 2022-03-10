for f in split(glob('/home/einhard/.dotfiles/.config/nvim/configs/*.vim'), '\n')
    exe 'source' f
endfor


lua require('config')


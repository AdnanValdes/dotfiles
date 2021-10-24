for f in split(glob('~/github/dotfiles/.config/nvim/configs/*.vim'), '\n')
    exe 'source' f
endfor

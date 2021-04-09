#!/bin/zsh
cd "$(dirname "$0")"
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

mkdir -p ~/.config/nvim

rm ~/.tmux.conf
rm ~/.zshrc
rm ~/.config/nvim/init.vim


ln -s ~/.dot/init.vim ~/.config/nvim/init.vim
ln -s ~/.dot/.tmux.conf ~/.tmux.conf
ln -s ~/.dot/.zshrc ~/.zshrc
nvim +PlugInstall

#!/bin/bash
cd "$(dirname "$0")"
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

mkdir -p ~/.config/nvim
mkdir -p ~/.config/nvim/lua

rm ~/.tmux.conf
rm ~/.config/nvim/init.lua


ln -s ~/.dot/init.lua ~/.config/nvim/init.lua
ln -s ~/.dot/lua ~/.config/nvim/
ln -s ~/.dot/lua/* ~/.config/nvim/lua/
ln -s ~/.dot/.tmux.conf ~/.tmux.conf

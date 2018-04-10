#! /bin/sh

ln -sf ~/.dotfiles/.emacs ~/.emacs
ln -sf ~/.dotfiles/config.fish ~/.config/fish/config.fish
mkdir -p ~/.emacs.d/private/snippets
ln -sf ~/.dotfiles/.emacs.d/private/snippets ~/.emacs.d/private/snippets

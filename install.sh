#!/bin/bash

SRC="$1"
USER_GROUP="$2"

if [[ -d "$SRC" ]]; then
    source "$SRC/.config/zsh/.zshenv"
else
    mkdir -p "$HOME/dotfiles"
    SRC="$HOME/dotfiles/zsh"
    git clone git@github.com:Saverio976/dotfile_zsh.git "$SRC" \
        || git clone https://github.com/Saverio976/dotfile_zsh.git "$SRC"
    source "$SRC/.config/zsh/.zshenv"
fi

mkdir -p "$XDG_DATA_HOME/zinit"
ZINIT_HOME="$XDG_DATA_HOME/zinit/zinit.git"
git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"

mkdir -p "$XDG_CONFIG_HOME"

if [[ -d "$XDG_CONFIG_HOME/zsh" ]]; then
    echo "FAILED !! ERROR !! $XDG_CONFIG_HOME/zsh exists..."
    exit 2
fi
if [[ -d "$XDG_CONFIG_HOME/yarn" ]]; then
    echo "FAILED !! ERROR !! $XDG_CONFIG_HOME/yarn exists..."
    exit 2
fi
if [[ -d "$XDG_CONFIG_HOME/npm" ]]; then
    echo "FAILED !! ERROR !! $XDG_CONFIG_HOME/npm exists..."
    exit 2
fi
if [[ -d "$XDG_CONFIG_HOME/git" ]]; then
    echo "FAILED !! ERROR !! $XDG_CONFIG_HOME/git exists..."
    exit 2
fi
if [[ -d "$HOME/.bashrc" ]]; then
    echo "FAILED !! ERROR !! $HOME/.bahsrc exists..."
    exit 2
fi

ln -sf   "$SRC/.config/zsh"                     "$XDG_CONFIG_HOME/zsh"
ln -sf   "$SRC/.config/yarn"                    "$XDG_CONFIG_HOME/yarn"
ln -sf   "$SRC/.config/npm"                     "$XDG_CONFIG_HOME/npm"
ln -sf   "$SRC/.config/git"                     "$XDG_CONFIG_HOME/git"
ln -sf   "$SRC/.local/bin/gource2mp4.sh"        "$XDG_LOCAL_BIN_HOME/gource2mp4.sh"
ln -sf   "$SRC/.local/bin/terminal-choose.sh"   "$XDG_LOCAL_BIN_HOME/terminal-choose.sh"
ln -sf   "$SRC/.bashrc"                         "$HOME/.bashrc"
cp -r    "$SRC/etc/zsh/"*                       "/etc/zsh/"

if [[ "$USER_GROUP" != "" ]]; then
    chown -R "$USER_GROUP" "$XDG_DATA_HOME"
    chown -R "$USER_GROUP" "$XDG_STATE_HOME"
    chown -R "$USER_GROUP" "$XDG_CACHE_HOME"
    chown -R "$USER_GROUP" "$XDG_CONFIG_HOME"
    chown -R "$USER_GROUP" "$XDG_LOCAL_BIN_HOME"
    chown -R "$USER_GROUP" "$SRC"
fi

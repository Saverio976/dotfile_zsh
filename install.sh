#!/bin/bash

SRC="$1"
USER_GROUP="$2"

if [[ -d "$SRC" ]]; then
    source "$SRC/.config/zsh/.zshenv"
    mkdir -p "$XDG_DATA_HOME"
    ZINIT_HOME="$XDG_DATA_HOME/zinit/zinit.git"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
else
    git clone TODO TODO
    SRC="TODO"
    source "$SRC/."
fi

mkdir -p "$XDG_CONFIG_HOME"

if [[ -d "$XDG_CONFIG_HOME/zsh" ]]; then
    echo "FAILED !! ERROR !! $XDG_CONFIG_HOME/zsh exists..."
    exit 2
fi

ln -sf   "$SRC/.config/zsh"     "$XDG_CONFIG_HOME/zsh"
cp -r    "$SRC/etc/zsh/"*       "/etc/zsh/"

chown -R "$USER_GROUP" "$XDG_DATA_HOME"
chown -R "$USER_GROUP" "$XDG_STATE_HOME"
chown -R "$USER_GROUP" "$XDG_CACHE_HOME"
chown -R "$USER_GROUP" "$XDG_CONFIG_HOME"
chown -R "$USER_GROUP" "$XDG_LOCAL_BIN_HOME"

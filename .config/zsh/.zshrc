# vi: ft=bash

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt SHARE_HISTORY
setopt EXTENDED_HISTORY
setopt AUTO_LIST

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# --

source "${ZINIT_HOME}/zinit.zsh"

zinit ice depth"1"
zinit light romkatv/powerlevel10k

zinit wait lucid for                                                          \
        atinit"zicompinit; zicdreplay"                                        \
    zdharma-continuum/fast-syntax-highlighting                                \
        atinit"ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20"                            \
        atload"_zsh_autosuggest_start"                                        \
    zsh-users/zsh-autosuggestions                                             \
        blockf                                                                \
        atpull'zinit creinstall -q .'                                         \
    zsh-users/zsh-completions                                                 \
    zdharma-continuum/history-search-multi-word                               \
    OMZP::colored-man-pages                                                   \
    OMZP::git                                                                 \
    OMZP::docker                                                              \
        atclone"dircolors -b LS_COLORS > clrs.zsh"                            \
        atpull'%atclone'                                                      \
        pick"clrs.zsh"                                                        \
        nocompile'!'                                                          \
        atload'zstyle ":completion:*" list-colors “${(s.:.)LS_COLORS}”'       \
    trapd00r/LS_COLORS

# --

source "$XDG_CONFIG_HOME/zsh/.aliases"

# --

export D2_enable=1
export EZA_enable=1
source "$XDG_CONFIG_HOME/zsh/.programs"

# --

[[ ! -f "$XDG_CONFIG_HOME/zsh/.p10k.zsh" ]] || source "$XDG_CONFIG_HOME/zsh/.p10k.zsh"

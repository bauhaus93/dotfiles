zstyle ':completion:*' completer _complete _ignored _approximate
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' matcher-list '' ''
zstyle :compinstall filename '/home/jakob/.zshrc'
zstyle ':vcs_info:git:*' formats ' %F{green}[%b]%f'
zstyle ':vcs_info:*' enable git

autoload -Uz compinit
autoload -U colors && colors
autoload -Uz vcs_info
autoload -Uz history-beginning-search-menu
precmd() { vcs_info }
compinit

HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000

autoload -Uz anonsh

precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS

eval "$(zoxide init --cmd j zsh)"

if [[ -d "$HOME/.local/bin" ]];
then
    path+="$HOME/.local/bin"
fi

if [[ -d "$HOME/.bin" ]];
then
    path+="$HOME/.bin"
fi

alias ls='ls --color=auto -lh'
alias cdp='cd ~/Dokumente/Programmieren'
alias cdd='cd ~/Downloads'
alias cdr='cd ~/Dokumente/Programmieren/rust'
alias svim='SUDO_EDITOR=/bin/vim sudoedit'
alias kubectl="minikube kubectl --"

PROMPT="%F{blue}%n%F{white}@%B%F{cyan}%~%b\$vcs_info_msg_0_ %f%# "
RPROMPT="%B%*"
export EDITOR=/bin/vim
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git --ignore .cargo -g ""'
export DOTNET_CLI_TELEMETRY_OPTOUT=1
bindkey '^R' history-incremental-search-backward
# source /usr/share/nvm/init-nvm.sh

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/terraform terraform

[ -f "/home/jakob/.ghcup/env" ] && source "/home/jakob/.ghcup/env" # ghcup-env

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk
#
# zsh-fzf-history-search
zinit ice lucid wait'0'
zinit light joshskidmore/zsh-fzf-history-search

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

export EDITOR=nvim

bindkey -e
bindkey '^P' history-search-backward
bindkey '^N' history-search-forward

# End of lines configured by zsh-newuser-install

#Zinit plugin manager install
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

#Zinit plugins install
zinit ice depth=1; zinit light romkatv/powerlevel10k
zinit light zsh-users/zsh-syntax-highlighting 
zinit light zsh-users/zsh-completions 
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# The following lines were added by compinstall
#zstyle :compinstall filename '/home/null/.zshrc'
zstyle ':completion:*' macher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
#zstyle ':omz:plugins:alias-finder' autoload yes # disabled by default
#zstyle ':omz:plugins:alias-finder' longer yes # disabled by default
#zstyle ':omz:plugins:alias-finder' exact yes # disabled by default
#zstyle ':omz:plugins:alias-finder' cheaper yes # disabled by default

#Aliases
alias ls='ls --color'

# Shell Integartions
eval "$(fzf --zsh)"

# Add in snippets
zinit snippet OMZP::git
#zinit snippet OMZP::java
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found
#zinit snippet OMZP::alias-finder
zinit snippet OMZP::aliases

autoload -Uz compinit && compinit
# End of lines added by compinstall

zinit cdreplay -q

# source zsh_aliases 
[[ ! -f ${HOME}/.zsh_aliases ]] || source ${HOME}/.zsh_aliases

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

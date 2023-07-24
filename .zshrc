#!/bin/zsh
export ZDOTDIR=$HOME/.config/zsh
source "$ZDOTDIR/path"
source "$ZDOTDIR/exports"
source "$ZDOTDIR/kbd"
source "$ZDOTDIR/alias"
source "$ZDOTDIR/functions"
#source "$ZDOTDIR/prompt"
source "$ZDOTDIR/antigen.zsh"
source "$ZDOTDIR/plugins"
case `uname` in
  Darwin)
    source "$ZDOTDIR/macos"
  ;;
  Linux)
    source "$ZDOTDIR/linux"
  ;;
esac

# opts and loads
unsetopt BEEP
setopt appendhistory
setopt SHARE_HISTORY
setopt autocd extendedglob nomatch menucomplete
setopt interactive_comments
setopt HIST_IGNORE_ALL_DUPS
stty stop undef		# Disable ctrl-s to freeze terminal.
zle_highlight=('paste:none')
# Turing on completions
autoload -Uz compinit
zstyle ':completion:*' menu select
# zstyle ':completion::complete:lsof:*' menu yes select
zmodload zsh/complist
# compinit
_comp_options+=(globdots)		# Include hidden files.
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
autoload -Uz colors && colors
compinit
# Babashka completion
compdef _bb_tasks bb
# Nix
if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
  . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
fi
# End Nix


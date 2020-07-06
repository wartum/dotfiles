# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls -l --color=auto'
alias cp='cp -v'
alias r='ranger'
alias vrc='vim ~/.vimrc'
alias brc='vim ~/.bashrc'
alias op='xdg-open'

alias gts='git status'
alias gtc='git checkout'

alias d='devour'

alias tvnbis='firefox https://tvonline.vectra.pl/home?channel=tvn24-bis-hd&'
alias tvn24='firefox https://tvonline.vectra.pl/home?channel=tvn-24-hd&'

[ $TERM = linux ] && setfont /usr/share/kbd/consolefonts/eurlatgr.psfu.gz
PS1=' :: '

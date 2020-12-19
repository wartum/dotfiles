# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls -l --color=auto'
alias cp='cp -v'
alias mv='mv -v'
alias r='ranger'
alias vrc='vim ~/.vim/vimrc'
alias brc='vim ~/.bashrc'
alias open='xdg-open'
alias drag='dragon-drag-and-drop'
alias gts='git status'
alias gtc='git checkout'
alias d='devour'
alias tv='devour firefox https://tvonline.vectra.pl/home?channel=tvn24-bis-hd && exit'
alias sent='devour sent'
alias pi='ssh pi@192.168.0.38 -o ConnectTimeout=2'

[ $TERM = linux ] && setfont /usr/share/kbd/consolefonts/eurlatgr.psfu.gz
PS1=' => '
neofetch

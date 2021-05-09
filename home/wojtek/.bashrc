# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls -1 --color=auto'
alias cp='cp -v'
alias mv='mv -v'
alias ed='editconf.sh'
alias open='xdg-open'
alias drag='dragon-drag-and-drop'
alias gts='git status'
alias gtc='git checkout'
alias d='devour'
alias tv='devour firefox https://tvonline.vectra.pl/home?channel=tvn24-bis-hd && exit'
alias sent='devour sent'
alias pi='ssh pi@192.168.0.38 -o ConnectTimeout=2'
alias pit='ssh pi@192.168.0.38 sensors'
alias comdate='git commit -m \""$(date)"\"'
alias push='git push origin master'
alias bc='bc -q'
alias wnet='firefox https://wnet.fm/wp-content/themes/wnet/player.php'
alias getaudio='youtube-dl -f bestaudio -o "%(title)s.%(ext)s"'
alias mem='ps axu --sort=-%mem | awk '"'"'NR < 12 {print $2"\t"$4"\t"$11" "$12" "$13" "$14" "$15}'"'"''
alias cpu='ps axu --sort=-%cpu | awk '"'"'NR < 12 {print $2"\t"$3"\t"$11" "$12" "$13" "$14" "$15}'"'"''

[ $TERM = linux ] && setfont /usr/share/kbd/consolefonts/eurlatgr.psfu.gz
PS1=' => '

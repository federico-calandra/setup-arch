## Questo file viene letto ogni volta che si lancia la shell

# Customizza prompt
RED="\[$(tput setaf 5)\]"
RESET="\[$(tput sgr0)\]"
PS1="${RED}[(\#) \u@\h \w \t]\$${RESET} " 

alias pacman='sudo pacman'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ip='ip --color=auto'
alias systemctl='sudo systemctl'

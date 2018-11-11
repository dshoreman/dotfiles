# Pacman Aliases

alias packeys="sudo pacman-key --refresh-keys"
alias pacmlist="sudo reflector --save /etc/pacman.d/mirrorlist --sort rate --verbose -p 'http' -c 'United Kingdom'"

alias pacrefresh="pacmlist && packeys"
alias pacupdate="sudo pacman -Sy"
alias sysupdate="sudo pacman -Syu"

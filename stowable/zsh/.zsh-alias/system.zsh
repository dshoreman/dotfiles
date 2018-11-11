# System
alias purge="sudo sync && sudo sh -c 'echo 3 > /proc/sys/vm/drop_caches'"

function bgstart {
    $1 &>/dev/null &
    disown
}

fork() { (setsid "$@" &); }

# Clipboard
alias pbcopy="xclip -i -selection clipboard"
alias pbpaste="xclip -o -selection clipboard"

# Network
alias ipaddr="ip addr | \grep \"inet \" | \grep -v '127.0.0.1' | awk '{ print \$7\" \"\$2 }' | sort"

# Services
alias ss="sudo systemctl start"
alias ssm="ss mysqld && sudo chmod o+r /var/run/mysqld/mysqld.pid"
alias startpma="ssm; /usr/share/webapps/phpMyAdmin && php -S localhost:1234"

# Utility
alias df="df -h"
alias k="k -h"
alias \;=l
alias mv="mv -v"
alias lsk="k -Ah"
alias diff="diff -s"
alias tree="tree -I vendor"

#alias fuck='sudo $(fc -ln -1)'
eval $(thefuck --alias)

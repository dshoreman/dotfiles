zplug "plugins/composer", from:oh-my-zsh
zplug "plugins/vagrant", from:oh-my-zsh

# Artisan
[ -e make ] && alias dpa="$(make art)"
alias pa="php artisan"
alias pas="pa serve"

# CTags
alias phptag="ctags -R --fields=+aimlS --languages=php"

# MySQL
alias ssm="ss mysqld && sudo chmod o+r /var/run/mysqld/mysqld.pid"

# PHPMyAdmin
alias startpma="ssm; /usr/share/webapps/phpMyAdmin && php -S localhost:1234"

# PHPUnit
alias cpu="clear; pat"
alias pat="if [ -f Makefile ]; then make test; else vendor/bin/phpunit; fi"
alias coverage="phpdbg -qrr vendor/bin/phpunit"
alias covtext="coverage --coverage-text"
alias covhtml="coverage --coverage-html tests/reports/$(date '+%Y-%m-%d_%H%M')"

# Success uses white text on green background which is invisible,
# so we disable colour codes with --no-ansi.
alias sec-check="security-checker security:check --no-ansi"

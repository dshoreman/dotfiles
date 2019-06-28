# Laravel Aliases

[ -e make ] && alias dpa="$(make art)"

alias cpu="clear; vendor/bin/phpunit"
alias pa="php artisan"
alias pas="pa serve"
alias pat="vendor/bin/phpunit"
alias coverage="phpdbg -qrr vendor/bin/phpunit"
alias covtext="coverage --coverage-text"
alias covhtml="coverage --coverage-html tests/reports/$(date '+%Y-%m-%d_%H%M')"
alias phptag="ctags -R --fields=+aimlS --languages=php"

# Success uses white text on green background which is invisible,
# so we disable colour codes with --no-ansi.
# Not strictly laravel specific, but other PHP stuff is here so meh.
alias sec-check="security-checker security:check --no-ansi"

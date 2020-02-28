#!/usr/bin/env zsh

alias mplaya="mpv --no-audio-display"
alias shuffle="mpv --no-audio-display --shuffle"

function mkplaylist {
    local results="$(find ~/music/ -type f -iname "*.flac" -o -iname "*.m4a" -o -iname "*.mp3" -o -iname "*.wav" -o -iname "*.wma")"

    cat "${results}" | \grep -v "Automatically Add to iTunes" > /tmp/playlist
}

alias shuffall="mkplaylist && shuffle --playlist=/tmp/playlist"
alias bgplay="mkplaylist && shuffle --playlist=/tmp/playlist & disown"

alias bandcamp-dl="youtube-dl -o '~/music/newly-ripped/%(artist)s/%(album)s/%(track_number)02d %(track)s.%(ext)s'"
alias ripcd="ripit -c 0 -e --threads 4 --dirtemplate '\"/\$artist/\$album\"' --outputdir=~/music/newly-ripped"

#!/usr/bin/env zsh

if hash mpv 2>/dev/null; then
    alias mplaya="mpv --no-audio-display"
    alias shuffle="mpv --no-audio-display --shuffle"

    if hash fd 2>/dev/null; then
        function mkplaylist {
            fd . ~/music/ -tf -eflac -em4a -emp3 -ewav -ewma \
                | \grep -v "Automatically Add to iTunes" > /tmp/playlist
        }

        alias shuffall="mkplaylist && shuffle --playlist=/tmp/playlist"
        alias bgplay="mkplaylist && shuffle --playlist=/tmp/playlist & disown"
    fi
fi

hash yt-dlp 2>/dev/null && \
    alias bandcamp-dl="yt-dlp -o '~/music/newly-ripped/%(artist)s/%(album)s/%(track_number)02d %(track)s.%(ext)s'"

hash ripit 2>/dev/null && \
    alias ripcd="ripit -c 0 -e --threads 4 --dirtemplate '\"/\$artist/\$album\"' --outputdir=~/music/newly-ripped"

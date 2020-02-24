# Media Playback Aliases

alias mplaya="mplayer -novideo -vc null -vo null -noar -msgcolor"
alias shuffle="mplayer -novideo -vc null -vo null -msgcolor -shuffle"
alias mkplaylist='find ~/music/ -type f -iname "*.flac" -o -iname "*.m4a" -o -iname "*.mp3" -o -iname "*.wav" -o -iname "*.wma" | \grep -v "Automatically Add to iTunes" > /tmp/playlist'
alias shuffall="mkplaylist && mpv --no-audio-display --shuffle --playlist=/tmp/playlist"
alias bgplay="shuffall & disown"

alias ripcd="ripit -c 0 -e --threads 4 --dirtemplate '\"/\$artist/\$album\"' --outputdir=~/music/newly-ripped"
alias bandcamp-dl="youtube-dl -o '~/music/newly-ripped/%(artist)s/%(album)s/%(track_number)02d %(track)s.%(ext)s'"

alias yta="mpsyt set show_video 0,"
alias ytv="mpsyt set show_video 1,"

function ytaid {
    yta url $1, 1
}

function ytvid {
    ytv url $1, 1
}

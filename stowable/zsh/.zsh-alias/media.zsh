# Media Playback Aliases

alias mplaya="mplayer -novideo -vc null -vo null -noar -msgcolor"
alias shuffle="mplayer -novideo -vc null -vo null -msgcolor -shuffle"

alias ripcd="ripit -c 0 -e --threads 4 --dirtemplate '\"/\$artist/\$album\"' --outputdir=~/music/newly-ripped"

alias yta="mpsyt set show_video 0,"
alias ytv="mpsyt set show_video 1,"

function ytaid {
    yta url $1, 1
}

function ytvid {
    ytv url $1, 1
}

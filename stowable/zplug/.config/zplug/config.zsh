# Enable automatic cd by typing only paths
setopt auto_cd

# Assign search directories for automatic cd
cdpath=(~/dev/own)

# Only show targets when completing make commands
zstyle ':completion:*:*:make:*' tag-order 'targets'

# Set gPodder config
source ~/.pam_environment

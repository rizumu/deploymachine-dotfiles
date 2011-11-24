#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Enable aliases, config, dircolors, env
if [ -f "$HOME/bash/main.sh" ]; then
    . "$HOME/bash/main.sh"
fi

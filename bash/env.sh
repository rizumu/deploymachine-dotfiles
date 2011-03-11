# BIN
echo $PATH | grep -q -s "/usr/local/bin"
if [ $? -eq 1 ] ; then
    PATH=$PATH:/usr/local/bin
    export PATH
fi

# Setting the path to custom scripts in bin folder
if [ -d $HOME/bin/ ]; then
    export PATH=$PATH:$HOME/bin/
fi

#default text editor
export editor="vim"

# GIT
if [ -f $HOME/.bash_completion.d/git-completion.bash ]; then
    . $HOME/.bash_completion.d/git-completion.bash
fi

# MERCURIAL
if [ -f $HOME/.bash_completion.d/hgtab-bash.sh ]; then
    . $HOME/.bash_completion.d/hgtab-bash.sh
fi

# History
export HISTSIZE=10000
export HISTFILESIZE=10000
# Don't store duplicate adjacent items in the history
HISTCONTROL=ignoreboth

#Vim
if [ -f /usr/share/vim/vim70 ]; then
    export VIMRUNTIME=/usr/share/vim/vim70
fi
if [ -f /usr/share/vim/vim71 ]; then
    export VIMRUNTIME=/usr/share/vim/vim71
fi
if [ -f /usr/share/vim/vim72 ]; then
    export VIMRUNTIME=/usr/share/vim/vim72
fi

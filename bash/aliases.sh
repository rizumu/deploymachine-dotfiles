if [ `uname` == "Linux" ]; then
  export LS_OPTIONS='--color=auto'
  eval `dircolors $HOME/bash/dircolors`
fi

# Global
alias ..='cd ..'        # Go up one directory
alias ...='cd ../..'    # Go up two directories
alias ....='cd ../../..'    # Go up three directories
alias c='clear;echo "Currently logged in on $(tty), as $(whoami) in directory $(pwd)."' # shortcut to clear your terminal
alias cdd='cd -'        # Go to last used directory
alias delds='find . \( -name ".DS_Store" \) -exec rm -v {} \;'
alias delorig='find . \( -name "*.orig" \) -exec rm -v {} \;'
alias df='df -h'        # Disk free, in gigabytes, not bytes
alias du='du -h -c'     # Calculate total disk usage for a folder
alias grep='grep --color=auto' # Always highlight grep search term
alias h='history'       # shortcut for history
alias hc="history | awk '{a[$2]++}END{for (i in a){print a [i] \" \" i}}' | sort -rn | head" # show most commonly used command
alias ping='ping -c 5'  # Pings with 5 packets, not unlimited
function take {
    mkdir $1
    cd $1
}
alias cal='cal -3' #show 3 months by default
alias units='units -t' #terse mode
alias diff='LC_ALL=C TZ=GMT0 diff -Naur' #normalise diffs for distribution
alias lynx='lynx -force_html -width=$COLUMNS' #best settings for viewing HTML

# Find and Replace
function rep() {
    for i in `grep -R --exclude="*.svn*" "$1" * | sed s/:.*$//g | uniq`; do
        sed -i ".bak" -e "s#$1#$2#g" $i
    done
}

# I hate noise
set bell-style visible

# Tell less not to beep and also display colours
export LESS="-QR"
alias vless='vim -u $VIMRUNTIME/macros/less.vim'

# Processes
alias tm='top -o vsize' #memory
alias tu='top -o cpu' #cpu

# Bash
# GREP_COLOR=bright yellow on black bg.
# use GREP_COLOR=7 to highlight whitespace on black terminals
# LANG=C for speed. See also: http://www.pixelbeat.org/scripts/findrepo
alias grep='GREP_COLOR="1;33;40" LANG=C grep --color=auto'

# Python
alias delpyc='find . \( -name "*.pyc" -o -name "*.pyo" \) -exec rm -v {} \;'
alias p='ipython'
alias lsite='ls -hal $(python -c "from distutils.sysconfig import get_python_lib; print get_python_lib()")'
alias path='python -c "from distutils.sysconfig import get_python_lib; print get_python_lib()"'
alias servethis="python -c 'import SimpleHTTPServer; SimpleHTTPServer.test()'"
alias site='cd $(python -c "from distutils.sysconfig import get_python_lib; print get_python_lib()")'

# Screen
alias s='screen'
alias sl='screen -ls'

# SVN
alias sup='svn up' # trust me 3 chars makes a different
alias supall='for i in *; do (cd $i; svn up); done' # all recursive folders
alias sst='svn st' # local file changes
alias sstu='svn st -u' # remote repository changes
alias scom='svn commit' # commit
alias svnclear='find . -name .svn -print0 | xargs -0 rm -rf' # removes all .svn folders from directory recursively
alias svnaddall='svn status | grep “^\?” | awk “{print \$2}” | xargs svn add' # adds all unadded files

# Git
alias gb='git branch'
alias gba='git branch -a'
alias gc='git commit -v -m'
alias gca='git commit -v -a -m'
alias gco='git checkout'
alias gd='git diff'
alias gdm='git diff master n'
alias gg='git log -p -2 --pretty=format:"%h - %an, %ar : %s" --shortstat'
alias gl='git pull'
alias gp='git push'
alias gst='git status'
alias gx='gitx'
alias grau='git remote add upstream '
alias glum='git pull upstream master'
# Setup a tracking branch from [remote] [branch_name]
function gbt() {
    git branch --track $2 $1/$2
    git checkout $2
}
function grf() {
    rm $1
    git checkout $1
}
function gmd() {
    git checkout master
    git merge dev
    git push
    git checkout dev
}

# Hg
alias hgb='hg branch'
alias hgbs='hg branches'
alias hgc='hg commit -m'
alias hgd='hg diff'
alias hgg='hg glog'
alias hgl='hg pull'
alias hglu='hg pull -u'
alias hgst='hg status'
alias hgu='hg update'
alias hgp='hg push'
alias hgv='hg view'

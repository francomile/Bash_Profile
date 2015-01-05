
# This is a simple custom .bash_profile file for Mac OS.
#=======================================================

# Prompt settings:
#=================

export CLICOLOR=1
export PS1="\[$(tput setaf 4)\][\[$(tput setaf 5)\]\u\[$(tput setaf 6)\]@\[$(tput setaf 5)\]\h \[$(tput setaf 6)\]\W\[$(tput setaf 4)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"

# Grep and Ls color settings:
#============================

export GREP_OPTIONS='--color=auto'  # Tell grep to highlight matches
export LSCOLORS=ExFxBxDxCxegedabagacad


# Common use Aliases:
#====================

alias st='open -a "Sublime Text"'
alias server='python -m SimpleHTTPServer'
alias profile='open -a "Sublime Text" ~/.bash_profile'
alias ghome='cd ~/Desktop'
alias getc='cd /etc'
alias goutput='cd /private/var/log'
alias gtmp='cd /tmp'
alias gdocs='cd ~/Documents'
alias c='clear'
alias shut='shutdown -h now'
alias vi='vim'

# Ls Aliases:
#============
 
alias l='ls -lAh'	# List files in human readable format with color and without directories    
alias ld='ls -hog'      # The ls Hog - easy to remember directory listing
alias lx='ls -lXB'      #  Sort by extension.
alias lk='ls -lSr'      #  Sort by size, biggest last.
alias lt='ls -ltr'      #  Sort by date, most recent last.
alias lc='ls -ltc'      #  Sort by/show change time,most recent first.
alias lu='ls -ltu'      #  Sort by/show access time,most recent first.

# Network aliases:
#=================

alias pubip='curl ip.appspot.com'   	    # My public IP address
alias netlisten='lsof -i -P | grep LISTEN'  # Find active network listeners
alias pingle='ping google.com'              # Ping google.com
alias speedtest='wget --output-document=/dev/null http://speedtest.wdc01.softlayer.com/downloads/test500.zip'  # Network Speedtest


# Other aliases:
#================

alias passwdgen='dd if=/dev/random bs=16 count=1 2>/dev/null | base64 | sed 's/=//g''   # passwd generator
alias ltree='tree -C | less -R'              # Tree current dir with colors
alias memhog='ps -o time,ppid,pid,nice,pcpu,pmem,user,comm -A | sort -n -k 6 | tail -15'  # Whats eating your memory
alias sar5='sar 1 5'                         # First five consuming processes
alias df='df -h'			     # Disk space usage in human readable form
alias ..='cd ..'			     # Upper parent directory
alias ...='cd ../../'                        # Two upper parent directory
alias big='du -ks *| sort -n'    	     # Find the biggest in a folder
alias big10='du -cks *|sort -rn|head -11'    # list top ten largest files/directories in current dir
alias msg='wall'   			     # Broadcast message to all users


# Find Aliases:
#==============

alias qfind="find . -name "                 # qfind:    Quickly search for file
ff () { /usr/bin/find . -name "$@" ; }      # ff:       Find file under the current directory
ffs () { /usr/bin/find . -name "$@"'*' ; }  # ffs:      Find file whose name starts with a given string
ffe () { /usr/bin/find . -name '*'"$@" ; }  # ffe:      Find file whose name ends with a given string


# Extract most Known archives:
#==============================

extract () {
    if [ -f $1 ] ; then
      case $1 in
        *.tar.bz2)   tar xjf $1     ;;
        *.tar.gz)    tar xzf $1     ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar e $1     ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xf $1      ;;
        *.tbz2)      tar xjf $1     ;;
        *.tgz)       tar xzf $1     ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *)     echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}


# Git load file:
#===============

if [ -f ~/.git-completion.bash ]; then
source ~/.git-completion.bash
fi


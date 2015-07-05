# Prompt settings:
#=================

export CLICOLOR=1
export PS1="\[$(tput bold)\]\[$(tput setaf 2)\]\u\[$(tput bold)\]\[$(tput setaf 7)\]@\[$(tput setaf 2)\]\h\[$(tput setaf 5)\] \W\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"



# Grep and Ls color settings:
#============================

export GREP_OPTIONS='--color=auto'       # Tell grep to highlight matches
export LSCOLORS=ExFxBxDxCxegedabagacad   # Ls colors


# Common use Aliases:
#====================

# if user is not root, pass all commands via sudo: 
if [ $UID -ne 0 ]; then
    alias reboot='sudo reboot'
    alias poweroff='sudo poweroff'
    alias upgradeb='sudo apt-get update && sudo apt-get -y upgrade'   # Upgrade Debian based distros
    alias upgraderel='sudo yum -y update'                             # Upgrade RHEL based distros without removing obsolete 
fi
alias ghome='cd ~/Desktop'
alias getc='cd /etc'
alias goutput='cd /var/log'
alias gtmp='cd /tmp'
alias gdocs='cd ~/Documents'
alias c='clear'
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
#Query all DNS records in a domain:
digdomain() {
    dig -tAXFR $1
}


# Other aliases:
#================

alias passwdgen='dd if=/dev/random bs=16 count=1 2>/dev/null | base64 | sed 's/=//g''   # passwd generator
#Yet another Password generator. You can change the last number to your needs: 
alias genpass='openssl rand -base64 9'
alias ltree='tree -C | less -R'              # Tree current dir with colors
alias memhog='ps -o time,ppid,pid,nice,pcpu,pmem,user,comm -A | sort -n -k 6 | tail -15'  # Whats eating your memory
alias sar5='sar 1 5'                         # First five consuming processes
alias df='df -h'			                 # Disk space usage in human readable form
alias ..='cd ..'			                 # Upper parent directory
alias ...='cd ../../'                        # Two upper parent directory
alias big='du -ks *| sort -n'    	         # Find the biggest in a folder
alias big10='du -cks *|sort -rn|head -11'    # list top ten largest files/directories in current dir
alias msg='wall'   			                 # Broadcast message to all users
alias phpmod='apt-cache search ^php5- | awk {'printf $1 " "'} | sed 's\php5-dbg\\g' |  sed 's\php5-mysqlnd\\g' | sed 's\php5-xcache\\g' | sed 's\php5-fpm\\g' |  sed 's\ -ms\\g'| xargs sudo apt-get -y install
'  # install almost all php modules in Debian based systems.

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


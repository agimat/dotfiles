# sourced from public and personal repos
# agimat@gmail.com

HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
HISTCONTROL=ignoreboth

shopt -s histappend
shopt -s checkwinsize
shopt -s cdspell

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# Set up TERM variables.
# vt100 and xterm have no color in vim (at least on unixs), but if we call them xterm-color, they will.
# (vt100 for F-Secure SSH.)
# This may well be the case for some other terms, so I'm putting them here.
# Also set up a variable to indicate whether to set up the title functions.
# TODO gnome-terminal, or however it reports itself
case $TERM in

  screen)
    TERM_IS_COLOR=true
    TERM_NOT_RECOGNIZED_AS_COLOR_BY_VIM=false
    TERM_NOT_RECOGNIZED_BY_SUN_UTILS=false
    TERM_CAN_TITLE=true
  ;;

  xterm-256color|xterm-color|color_xterm|rxvt|Eterm|screen*) # screen.linux|screen-w
    TERM_IS_COLOR=true
    TERM_NOT_RECOGNIZED_AS_COLOR_BY_VIM=false
    TERM_NOT_RECOGNIZED_BY_SUN_UTILS=true
    TERM_CAN_TITLE=true
  ;;

  linux)
    TERM_IS_COLOR=true
    TERM_NOT_RECOGNIZED_AS_COLOR_BY_VIM=false
    TERM_NOT_RECOGNIZED_BY_SUN_UTILS=true
    TERM_CAN_TITLE=false
  ;;

  xterm|vt100)
    TERM_IS_COLOR=true
    TERM_NOT_RECOGNIZED_AS_COLOR_BY_VIM=true
    TERM_NOT_RECOGNIZED_BY_SUN_UTILS=false
    TERM_CAN_TITLE=true
  ;;

  *xterm*|eterm|rxvt*)
    TERM_IS_COLOR=true
    TERM_NOT_RECOGNIZED_AS_COLOR_BY_VIM=true
    TERM_NOT_RECOGNIZED_BY_SUN_UTILS=true
    TERM_CAN_TITLE=true
  ;;

  *)
    TERM_IS_COLOR=false
    TERM_NOT_RECOGNIZED_AS_COLOR_BY_VIM=false
    TERM_NOT_RECOGNIZED_BY_SUN_UTILS=false
    TERM_CAN_TITLE=false
  ;;

esac

# dircolors... make sure that we have a color terminal, dircolors exists, and ls supports it.
if $TERM_IS_COLOR && ( dircolors --help && ls --color ) &> /dev/null; then
  # For some reason, the unixs machines need me to use $HOME instead of ~
  # List files from highest priority to lowest.  As soon as the loop finds one that works, it will exit.
  for POSSIBLE_DIR_COLORS in "$HOME/.dir_colors" "/etc/DIR_COLORS"; do
    [[ -f "$POSSIBLE_DIR_COLORS" ]] && [[ -r "$POSSIBLE_DIR_COLORS" ]] && eval `dircolors -b "$POSSIBLE_DIR_COLORS"` && break
  done
fi

# colorized man pages in less
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'                           
export LESS_TERMCAP_so=$'\E[01;44;33m'                                 
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi
# Set $TERM for libvte terminals that set $TERM wrong (like gnome-terminal)
{
  [ "_$TERM" = "_xterm" ] && type ldd && type grep && type tput && [ -L "/proc/$PPID/exe" ] && {
    if ldd /proc/$PPID/exe | grep libvte; then
      if [ "`tput -Txterm-256color colors`" = "256" ]; then
        TERM=xterm-256color
      elif [ "`tput -Txterm-256color colors`" = "256" ]; then
        TERM=xterm-256color
      elif tput -T xterm; then
        TERM=xterm
      fi
    fi
  }
} >/dev/null 2>/dev/null

venwrap=`type -P virtualenvwrapper.sh`
if [ "$venwrap" != "" ]; then
    source $venwrap
fi

# Add git and svn branch names
#export PS1="$PS1\$(parse_git_branch)\$(parse_svn_branch) "

# config
set completion-ignore-case On

GREP_OPTIONS="--exclude-dir=\.svn --exclude-dir=log --exclude-dir=\.git"
export GREP_OPTION

PYTHONSTARTUP=~/.pythonrc.py
export PYTHONSTARTUP

#export PS1='\[\e]0;\h \w\a\]\n\[\e[32m\]\u@\h \[\e[33m\]\w\[\e[0m\]\$ '
export PS1='\[\e]0;\h \w\a\]\[\033[32m\][\[\033[0m\]\u\[\033[32m\]@\[\033[0m\]\h\[\033[32m\]]:\[\033[0m\]\w\[\033[32m\]\[\033[32m\] $\[\033[0m\] '
export PS1='\[\e]0;\h \w\a\]\[\033[32m\][\[\033[0m\]\u\[\033[32m\]@\[\033[0m\]\h\[\033[32m\]]:[\[\033[0m\]\w\[\033[32m\]]\[\033[32m\] $\[\033[0m\] '

# always-on aliases
if [ $(uname) == "FreeBSD" ]; then 
    alias ls="ls -laG"
    alias ll="ls -lAG"
    alias dir='ls -laG -hF'
else 
    alias ls="ls --color=auto -hFA"
    alias ll="ls --color=auto -lA"
    alias dir='ls --color=auto --format=vertical -hF'
fi 

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias screen='TERM=screen screen'
alias ports="lsof -i -P -sTCP:LISTEN"
alias ack='ack -a'
alias findbig="find . -type f -exec ls -s {} \; | sort -n -r | head -5"
alias cls='clear;ls'
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../..'
alias less='less -R'
alias hh='history'
alias dirf='find . -type d | sed -e "s/[^-][^\/]*\//  |/g" -e "s/|\([^ ]\)/|-\1/"'   
alias lo='ls -l | sed -e 's/--x/1/g' -e 's/-w-/2/g' -e 's/-wx/3/g' -e 's/r--/4/g' -e 's/r-x/5/g' -e 's/rw-/6/g' -e 's/rwx/7/g' -e 's/---/0/g'' 
alias hg='history | grep '
alias reload="source $HOME/dotfiles/bashrc"
alias he='w; screen -ls; df -h; uptime; free'

# show sorted directory sizes for all directories
alias dua='du -ch --max-depth=1'
alias duv='du -sch ./*'
alias duh='du -sch ./.*'


# utility functions

command_exists () {
    type "$1" &> /dev/null ;
}

# dir up x, like up 3 (../../../), up 4
up(){
  local d=""
  limit=$1
  for ((i=1 ; i <= limit ; i++))
    do
      d=$d/..
    done
  d=$(echo $d | sed 's/^\///')
  if [ -z "$d" ]; then
    d=..
  fi
  cd $d
}

#parse_git_branch () {
#  git name-rev HEAD 2> /dev/null | sed 's#HEAD\ \(.*\)#(git::\1)#'
#}

function find_in { 
  find . -name $1 -print | xargs grep --color=auto -inH $2; 
}

extract () {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xvjf $1   ;;
      *.tar.gz)    tar xvzf $1   ;;
      *.bz2)       bunzip2 $1    ;;
      *.rar)       unrar x $1    ;;
      *.gz)        gunzip $1     ;;
      *.tar)       tar xvf $1    ;;
      *.tbz2)      tar xvjf $1   ;;
      *.tgz)       tar xvzf $1   ;;
      *.zip)       unzip $1      ;;
      *.Z)         uncompress $1 ;;
      *.7z)        7z x $1       ;;
      *)           echo "'$1' cannot be extracted via >extract<" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

function psgrep() {
  ps -p $(pgrep $@)
}

#  repeat 10 echo foo
repeat () { 
  local count="$1" i;
  shift;
  for i in $(seq 1 "$count");
  do
    eval "$@";
  done
}

# Subfunction needed by `repeat'.
seq () { 
  local lower upper output;
  lower=$1 upper=$2;
  while [ $lower -le $upper ];
  do
    output="$output $lower";
    lower=$[ $lower + 1 ];
  done;
  echo $output
}

# numbered column awk, like - fawk 2 for column 2 extraction on default delimiter
function fawk {
    first="awk '{print "
    last="}'"
    cmd="${first}\$${1}${last}"
    eval $cmd
}

# remove empty lines
nb() { 
    sed '/^$/d' "${1}"; 
} 

# external ip from external source
eip() { 
    curl -s http://rlachenal.com/iptest.php | awk -F"<" '{ print $1 } '; 
}

# pull vundle
git_vundle() {
    git clone https://github.com/gmarik/vundle.git ~/dotfiles/bundle/vundle
    vim -u ~/dotfiles/vimrc +BundleInstall +qall
}

# aws

export EC2_HOME=$HOME/.ec2
export PATH=$PATH:$EC2_HOME/bin
#export EC2_PRIVATE_KEY=`ls $EC2_HOME/pk-*.pem`
#export EC2_CERT=`ls $EC2_HOME/cert-*.pem`

export TMP=$HOME/tmp

if [[ -f "$HOME/.amazon_keys" ]]; then
    source "$HOME/.amazon_keys";
fi


# server specific 
source ~/dotfiles/nh.sh 

# check for preferred alternates
if command_exists vi; then
    vim="vi -v"
    alias vim="$vim -u ~/dotfiles/vimrc"
    export EDITOR="$vim"
    export GIT_EDITOR="$vim"
elif command_exists vim; then 
    vim="vim -v"
    alias vim="$vim -u ~/dotfiles/vimrc"
    export EDITOR="$vim"
    export GIT_EDITOR="$vim"
fi

if command_exists nano; then
      alias nn="nano -w -T4"
fi

if [ "$TERM" != "screen" ]; then 
	if command_exists byobu; then 
    	alias screen='byobu -c $HOME/dotfiles/byoburc'
	else
		alias screen="screen -c $HOME/dotfiles/screenrc"
	fi 
fi 

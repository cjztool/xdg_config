# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples
# Time-stamp: <03-Sep-2008 07:47:37 ferk>

# If not running interactively, don't do anything
[ -z "$PS1" ] && return


# List of commands to ignore (& means ignore duplicates)
export HISTIGNORE="&:??:exit:history*"

export HISTSIZE=100000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize
shopt -s cdspell
# enables spelling corrections on directory names during globbing
shopt -s dirspell
# enables recursive globbing with **
shopt -s globstar

# make less more friendly for non-text input fithen I noticeles, see lesspipe(1)
[ -x /usr/bin/lesspipe.sh ] && eval "$(lesspipe.sh)"


# fancy Prompt

# GOLD= "\e[33m"
# GREEN="\e[32m"
# BLUE= "\e[34m"
# GRAY= "\e[37m"
# CYAN= "\e[36m"
# RED=  "\e[31m"
# NO_COLOR="\e[0m"

ERRCOLOR='eval [[ $?m = 0m ]] && echo -e "\e[32m" || echo -e "\e[31m";'
#PS1='\e[33m\t ${debian_chroot:+($debian_chroot)}$($ERRCOLOR)\u\e[0m:\e[34m\w\e[0m\$ '


PS1='\[\e[33m\]\t \[$($ERRCOLOR)\]\u\[\e[0m\]:\[\e[34m\]\w\[\e[0m\]\$ '



# If this is an xterm set the title
case "$TERM" in
    xterm*)
		;;
	rxvt*)
        # #Show current running program in titlebar
        trap 'echo -ne "\e]2;${BASH_COMMAND/\\/\\\\}\007"' DEBUG
        #Title to have when running interactive shell
        #PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}:${PWD/$HOME/~} - ${TERM}\007"'
        PROMPT_COMMAND=" echo -ne \"\e]2;${PWD/$HOME/~} - ${TERM}\007\" "
        # #Iconname
        # #echo -ne "\e]1;gnome-terminal\007"
        ;;
    *)
        ;;
esac


# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ] && [ -x /usr/bin/dircolors ]; then
    eval "`dircolors -b`"
fi

# # enable programmable completion features (you don't need to enable
# # this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# # sources /etc/bash.bashrc).
# if [ -f /etc/bash_completion ]; then
#     . /etc/bash_completion
# fi


# Variables
export PAGER=less
export BROWSER=$HOME/bin/browser
export EDITOR="emacsclient -c"
export ALTERNATE_EDITOR="" # spawn emacs --daemon


export LESS="-R -P ?c<- .?f%f:Standard input.  ?n:?eEND:?p%pj\%.. .?c%ccol . ?mFile %i of %m  .?xNext\ %x.%t Press h for help"

## More colors for Less ;)
# 01: bold
# 07: invert colors
# 5-6: blink (slow-fast)
# 38: next argument "5;x", "x" is a fg 0-256 color
# 48: next argument "5;x", "x" is a bg 0-256 color
# 30-37: fg color (darker)
# 40-47: bg color (darker)
# 90-97: fg color (bright)
# 100-107: fg color (bright)
export LESS_TERMCAP_mb=$'\e[01;31m'       # blinking markout
export LESS_TERMCAP_md=$'\e[01;38;5;74m'  # bold markout
export LESS_TERMCAP_so=$'\e[1;104m'       # standout, info box
export LESS_TERMCAP_us=$'\e[04;38;5;146m' # underline

export LESS_TERMCAP_me=$'\e[0m'           # markout end
export LESS_TERMCAP_se=$'\e[0m'           # standout end
export LESS_TERMCAP_ue=$'\e[0m'           # underline end

#export DE="gnome" # xdg-open is stupid and doesn't work for generic DEs

#export LANG="es_ES.utf8"
export LANG="de_DE.utf8"
export LC_ALL=
export LC_COLLATE="C"

################################################################
# add personal PATH to system PATH

export PATH="$PATH:~/bin/"

#export CDPATH=.:~


export PVM_ROOT=/usr/lib/pvm3
export PVM_ARCH=LINUX64
export JAVA_HOME=/usr/lib/jvm/java-6-sun

export XDG_DATA_HOME=~/.config

#############################
# display login messages
clear
echo -e "\e[36m $(uptime)"
#last -3 | head -n $(expr $(last -3 | wc -l) - 2)
echo -e '\e[33m'
fortune -cs
echo -e '\e[00m'

#ipython -p sh

# if [ "$PS1" ] ; then
#     mkdir -m 0700 /sys/fs/cgroup/cpu/user/$$
#     echo $$ > /sys/fs/cgroup/cpu/user/$$/tasks
# fi

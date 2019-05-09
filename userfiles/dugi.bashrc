# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=100000
HISTFILESIZE=100000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
export TERM=xterm-color
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$ '
else
    PS1='\[\033[01;32m\]\u@\[\033[01;31m\]\h:\[\033[01;35m\]\W\[\033[00m\]\$ '
# PS1='${debian_chroot:+($debian_chroot)}\u@\h:\W\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \W\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto --exclude=tags --exclude=cscope.out --exclude-dir=.git --exclude-dir=po --exclude=*.o --exclude=*.o.cmd'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
	alias rm='rm -i'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi
export LS_COLORS="rs=0:di=01;33:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lz=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.axa=00;36:*.oga=00;36:*.spx=00;36:*.xspf=00;36:"
############################################################################## 
# Show The GIT Branch Name In The Prompt
# Note: the /etc/bash_completion.d/git should be exist.
##############################################################################
if [ -f /etc/bash_completion.d/git ]; then
export PS1="\[\033[01;32m\]\u@\[\033[01;31m\]\h:\[\033[01;35m\]\W""\[\e[1;31m\]"'$(__git_ps1 "(%s)")'"\[\e[0m\]""\$ "
fi

LAST_RM1=
_rm()
{
	if [ "$1" = "" ]; then
		echo "Remove with Recycle Bin\""
		return
	fi

    if [ $1 = "-rf" ]; then
		echo "Option:-rf , not support"
		return
	fi

    if [ $1 = "-i" ]; then
		echo "Option: -i , not support"
		return
	fi

    if [ $1 = "--help" ]; then
		echo "Please Read  _rm() in ~/.bashrc for more details"
		return
	fi

	if [ ! -d ~/.rmrecycle ]; then
		echo "Create ~/.rmrecycle"
		mkdir ~/.rmrecycle
	fi

	if [ -d ~/.rmrecycle ]; then
	   mv $1 ~/.rmrecycle/
	  LAST_RM1=$1
	  echo "Remove $1"
	fi
}
_syncrm()
{

	if [ "$1" = "cache" ]; then
		rm -rf ~/.rmrecycle/$LAST_RM1
		echo "Empty cache : ~/.rmrecycle/$LAST_RM1 "
		LAST_RM1=""
    fi

	if [ "$1" = "all" ]; then
		LAST_RM1=""
		rm -rf ~/.rmrecycle/*
		echo "Empty all : ~/.rmrecycle"
	fi

	if [ "$1" = "" ]; then
		echo "Cache:$LAST_RM1"
		echo "Usage:"
		echo "\"syncrm cache\", permanent delete cache"
		echo "\"syncrm all\"  , permanent delete all in ~/.rmrecycle"
	fi
}
_getrmcache()
{


	if [ "$LAST_RM1" = "" ]; then
		echo "Cache is NULL"
		return
	fi

   echo "Cache:$LAST_RM1"

   mv ~/.rmrecycle/$LAST_RM1 ./
   echo "Recover $LAST_RM1 From Cache To Current Folder"
   LAST_RM1=""
}
_listrm()
{
   if [ -d ~/.rmrecycle ]; then
	   ls ~/.rmrecycle
#	   cd ~/.rmrecycle
#	   for i in * ; do
#		   item=$(echo $i)
#		   echo $item
#	   done
   fi
}

alias wrm='_rm'
alias wrmdir='_rm'
alias wsyncrm='_syncrm'
alias wbackrm='_getrmcache'
alias wlistrm='_listrm'
PATH=$PATH:~/bin

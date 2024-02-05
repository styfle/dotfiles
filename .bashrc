alias ls='ls -GF'				# show colors and directories/
alias cp='cp -i'				# prompt before overwrite
alias mv='mv -i'				# prompt before overwrite
alias rm='rm -v'				# print each removal
alias sizeof='du -sh'			# show human readable filesize
alias edit='open -e'			# open with TextEdit
alias ip='curl icanhazip.com'	# print external ip address
alias netip='ifconfig en1 | grep "inet " | tr -d "[:alpha:][000]"'		# print network ip address
alias fraise='open -a "/Applications/Fraise.app"'	# open with Fraise
alias tw='open -a "/Applications/TextWrangler.app"'	# open with TextWrangler
alias asm='gcc -fasm-blocks -m32'	# compile C code containing inline ASM
alias dh='ssh styfle123@amherst.dreamhost.com'		# ssh to DreamHost

HISTCONTROL=ignoreboth # if command starts with space, don't add to history
HISTFILESIZE=1000000000 # extend history file size
HISTSIZE=1000000 # extend history size

function manpdf()		# open man page in Preview.app
{	
	man -t $1 | open -fa "Preview"
}

function extract()		# Handy Extract Program.
{
	if [ -f $1 ] ; then
		case $1 in
			*.tar.bz2)	tar xvjf $1		;;
			*.tar.gz)	tar xvzf $1		;;
			*.bz2)		bunzip2 $1		;;
			*.rar)		unrar x $1		;;
			*.gz)		gunzip $1		;;
			*.tar)		tar xvf $1		;;
			*.tbz2)		tar xvjf $1		;;
			*.tgz)		tar xvzf $1		;;
			*.zip)		unzip $1		;;
			*.Z)		uncompress $1	;;
			*.7z)		7z x $1			;;
			*)			echo "'$1' cannot be extracted via >extract<" ;;
		esac
	else
		echo "'$1' is not a valid file"
	fi
}

function rmflash()
{
	rm -rf "~/Library/Preferences/Macromedia/Flash Player/\#SharedObjects/"*
	rm -rf "~/Library/Preferences/Macromedia/Flash Player/macromedia.com/support/flashplayer/sys/"*
	echo 'Flash Cookies Removed.'
}

function f() {
	TF_PYTHONIOENCODING=$PYTHONIOENCODING;
	export TF_SHELL=bash;
	export TF_ALIAS=fuck;
	export TF_SHELL_ALIASES=$(alias);
	export TF_HISTORY=$(fc -ln -10);
	export PYTHONIOENCODING=utf-8;
	TF_CMD=$(
		thefuck THEFUCK_ARGUMENT_PLACEHOLDER "$@"
	) && eval "$TF_CMD";
	unset TF_HISTORY;
	export PYTHONIOENCODING=$TF_PYTHONIOENCODING;
	history -s $TF_CMD;
}

parse_git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

parse_kube()
{
   kubectl_current_context=$(kubectl config current-context)
   kubectl_project=$(echo $kubectl_current_context | cut -d '_' -f 2)
   kubectl_local=$(echo "docker-desktop")
   if [ "$kubectl_project" = "$kubectl_local" ] ; then
     echo ""
   else
     kubectl_prompt="[$kubectl_project]"
     echo $kubectl_prompt
   fi
}

## Show git branch in terminal
export PS1="\u@\h \[\033[32m\]\w - \$(parse_git_branch) \$(parse_kube)\[\033[00m\] $ "

## Fix ruby gem install step
export GEM_HOME="$HOME/.gem"

## Load secret exported env vars
#source ~/.bash_secrets

source "$HOME/.cargo/env"
. "$HOME/.cargo/env"

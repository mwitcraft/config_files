# Path to your oh-my-zsh installation.
export ZSH="/home/mason/.oh-my-zsh/"

# Add scripts 
export PATH=$PATH:/home/mason/Git/config_files/scripts
export EDITOR='vim'
export VISUAL='vim'

ZSH_THEME="robbyrussell"


# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  extract
  vi-mode
)



################################################
# 	Functions 
################################################
# fzf to navigate to directory
fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}
# fzf to open file
ff() {
  local files
  IFS=$'\n' files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0))
  [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
}
# fzf defaults
export FZF_DEFAULT_OPTS='--height 40% --border'

# oh-my-zsh source file
source $ZSH/oh-my-zsh.sh

################################################
# 	Aliases 
################################################
alias ra='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'
alias ls='ls -al --color=auto'
alias ms='mousepad'

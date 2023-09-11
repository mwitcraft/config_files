################################################
# 	Aliases 
################################################
alias ra='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'
alias ls='ls -a --color=auto'
alias src='source ~/.bashrc'
alias awsconfig='cat ~/.aws/config'
alias cdkdp='cdk deploy --profile 331666498822-administrator'
alias ex='explorer.exe'
alias vac='echo "source ./venv/bin/activate" && source ./venv/bin/activate'
alias kochid='/mnt/c/Program\ Files\ \(x86\)/KochID\ CLI/kochid.exe'
alias shortuuid='/home/mwitcraft/git/scripts/python/venv/bin/python  /home/mwitcraft/git/scripts/python/shortuuid_script.py'

################################################
# 	Functions
################################################
fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | rg --hidden --sort-files --files --null 2> /dev/null | xargs -0 dirname | uniq | fzf +m) &&
  cd "$dir"
}

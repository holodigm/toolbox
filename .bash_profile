export PATH="$HOME/.rbenv/bin:$PATH"
HISTFILESIZE=5000
SUDOLIKEABOSS_WEBSOCKET_URI="ws://127.0.0.1:16263/slab" /usr/local/bin/sudolikeaboss
 source /usr/local/etc/bash_completion.d/git-prompt.sh

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export PATH=$PATH:/usr/local/Cellar/go/1.2.1/libexec/bin
export GOPATH=$HOME/code/go
export PATH=$PATH:$GOPATH/bin
export PATH="/usr/local/bin:$PATH"
export PGHOST=localhost

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
function __git_dirty {
  git diff --quiet HEAD &>/dev/null 
  [ $? == 1 ] && echo "!"
}

function __git_branch {
  __git_ps1 " %s"
}

function __my_rvm_ruby_version {
  local gemset=$(echo $GEM_HOME | awk -F'@' '{print $2}')
  [ "$gemset" != "" ] && gemset="@$gemset"
  local version=$(echo $MY_RUBY_HOME | awk -F'-' '{print $2}')
  [ "$version" == "1.8.7" ] && version=""
  local full="$version"
  #local full="$version$gemset"
  [ "$full" != "" ] && echo "$full "
}

bash_prompt() {
  local NONE="\[\033[0m\]"    # unsets color to term's fg color

  # regular colors
  local K="\[\033[0;30m\]"    # black
  local R="\[\033[0;31m\]"    # red
  local G="\[\033[0;32m\]"    # green
  local Y="\[\033[0;33m\]"    # yellow
  local B="\[\033[0;34m\]"    # blue
  local M="\[\033[0;35m\]"    # magenta
  local C="\[\033[0;36m\]"    # cyan
  local W="\[\033[0;37m\]"    # white

  # emphasized (bolded) colors
  local EMK="\[\033[1;30m\]"
  local EMR="\[\033[1;31m\]"
  local EMG="\[\033[1;32m\]"
  local EMY="\[\033[1;33m\]"
  local EMB="\[\033[1;34m\]"
  local EMM="\[\033[1;35m\]"
  local EMC="\[\033[1;36m\]"
  local EMW="\[\033[1;37m\]"

  # background colors
  local BGK="\[\033[40m\]"
  local BGR="\[\033[41m\]"
  local BGG="\[\033[42m\]"
  local BGY="\[\033[43m\]"
  local BGB="\[\033[44m\]"
  local BGM="\[\033[45m\]"
  local BGC="\[\033[46m\]"
  local BGW="\[\033[47m\]"

  local UC=$W                 # user's color
  [ $UID -eq "0" ] && UC=$R   # root's color

  PS1="$Y\$(__my_rvm_ruby_version)$G\h$W:$Y\W$C\$(__git_branch)$EMY\$(__git_dirty)${NONE} $ "
}
bash_prompt
unset bash_prompt


# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

# env
export XDG_CONFIG_HOME=~/.config
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/go

#  language
export LANGUAGE="en_US.UTF-8"
export LANG="${LANGUAGE}"
export LC_ALL="${LANGUAGE}"
export LC_CTYPE="${LANGUAGE}"

# bindkey
bindkey -e

#コマンドをtypoしたときに聞きなおしてくれる
setopt correct
#表示を詰めてくれる
setopt list_packed
#beepを消す
setopt nolistbeep
#cdとlsの省略
setopt auto_cd

# git
plugins=(git)

# alias
alias la='ls -la'
alias g=git
alias ga='git add .'
alias ra=rails
alias be='bundle exec'
alias bi='bundle install'
alias rdm='rails db:migrate'

# history
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

setopt hist_no_store
setopt share_history
setopt append_history
setopt extended_history
setopt hist_verify

# case insensitive
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# anyenv
if [ -d $HOME/.anyenv ] ; then
  export PATH="$HOME/.anyenv/bin:$PATH"
  eval "$(anyenv init -)"
  # tmux対応
  for D in `\ls $HOME/.anyenv/envs`
  do
    export PATH="$HOME/.anyenv/envs/$D/shims:$PATH"
  done
fi

# peco
function peco-history-selection() {
    BUFFER=`history -n 1 | tail -r  | awk '!a[$0]++' | peco`
    CURSOR=$#BUFFER
    zle reset-prompt
}

zle -N peco-history-selection
bindkey '^R' peco-history-selection

function peco-z-search
{
  which peco z > /dev/null
  if [ $? -ne 0 ]; then
    echo "Please install peco and z"
    return 1
  fi
  local res=$(z | sort -rn | cut -c 12- | peco)
  if [ -n "$res" ]; then
    BUFFER+="cd $res"
    zle accept-line
  else
    return 1
  fi
}
zle -N peco-z-search

# others
## add color to ls command
export CLICOLOR=1
zstyle ':completion:*' list-colors di=34 ln=35 ex=31

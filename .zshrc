# genral
export XDG_CONFIG_HOME=~/.config

# zplug
source ~/.zplug/init.zsh

# anyenv
if [ -d $HOME/.anyenv ] ; then
  export PATH="$HOME/.anyenv/bin:$PATH"
  eval "$(anyenv init -)"
fi

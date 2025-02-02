[ -d /usr/local/opt/zplug ] && export ZPLUG_HOME=/usr/local/opt/zplug
[ -d /opt/homebrew/opt/zplug ] && export ZPLUG_HOME=/opt/homebrew/opt/zplug

source $ZPLUG_HOME/init.zsh

zplug "plugins/git", from:oh-my-zsh

zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-autosuggestions", as:plugin, defer:2
zplug 'zsh-users/zsh-completions', depth:1

zplug "mafredri/zsh-async", from:github # required for below plugin
zplug "sindresorhus/pure", use:pure.zsh, from:github, at:main, as:theme

zplug load

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    zplug install
fi
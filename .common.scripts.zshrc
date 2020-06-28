echo "::::   sourcing .common.scripts.zshrc"

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

####### Zsh-AutoSuggestions Settings
bindkey '^ ' autosuggest-accept
bindkey '\e ' forward-word

####### Zsh Man Page Completion
#zsh autocomplete man pages
zstyle ':completion:*:manuals'    separate-sections true
zstyle ':completion:*:manuals.*'  insert-sections   true
zstyle ':completion:*:man:*'      menu yes select

autoload -U compinit && compinit

#eval "$(direnv hook zsh)"

cd ~/projects

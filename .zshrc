checkSource () {
    if [ -e "$1" ]
    then
	    echo "$1 found. sourcing $1"
        source $1
    else
	    echo "$1 not found."
    fi
}

checkSource $HOME/.oh-my-zsh-presets
checkSource $HOME/.powerlevel9k
checkSource $ZSH/oh-my-zsh.sh
checkSource $HOME/.pltask
checkSource $HOME/.aliases

# User Variables
export DEFAULT_USER="$USER"
export JEKYLL_EDITOR="code"
export LANG=en_US.UTF-8

#Path Extentions
export PATH=$HOME/bin:/usr/local/bin:$PATH # If you come from bash you might have to change your $PATH.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"  #adds MacPorts bin and sbin to Path
export PATH="$PATH:/Applications/sqlcl/bin" # add oracle sqlcl "sql" command to path
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export MANPATH="/opt/local/man:$MANPATH" #MacPorts Man Path
export PATH=/usr/local/bin/mongodb/bin:$PATH #Mongo
PATH=$PATH:"/Users/davidmidlo/.nvm/versions/node/v7.5.0/bin":"/Users/davidmidlo/.nvm/versions/node/v7.5.0/bin":"/usr/bin" && cd /Users/davidmidlo/.nvm/versions/node/v7.5.0/bin/../lib/node_modules/npm-completion && ./update

# Ruby Version Manager
#export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

#Node Version Manager
npm config delete prefix
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#
eval "$(direnv hook zsh)"

cd ~/Dropbox/projects

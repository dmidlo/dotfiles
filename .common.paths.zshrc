echo "::::   sourcing .common.paths.zshrc"

PATH=$HOME/bin:/usr/local/bin:$PATH #Bash Migration to ZSH
PATH="/opt/local/bin:/opt/local/sbin:$PATH"  #adds MacPorts bin and sbin to Path
MANPATH="/opt/local/man:$MANPATH" #MacPorts Man Path
PATH="$PATH:/Applications/sqlcl/bin" # oracle sqlcl "sql"
#PATH="$PATH:$HOME/.rvm/bin" # Add RVM
PATH="$PATH:$HOME/.rvm/bin" # RVM
PATH=/usr/local/bin/mongodb/bin:$PATH # MongoDB
PATH=$PATH:"/Users/davidmidlo/.nvm/versions/node/v7.5.0/bin":"/Users/davidmidlo/.nvm/versions/node/v7.5.0/bin":"/usr/bin" # npm-completion
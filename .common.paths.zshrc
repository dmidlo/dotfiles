echo "::::   sourcing .common.paths.zshrc"

PATH=$HOME/bin:/usr/local/bin:$PATH #Bash Migration to ZSH
PATH="/opt/local/bin:/opt/local/sbin:$PATH"  #adds MacPorts bin and sbin to Path
MANPATH="/opt/local/man:$MANPATH" #MacPorts Man Path
PATH="$PATH:/Applications/sqlcl/bin" # oracle sqlcl "sql"
PATH="$PATH:/usr/local/mysql/bin" #mysql
#PATH="$PATH:$HOME/.rvm/bin" # Add RVM
PATH="$PATH:$HOME/.rvm/bin" # RVM
PATH=/usr/local/bin/mongodb/bin:$PATH # MongoDB
PATH="$PATH:/usr/local/share/dotnet/"
PATH="$PATH:/Users/davidmidlo/.dotnet/tools"
PATH=$PATH:"/Users/davidmidlo/.nvm/versions/node/v16.15.1/bin":"/Users/davidmidlo/.nvm/versions/node/v16.15.1/bin":"/usr/bin" # npm-completion
source /usr/local/bin/virtualenvwrapper.sh


export NVM_DIR="/Users/davidmidlo/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

 # added for npm-completion https://github.com/Jephuff/npm-bash-completion
PATH_TO_NPM_COMPLETION="/Users/davidmidlo/.nvm/versions/node/v7.5.0/lib/node_modules/npm-completion"
source $PATH_TO_NPM_COMPLETION/npm-completion.sh
PATH_TO_NPM_COMPLETION="/Users/davidmidlo/.nvm/versions/node/v7.5.0/bin/../lib/node_modules/npm-completion"[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

PATH_TO_NPM_COMPLETION="/Users/davidmidlo/.nvm/versions/node/v14.4.0/bin/../lib/node_modules/npm-completion"
echo "::::::::   sourcing .autoupdate.zshrc"

#Update Macports
mac-get auto

#Update NPM-Completions
echo "Updating NPM-Completions"
cd /Users/davidmidlo/.nvm/versions/node/v16.15.0/bin/../lib/node_modules/npm-completion && ./update && cd -

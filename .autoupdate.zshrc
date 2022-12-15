echo "::::::::   sourcing .autoupdate.zshrc"

# Check for macOS updates
macos-update check
macos-update auto

#Update Macports
mac-get auto

#Update NPM-Completions
echo "Updating NPM-Completions"
cd /Users/davidmidlo/.nvm/versions/node/v18.12.1/bin/../lib/node_modules/npm-completion && ./update && cd -

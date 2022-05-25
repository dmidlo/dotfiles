echo "::::::::   sourcing .autoupdate.zshrc"

# Check for macOS updates
macos-update check
macos-update auto

#Update Macports
mac-get auto

#Update NPM-Completions
echo "Updating NPM-Completions"
cd /Users/davidmidlo/.nvm/versions/node/v16.15.0/bin/../lib/node_modules/npm-completion && ./update && cd -

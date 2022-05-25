echo "::::   sourcing .common.aliases.zshrc"

alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
alias chrome-canary="/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary"
alias ls='ls -alhG ./ --color=auto'

cd-projects () {cd ~/projects/$1}
pathfinder(){open -a "Path Finder.app" $1}

source ~/.mac-get.zshrc
source ~/.docker_host.zshrc
source ~/.gfmrender.zshrc
source ~/.macos-update.zshrc

alias cb='cd ..'
alias cbb='cd ../..'
alias cbbb='cd ../../..'
alias cbbbb='cd ../../../..'
alias cbbbbb='cd ../../../../..'
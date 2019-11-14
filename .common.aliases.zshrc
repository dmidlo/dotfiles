echo "::::   sourcing .common.aliases.zshrc"

alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
alias chrome-canary="/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary"
alias ls='ls -alhG ./ --color=auto'

cd-projects () {cd ~/Dropbox/projects/$1}
pathfinder(){open -a "Path Finder.app" $1}

source /Users/davidmidlo/Dropbox/projects/dotfiles/.mac-get.zshrc
source /Users/davidmidlo/Dropbox/projects/dotfiles/.docker_host.zshrc
source /Users/davidmidlo/Dropbox/projects/dotfiles/.gfmrender.zshrc
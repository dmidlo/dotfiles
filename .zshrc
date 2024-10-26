echo ""
echo "::   sourcing .zshrc"
echo "Terminal is: $TERM_PROGRAM"

source ~/.common.paths.zshrc
source ~/.common.zshrc
source ~/.common.aliases.zshrc


if [[ "$TERM_PROGRAM" = "vscode" ]]; then
    source ~/.vscode.zshrc
    source ~/.pl10k.zshrc
    source ~/.oh-my-zsh.zshrc
    source ~/.zsh-syntax-highlighting.zshrc
elif [ "$TERM_PROGRAM" = "iTerm.app" ]; then
    source ~/.pl10k.zshrc
    source ~/.oh-my-zsh.zshrc
    source ~/.iterm.HotkeyWindow.zshrc
    source ~/.iterm2_shell_integration.zsh
    source ~/.autoupdate.zshrc
    source ~/.zsh-syntax-highlighting.zshrc
elif [ "$TERM_PROGRAM" = "WarpTerminal" ]; then
    source ~/.oh-my-zsh.zshrc
    source ~/.autoupdate.zshrc
elif [[ "$TERM_PROGRAM" = "Apple_Terminal" ]]; then
fi

source ~/.common.scripts.zshrc

# added for npm-completion https://github.com/Jephuff/npm-bash-completion
PATH_TO_NPM_COMPLETION="/Users/davidmidlo/.nvm/versions/node/v20.18.0/lib/node_modules/npm-completion"
source $PATH_TO_NPM_COMPLETION/npm-completion.sh


PATH_TO_NPM_COMPLETION="/Users/davidmidlo/.nvm/versions/node/v20.18.0/lib/node_modules/npm-completion"


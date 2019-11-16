echo ""
echo "::   sourcing .zshrc"
echo "Terminal is: $TERM_PROGRAM"

source ~/.common.paths.zshrc
source ~/.common.zshrc
source ~/.common.aliases.zshrc

if [[ "$TERM_PROGRAM" = "vscode" ]]; then
    source ~/.vscode.zshrc
elif [[ "$TERM_PROGRAM" = "iTerm.app" ]]; then
    source ~/.pltask.zshrc
    source ~/.pl9k.zshrc
    source ~/.oh-my-zsh.zshrc
    source ~/.iterm.HotkeyWindow.zshrc
    source ~/.autoupdate.zshrc
elif [[ "$TERM_PROGRAM" = "Apple_Terminal" ]]; then
fi

source ~/.zsh-syntax-highlighting.zshrc
source ~/.common.scripts.zshrc

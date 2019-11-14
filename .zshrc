echo ""
echo "::   sourcing .zshrc"
echo "Terminal is: $TERM_PROGRAM"

source /Users/davidmidlo/Dropbox/projects/dotfiles/.common.paths.zshrc
source /Users/davidmidlo/Dropbox/projects/dotfiles/.common.zshrc
source /Users/davidmidlo/Dropbox/projects/dotfiles/.common.aliases.zshrc

if [[ "$TERM_PROGRAM" = "vscode" ]]; then
    source /Users/davidmidlo/Dropbox/projects/dotfiles/.vscode.zshrc
elif [[ "$TERM_PROGRAM" = "iTerm.app" ]]; then
    source /Users/davidmidlo/Dropbox/projects/dotfiles/.pltask.zshrc
    source /Users/davidmidlo/Dropbox/projects/dotfiles/.pl9k.zshrc
    source /Users/davidmidlo/Dropbox/projects/dotfiles/.oh-my-zsh.zshrc
    source /Users/davidmidlo/Dropbox/projects/dotfiles/.iterm.HotkeyWindow.zshrc
    source /Users/davidmidlo/Dropbox/projects/dotfiles/.autoupdate.zshrc
elif [[ "$TERM_PROGRAM" = "Apple_Terminal" ]]; then
fi

source /Users/davidmidlo/Dropbox/projects/dotfiles/.zsh-syntax-highlighting.zshrc
source /Users/davidmidlo/Dropbox/projects/dotfiles/.common.scripts.zshrc

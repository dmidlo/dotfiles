# [[ -z $ITERM_PROFILE ]] ||
# source /Users/davidmidlo/Dropbox/projects/dotfiles/.iterm.HotkeyWindow.zshrc

if [[ "$TERM_PROGRAM" = "vscode" ]]; then
    echo "$TERM_PROGRAM"
    echo "Hello"
elif [[ "$TERM_PROGRAM" = "iTerm.app" ]]; then
    source /Users/davidmidlo/Dropbox/projects/dotfiles/.pltask.zshrc
    source /Users/davidmidlo/Dropbox/projects/dotfiles/.iterm.HotkeyWindow.zshrc
    echo "$TERM_PROGRAM"
fi

# if [ -n $TESTVAR ]
# then
#   if [ $TESTVAR == "x" ]
#   then
#     echo "foo"
#     exit
#   elif [ $TESTVAR == "y" ]
#   then
#     echo "bar"
#     exit
#   else
#     echo "baz"
#     exit
#   fi
# else
#   echo -e "TESTVAR not set\n"
# fi

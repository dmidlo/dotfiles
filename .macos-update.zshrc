echo "::::::   sourcing .macos-update.zshrc"

macos-update () {
    if [[ $1 = "check" ]]; then
        echo ""
        echo ":::::::::: Checking for macOS System Updates."
        softwareupdate -l
        echo ""
        echo ":::::::::: Checking for App Store Updates."
        mas outdated
    elif [[ $1 = "update-system" ]]; then
        softwareupdate --all --install --force
    elif [[ $1 = "update-appstore" ]]; then
        mas upgrade
    elif [[ $1 = "auto" ]]; then
        read -q -t 5 $'response?mac-update:  Apply system and App Store Updates? [y/N]: \n'
        if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]; then
            macos-update update-system
            macos-update update-appstore
        else
            echo "  skipping system and app store updates."
        fi
    fi
}
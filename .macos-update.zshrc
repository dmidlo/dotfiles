echo "::::::   sourcing .macos-update.zshrc"

macos-update () {
    if [[ $1 = "check" ]]; then
        softwareupdate -l
        mas outdated
    elif [[ $1 = "update-system" ]]; then
        softwareupdate --all --install --force
    elif [[ $1 = "update-appstore" ]]; then
        mas upgrade
    elif [[ $1 = "auto" ]]; then
        read -q -t 5 $'response?mac-update:  Apply system and App Store Updates? [y/N]: \n'
        if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]; then
            mac-update update-system
            mac-update update-appstore
        else
            echo "  skipping system and app store updates."
        fi
    fi
}
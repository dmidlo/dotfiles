echo "::::::::   sourcing .autoupdate.zshrc"


system_updater () {
    # # Check for macOS updates
    macos-update check
    macos-update auto

    # #Update Macports
    mac-get auto

    # #Update NPM-Completions
    echo ""
    echo ":::::::::: Checking for Updates to NPM-Completions"
    cd /Users/davidmidlo/.nvm/versions/node/v20.18.0/bin/../lib/node_modules/npm-completion && ./update && cd -
}

system_updater_to_file () {
    date +%y%m%d > ~/.updater.today
}

system_updater_msg () {
    echo "system_updater already run today."
    echo " - run 'system_updater' to check for system, App Store, and port updates again."
}

system_updater_run () {
    if test -f ~/.updater.today; then
        export UPDATER_TODAY=$(cat ~/.updater.today)
    else
        system_updater_to_file
    fi

    if [[ -z "${UPDATER_TODAY}" ]]; then
        system_updater
    else
        if (( $UPDATER_TODAY < $(date +%y%m%d) )); then
            system_updater
            system_updater_to_file
        else
            system_updater_msg
        fi
    fi
}

system_updater_run
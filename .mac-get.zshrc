echo "::::::   sourcing .mac-get.zshrc"

mac-get () {
    if [[ $1 = "update" ]]; then
        sudo port -d selfupdate
    elif [[ $1 = "upgrade" ]]; then
        sudo port -d upgrade outdated
    elif [[ $1 = "install" ]]; then
        sudo port -d install $2
    elif [[ $1 = "dist-upgrade" ]]; then
        if [[ -a $HOME/myports.txt ]]; then
            rm -f $HOME/myports.txt
            echo "mac-get:  refreshing $HOME/myports.txt"
        fi
        sudo port -qv installed > $HOME/myports.txt
        cat $HOME/myports.txt

        if [[ -a $HOME/requested.txt ]]; then
            rm -f $HOME/requested.txt
            echo "mac-get:  refreshing $HOME/requested.txt"
        fi
        sudo port echo requested | cut -d ' ' -f 1 > $HOME/requested.txt
        cat $HOME/requested.txt

        if [[ -a $HOME/restore_ports.tcl ]]; then
            rm -f $HOME/restore_ports.tcl
            echo "mac-get:  refreshing $HOME/restore_ports.tcl"
        fi
        sudo curl -o $HOME/restore_ports.tcl --location --remote-name https://github.com/macports/macports-contrib/raw/master/restore_ports/restore_ports.tcl
        sudo chmod +x $HOME/restore_ports.tcl
        echo "\n"
        echo "\n"
        echo "mac-get:  port records backed up and restore script updated. \n"
        read -q -t 8 "response?mac-get:  Proceed with dist upgrade? This can take a long time and things break too. [y/N]:"
        echo "\n"
        if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]; then
            sudo port -f uninstall installed
            sudo rm -rf /opt/local/var/macports/build/*
            sudo $HOME/restore_ports.tcl $HOME/myports.txt
            sudo port unsetrequested installed
            xargs sudo port setrequested < $HOME/requested.txt
        else
            echo "mac-get:  skipping mac-ports dist upgrade."
        fi
    elif [[ $1 = "auto" ]]; then
        read -q -t 5 $'response?mac-get:  Update Macports? [y/N]: \n'
        if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]; then
            mac-get update
            mac-get upgrade
        else
            echo "  skipping mac-ports update."
        fi
    fi
}
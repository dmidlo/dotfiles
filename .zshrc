# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

###### Powerlevel9k Settings
POWERLEVEL9K_MODE="awesome-patched"
ZSH_THEME="powerlevel9k/powerlevel9k"

#pltask functions
## pltask is a lightweight facade to taskwarrior for use with Powerlevel9k's Second Prompt Prefix (by dmidlo @querentCode)
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="\n"

pltask () {
    setNewlinePrompt () {
        POWERLEVEL9K_MULTILINE_SECOND_PROMPT_PREFIX="%K{white}%F{black}\n $1 %f%k%F{white}%f $ "
    }

    if [ -n "$3" ]; then
        echo "pltask only supports two args. did\nyou remember to use quotes when\ncreating a task?"
        return 1
    elif [ -z "$1" ]; then
        export PLTASK=`task _get 1.description`
        if [ -z "$PLTASK" ]; then
            echo "no tasks in queue, go do something else"
            echo "Setting pltask to '.' "
            setNewlinePrompt "."
        else
            echo "Setting pltask to first task from taskwarrior:" $PLTASK
            setNewlinePrompt $PLTASK
        fi
    elif [[ $1 = "_print" || $1 = "_p" ]]; then
         echo $PLTASK
    elif [[ $1 = "help" || $1 = "h" ]]; then
        echo "\n pltask is a lightweight facade to taskwarrior for use with Powerlevel9k's Second Prompt Prefix\n"
        echo   Options:
        echo -----------------------------------------------------------------------------
        echo   "  No args           ---   Calls first available task from taskwarrior."
        echo   "  help              ---   h - This help dialog."
        echo   "  list              ---   ls - A Wrapper for \'task next\'."
        echo   "  set  <taskID>     ---   s - Sets the pltask prompt to description of specified task id."
        echo   "  done              ---   d - Completes the current task and sets pltask to next task."
        echo   "  \"string\"          ---       \"string\" with no additional arguments, sets the pltask prompt but no new task."
        echo   "  \"string\" add      ---   a - \"string\" followed by 'add' will set the pltask and add a new task to taskwarrior.\n\n"
        echo   Examples:
        echo "-----------------------------------------------------------------------------\n"
        echo "   Create a task:"
        echo "      $ pltask \"Edit Super Cool Project\" add"
        echo "      $ pltask \"Write Blog Post\" a"
    elif [[ $1 = "list" || $1 = "ls" ]]; then
        task next
    elif [[ $1 = "set" || $1 = "s" ]]; then
        export PLTASK=`task _get $2.description`
        if [ -z "$PLTASK" ]; then
            export PLTASK=`task _get 1.description`
            if [ -z "$PLTASK" ]; then
                pltask
            else
                echo "no task with id $2 in queue"
                echo "Setting pltask to first available task: " $PLTASK
                setNewlinePrompt $PLTASK
            fi
        else
            echo "Setting pltask to task id $2:" $PLTASK
            setNewlinePrompt $PLTASK
        fi
    elif [[ $1 = "done" || $1 = "d" ]]; then
        task /$PLTASK/ done
        task
        export PLTASK=`task _get 1.description`
        if [ -z "$PLTASK" ]; then
                pltask
        else
            echo "Setting pltask to next task: "$PLTASK
            setNewlinePrompt $PLTASK
        fi
    elif [ -z "$2" ]; then
        setNewlinePrompt $1
        echo "terminal pltask set to " $1 "But no task has been created"
    elif [[ $2 = "add" || $2 = "a" ]]; then
        export PLTASK="$1"
        task "$1" add
        task
        setNewlinePrompt $1
    fi
}
# Initial state
pltask "."


POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon ssh context root_indicator dir dir_writable vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status command_execution_time background_jobs anaconda pyenv virtualenv rbenv rvm nodeenv nvm time)

POWERLEVEL9K_DIR_HOME_BACKGROUND='087'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='087'
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='087'
POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_FOREGROUND="015"

POWERLEVEL9K_VCS_GIT_ICON=''
POWERLEVEL9K_VCS_STAGED_ICON='\u00b1'
POWERLEVEL9K_VCS_UNTRACKED_ICON='\u25CF'
POWERLEVEL9K_VCS_UNSTAGED_ICON='\u00b1'
POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON='\u2193'
POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON='\u2191'

POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='yellow'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='009'

POWERLEVEL9K_IP_INTERFACE=eth0

POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=4

POWERLEVEL9K_TIME_FORMAT="%D{%H:%M \uE868  %d.%m.%y}"

POWERLEVEL9K_STATUS_VERBOSE=true
POWERLEVEL9K_STATUS_OK_IN_NON_VERBOSE=true


######### Oh-My-Zsh Presets
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(boot2docker codeclimate colored-man-pages colorize command-not-found common-aliases cp django docker docker-compose ember-cli fabric gem git git-extras git-prompt git-remote-branch github gnu-utils macports man nmap node npm nvm osx per-directory-history pip pylint python ruby rvm spring sublime sudo systemd taskwarrior urltools vagrant virtualenv web-search xcode zsh-autosuggestions zsh-completions zsh-navigation-tools zsh_reload zsh-syntax-highlighting history-substring-search)

source $ZSH/oh-my-zsh.sh

###### Zsh-Syntax-Highlighting Settings

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
ZSH_HIGHLIGHT_STYLES[cursor]='bold'

ZSH_HIGHLIGHT_STYLES[alias]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[suffix-alias]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[function]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[command]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[hashed-command]='fg=green,bold'

####### Zsh-AutoSuggestions Settings
bindkey '^ ' autosuggest-accept
bindkey '\e ' forward-word

###### Zsh-history-substring-search
export HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=1
export HISTORY_SUBSTRING_SEARCH_FUZZY=1


###### User configuration
export DEFAULT_USER="$USER"
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"  #adds MacPorts bin and sbin to Path
export MANPATH="/opt/local/man:$MANPATH" #MacPorts Man Path
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH="$PATH:/Applications/sqlcl/bin" # add oracle sqlcl "sql" command to path
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export LANG=en_US.UTF-8

alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
alias chrome-canary="/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary"
alias ls='ls -alhG ./ --color=auto'


# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"


####### Zsh Man Page Completion
#zsh autocomplete man pages
zstyle ':completion:*:manuals'    separate-sections true
zstyle ':completion:*:manuals.*'  insert-sections   true
zstyle ':completion:*:man:*'      menu yes select

autoload -U compinit && compinit

cd-projects () {cd ~/Dropbox/projects/$1}

mac-get () {
    if [[ $1 = "update" ]]; then
        sudo port -d selfupdate
    elif [[ $1 = "upgrade" ]]; then
        sudo port -d upgrade outdated
    elif [[ $1 = "install" ]]; then
        sudo port -d install $2
    fi
}

docker_host () {
    if [[ -n "$4" || $1 = "help" ]]; then
        echo "Usage:  docker_host local|remote <host_path> <tls_verify>\n"
        echo "docker_host only supports three arguments.\nMake sure to use doube quotes when specifiying host.\n\n if you're still having trouble, check TLS setting with:\n echo \$DOCKER_TLS_VERIFY\n\n"
    elif [ -z "$1" ]; then
        echo "Docker Host Environment Variable Not Set.\nDocker will use default unix:///var/run/docker.sock"
    elif [[ $1 = "local" || $1 = "l" ]]; then
        if [ -z "$2" ]; then
            export DOCKER_HOST=unix:///var/run/docker.sock DOCKER_TLS_VERIFY=$3
            echo "Docker Host Environment Variable Set to:" $DOCKER_HOST
        else
            export DOCKER_HOST="$2" DOCKER_TLS_VERIFY=$3
            echo "Docker Host Environment Variable Set to:" $DOCKER_HOST
        fi
    elif [[ $1 = "remote" || $1 = "r" ]]; then
        if [ -z "$2" ]; then
            export DOCKER_HOST=tcp://swarm-01:2376 DOCKER_TLS_VERIFY=1
            echo "Docker Host Environment Variable Set to:" $DOCKER_HOST
        else
            export DOCKER_HOST="$2" DOCKER_TLS_VERIFY=$3
            echo "Docker Host Environment Variable Set to:" $DOCKER_HOST
        fi
    fi
}


 # added for npm-completion https://github.com/Jephuff/npm-bash-completion
PATH=$PATH:"/Users/davidmidlo/.nvm/versions/node/v7.5.0/bin":"/Users/davidmidlo/.nvm/versions/node/v7.5.0/bin":"/usr/bin" && cd /Users/davidmidlo/.nvm/versions/node/v7.5.0/bin/../lib/node_modules/npm-completion && ./update

#PATH_TO_NPM_COMPLETION="/Users/davidmidlo/.nvm/versions/node/v7.5.0/lib/node_modules/npm-completion"
#source $PATH_TO_NPM_COMPLETION/npm-completion.sh
#PATH_TO_NPM_COMPLETION="/Users/davidmidlo/.nvm/versions/node/v7.5.0/bin/../lib/node_modules/npm-completion"eval $(/usr/libexec/path_helper -s)

#
eval "$(direnv hook zsh)"

########  Color Settings For ls command
LS_COLORS='no=00:fi=00:di=34:ow=34;40:ln=35:pi=30;44:so=35;44:do=35;44:bd=33;44:cd=37;44:or=05;37;41:mi=05;37;41:ex=01;31:*.cmd=01;31:*.exe=01;31:*.com=01;31:*.bat=01;31:*.reg=01;31:*.app=01;31:*.txt=32:*.org=32:*.md=32:*.mkd=32:*.h=32:*.hpp=32:*.c=32:*.C=32:*.cc=32:*.cpp=32:*.cxx=32:*.objc=32:*.cl=32:*.sh=32:*.bash=32:*.csh=32:*.zsh=32:*.el=32:*.vim=32:*.java=32:*.pl=32:*.pm=32:*.py=32:*.rb=32:*.hs=32:*.php=32:*.htm=32:*.html=32:*.shtml=32:*.erb=32:*.haml=32:*.xml=32:*.rdf=32:*.css=32:*.sass=32:*.scss=32:*.less=32:*.js=32:*.coffee=32:*.man=32:*.0=32:*.1=32:*.2=32:*.3=32:*.4=32:*.5=32:*.6=32:*.7=32:*.8=32:*.9=32:*.l=32:*.n=32:*.p=32:*.pod=32:*.tex=32:*.go=32:*.sql=32:*.csv=32:*.bmp=33:*.cgm=33:*.dl=33:*.dvi=33:*.emf=33:*.eps=33:*.gif=33:*.jpeg=33:*.jpg=33:*.JPG=33:*.mng=33:*.pbm=33:*.pcx=33:*.pdf=33:*.pgm=33:*.png=33:*.PNG=33:*.ppm=33:*.pps=33:*.ppsx=33:*.ps=33:*.svg=33:*.svgz=33:*.tga=33:*.tif=33:*.tiff=33:*.xbm=33:*.xcf=33:*.xpm=33:*.xwd=33:*.xwd=33:*.yuv=33:*.aac=33:*.au=33:*.flac=33:*.m4a=33:*.mid=33:*.midi=33:*.mka=33:*.mp3=33:*.mpa=33:*.mpeg=33:*.mpg=33:*.ogg=33:*.opus=33:*.ra=33:*.wav=33:*.anx=33:*.asf=33:*.avi=33:*.axv=33:*.flc=33:*.fli=33:*.flv=33:*.gl=33:*.m2v=33:*.m4v=33:*.mkv=33:*.mov=33:*.MOV=33:*.mp4=33:*.mp4v=33:*.mpeg=33:*.mpg=33:*.nuv=33:*.ogm=33:*.ogv=33:*.ogx=33:*.qt=33:*.rm=33:*.rmvb=33:*.swf=33:*.vob=33:*.webm=33:*.wmv=33:*.doc=31:*.docx=31:*.rtf=31:*.odt=31:*.dot=31:*.dotx=31:*.ott=31:*.xls=31:*.xlsx=31:*.ods=31:*.ots=31:*.ppt=31:*.pptx=31:*.odp=31:*.otp=31:*.fla=31:*.psd=31:*.7z=1;35:*.apk=1;35:*.arj=1;35:*.bin=1;35:*.bz=1;35:*.bz2=1;35:*.cab=1;35:*.deb=1;35:*.dmg=1;35:*.gem=1;35:*.gz=1;35:*.iso=1;35:*.jar=1;35:*.msi=1;35:*.rar=1;35:*.rpm=1;35:*.tar=1;35:*.tbz=1;35:*.tbz2=1;35:*.tgz=1;35:*.tx=1;35:*.war=1;35:*.xpi=1;35:*.xz=1;35:*.z=1;35:*.Z=1;35:*.zip=1;35:*.ANSI-30-black=30:*.ANSI-01;30-brblack=01;30:*.ANSI-31-red=31:*.ANSI-01;31-brred=01;31:*.ANSI-32-green=32:*.ANSI-01;32-brgreen=01;32:*.ANSI-33-yellow=33:*.ANSI-01;33-bryellow=01;33:*.ANSI-34-blue=34:*.ANSI-01;34-brblue=01;34:*.ANSI-35-magenta=35:*.ANSI-01;35-brmagenta=01;35:*.ANSI-36-cyan=36:*.ANSI-01;36-brcyan=01;36:*.ANSI-37-white=37:*.ANSI-01;37-brwhite=01;37:*.log=01;32:*~=01;32:*#=01;32:*.bak=01;33:*.BAK=01;33:*.old=01;33:*.OLD=01;33:*.org_archive=01;33:*.off=01;33:*.OFF=01;33:*.dist=01;33:*.DIST=01;33:*.orig=01;33:*.ORIG=01;33:*.swp=01;33:*.swo=01;33:*,v=01;33:*.gpg=34:*.gpg=34:*.pgp=34:*.asc=34:*.3des=34:*.aes=34:*.enc=34:*.sqlite=34:';
export LS_COLORS

cd ~/Dropbox/projects

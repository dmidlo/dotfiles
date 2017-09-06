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
export LANG=en_US.UTF-8

alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
alias chrome-canary="/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary"
alias l='ls -alh'

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"


####### Zsh Man Page Completion
#zsh autocomplete man pages
zstyle ':completion:*:manuals'    separate-sections true
zstyle ':completion:*:manuals.*'  insert-sections   true
zstyle ':completion:*:man:*'      menu yes select

autoload -U compinit && compinit

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


cd ~/Dropbox/projects

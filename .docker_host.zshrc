echo "::::::   sourcing .docker_host.zshrc"

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
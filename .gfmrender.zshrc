echo "::::::   sourcing .gfmrender.zshrc"

gfmrender(){ 
    HTMLFILE="$(mktemp -u).html"
    cat "$1" | \
      jq --slurp --raw-input '{"text": "\(.)", "mode": "markdown"}' | \
      curl -s --data @- https://api.github.com/markdown > "$HTMLFILE"
    echo $HTMLFILE
    open "$HTMLFILE"
}

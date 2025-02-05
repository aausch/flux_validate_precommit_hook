#!/usr/bin/env bash
error_on_output=1
FILE=deps/validate.sh
if [ ! -f "$FILE" ]; then
    mkdir -p deps
    curl -sL https://github.com/fluxcd/flux2-kustomize-helm-example/blob/main/scripts/validate.sh > "$FILE"
fi
cmd=(deps/validate.sh)
target=(.)
. "$(dirname "${0}")/lib/cmd-repo.bash"
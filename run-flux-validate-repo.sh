#!/usr/bin/env bash

error_on_output=1
FILE=/tmp/flux-validate/validate.sh
if [ ! -f "$FILE" ]; then
    mkdir -p /tmp/flux-validate/
    curl -sL https://github.com/fluxcd/flux2-kustomize-helm-example/blob/main/scripts/validate.sh > "$FILE"
fi
cmd=("$FILE")
target=(.)
. "$(dirname "${0}")/lib/cmd-repo.bash"
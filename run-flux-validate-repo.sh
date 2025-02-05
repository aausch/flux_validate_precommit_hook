#!/usr/bin/env bash

error_on_output=1
FILE=/tmp/flux-validate-precommit-hook/validate.sh
if [[ ! -f "${FILE}" ]]; then
	mkdir -p /tmp/flux-validate-precommit-hook
	curl -sL https://raw.githubusercontent.com/fluxcd/flux2-kustomize-helm-example/refs/heads/main/scripts/validate.sh > "${FILE}"
	chmod +x "${FILE}"
fi
cmd=("${FILE}")
target=("> /dev/null")
. "$(dirname "${0}")/lib/cmd-repo.bash"

# shellcheck shell=bash

# shellcheck source=./common.bash
. "$(dirname "${0}")/lib/common.bash"

prepare_directory_hook_cmd "$@"

error_code=0
for directory in "${DIRECTORIES[@]}"; do
	pushd "${directory}" || exit 1
	if ! /usr/bin/env "${ENV_VARS[@]}" "${cmd[@]}" "${OPTIONS[@]}"; then
		error_code=1
	fi
	popd || exit 1
done
exit $error_code
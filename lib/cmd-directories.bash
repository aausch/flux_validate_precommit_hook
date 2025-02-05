# shellcheck shell=bash

# shellcheck source=./common.bash
. "$(dirname "${0}")/lib/common.bash"

prepare_directory_hook_cmd "$@"
error_code=0
for directory in "${DIRECTORIES[@]}"; do
        pushd "${directory}"
        if [ "${error_on_output:-}" -eq 1 ]; then
                output=$(/usr/bin/env "${ENV_VARS[@]}" "${cmd[@]}" "${OPTIONS[@]}" 2>&1)
                if [ -n "${output}" ]; then
                        printf "%s\n" "${output}"
                        error_code=1
                fi
        elif ! /usr/bin/env "${ENV_VARS[@]}" "${cmd[@]}" "${OPTIONS[@]}"; then
                error_code=1
        fi
        popd
done

# # shellcheck source=./cleanup.bash
. "$(dirname "${0}")/lib/cleanup.bash"

exit $error_code
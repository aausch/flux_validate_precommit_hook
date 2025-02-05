# Fetches then runs the validate.sh script provided by the flux folk against the entire repo

Credit: Adapted for this purpose from https://github.com/TekWizely/pre-commit-golang/

This repo provides several [pre-commit](pre-commit.com) hooks:
```
  - repo: https://github.com/aausch/flux_validate_precommit_hook
    rev: v0.0.1
    hooks:
      - id: run-flux-validate-repo
      - id: run-flux-validate

```
The hooks download the `validate.sh` file from https://raw.githubusercontent.com/fluxcd/flux2-kustomize-helm-example/refs/heads/main/scripts/validate.sh
and then run it against local flux2 + helm configurations

WARNING: experimental/wip
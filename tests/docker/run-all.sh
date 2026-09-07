#!/usr/bin/env bash
# Runs every tests/docker/run-*.sh suite in sequence. Requires Docker.
set -uo pipefail
cd "$(dirname "${BASH_SOURCE[0]}")" || exit 1

overall=0
for suite in run-ps-compat.sh run-gtk-terminals.sh run-file-terminals.sh; do
  bash "$suite"
  status=$?
  [ "$status" -eq 0 ] || overall=1
  echo
done

exit "$overall"

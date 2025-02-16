#!/usr/bin/env bash
set -euo pipefail

version() {
    grep '^version:' Chart.yaml | sed -nE "s/^[[:space:]]*version:[[:space:]]*['\"]?(.*)['\"]?$/\1/p" | sed 's/"$//'
}

package() {
    helm package go-api
}

if [ "$1" == "package" ]; then
    package
else
    echo "Unknown command: $1"
fi
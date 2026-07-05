#!/usr/bin/env bash

set -o nounset

cd "$(dirname "$0")" || exit 1

{
    echo -e "# Index\n"

    echo -e "## Folien\n"

    git ls-files --format='- [%(path)](%(path))' -- . \
        ':!:README.md' ':!:index.md' |
        grep -E "\.(pdf|html|md|txt))$"

    echo -e "\n## Downloads\n"

    # Section for everything that a web browser cannot display natively
    git ls-files --format='- [%(path)](%(path))' -- . | \
        grep -E "\.(hs|cast|tar.gz|zip))$"

    echo -e "\n## Sonstiges"
} > index.md

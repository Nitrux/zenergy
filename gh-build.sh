#!/usr/bin/env bash

set -euo pipefail
set -x

cd -- "$(dirname -- "${BASH_SOURCE[0]}")"

### Basic Packages
apt -qq update
apt -qq -yy install equivs git devscripts lintian --no-install-recommends

### Install Dependencies
mk-build-deps -i -t "apt-get --yes" -r

### Build Deb
debuild -b -uc -us

### Move Deb to current directory because debuild decided
### that it was a GREAT IDEA TO PUT THE FILE ONE LEVEL ABOVE
mv -- ../zenergy-dkms_*.deb .

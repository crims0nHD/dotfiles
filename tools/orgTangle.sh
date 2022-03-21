#!/bin/bash

# A script that tangles org files into configs, documents or other files
# NOTE: The purpouse of this script is to provide basic tangle features,
#       anything that exceeds this will probably never be supported.
# Keep dependencies low, basic and modular. I don't want to install haskell just to
# execute some random regex that rely on some wibbly wobbly regex quirks by that implementation.

# Also keep in mind that this script should be portable to most GNU and non-GNU + Linux distros
# as well as x86_64, i686, aarch64 (raspberry pi and phones), powerpc big endian (WiiU, deal with
# it), ...

file_path = $1


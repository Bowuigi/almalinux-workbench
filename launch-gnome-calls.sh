#!/bin/sh

# Set this to the absolute path where the gnome-calls tarball was extracted.
# Move this script to your PATH (possibly renaming it) afterwards
gnome_calls_rootdir="$PWD"

export FOLKS_BACKEND_PATH="${gnome_calls_rootdir}/lib64/folks/26/backends"
export CALLS_PLUGIN_DIR="${gnome_calls_rootdir}/lib64/calls/plugins"
export XDG_DATA_DIRS="${gnome_calls_rootdir}/share:${XDG_DATA_DIRS}"

exec -- "${gnome_calls_rootdir}/bin/gnome-calls" "$@"

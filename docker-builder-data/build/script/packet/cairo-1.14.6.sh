DEPS="png-1.6.26 pixman-0.34.0"

PK_DIRNAME="cairo-1.14.6"
PK_ARCHIVE="$PK_DIRNAME.tar.xz"
PK_URL="https://www.cairographics.org/releases/$PK_ARCHIVE"
PK_LICENSE_FILES="AUTHORS COPYING COPYING-LGPL-2.1 COPYING-MPL-1.1"

source $INCLUDE_SCRIPT_DIR/inc-pkall-default.sh

if [ "$PLATFORM" = "linux" ] || [ ! -z "$IS_NATIVE" ]; then
    DEPS="$DEPS xcbfull-1.12"
fi

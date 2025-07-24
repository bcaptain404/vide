#!/bin/bash
set -e

#todo: dependencies in readme: curl, vim-9.1
function Go() {
    local HOMEDIR="./sandbox"
    local VIMDIR="${HOMEDIR}/.vim"

    echo "## Making dirs..."
    {
        local DIR
        for DIR in autoload plugged plugin ; do
            mkdir -p "${VIMDIR}/${DIR}"
        done
    }

    printf "## Checking for vim-plug: "
    if [ ! -f "$VIMDIR"/autoload/plug.vim ] ; then
        echo "Installing..."
        curl -fLo "$VIMDIR"/autoload/plug.vim --create-dirs \
          https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    else
        echo "Present"
    fi

    # todo: remove this in production build
    if [ ! -f "${HOMEDIR}/.vimrc" ]; then
        if [ -f "${HOME}/.vimrc" ]; then
            cp "${HOME}/.vimrc" "${HOMEDIR}/.vimrc"
        fi
    fi


    echo "## Installing vim-plug plugins..."
    HOME="$HOMEDIR" vim -u "${HOMEDIR}/.vimrc" --cmd "set runtimepath+=${VIMDIR}" +PlugInstall +qall

    echo "## Done."
}

Go "$@"


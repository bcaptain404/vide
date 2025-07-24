#!/bin/bash
set -e

#todo: for readme: only vim 9.1 was tested with these plugins
function Go() {
    local HOMEDIR="$1"
    local VIMDIR="${HOMEDIR}/.vim"
    local SRCDIR="./configs"

    echo "## Checking dependencies..."
    local DEP
    for DEP in curl vim python3 nodejs npm; do
        command -v $DEP >/dev/null 2>&1 || { echo >&2 "$DEP is required."; exit 2; }
    done

    echo "## Basic checks..."
    if [ ! -d "${SRCDIR}" ]; then
    echo "ERROR: Configs directory ${SRCDIR} does not exist!"; exit 3;
    fi
    if [ ! -f "${SRCDIR}/.vimrc" ]; then
        echo "ERROR: ${SRCDIR}/.vimrc not found!"; exit 3;
    fi
    if [ ! -f "${SRCDIR}/coc-settings.json" ]; then
        echo "ERROR: ${SRCDIR}/coc-settings.json not found!"; exit 3;
    fi

    echo "## Making dirs..."
    {
        local DIR
        for DIR in autoload plugged plugin ; do
            mkdir -p "${VIMDIR}/${DIR}"
        done
    }

    if [ ! -f "$VIMDIR"/autoload/plug.vim ] ; then
        echo "## Installing vim-plug..."
        curl -fLo "$VIMDIR"/autoload/plug.vim --create-dirs \
          https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    else
        echo "## vim-plug already installed"
    fi

    echo "## Installing configs..."
    cp -i "${SRCDIR}/.vimrc" "${HOMEDIR}/.vimrc"
    cp -i "${SRCDIR}/coc-settings.json" "${VIMDIR}/coc-settings.json"

    echo "## Installing vim-plug plugins..."
    HOME="$HOMEDIR" vim -u "${HOMEDIR}/.vimrc" --cmd "set runtimepath+=${VIMDIR}" +PlugInstall +qall

    echo "## Installing CoC plugins..."
    local COCP=(
        coc-sh
        coc-highlight
        coc-json
        coc-clangd
        coc-python
        coc-pyright
        coc-snippets
    )
    echo "## CoC extensions to install: ${COCP[*]}"
    HOME="$HOMEDIR" vim +CocInstall\ -sync\ ${COCP[*]} +qall

    # todo later: commit hashes would be a good idea

    echo "## Done."
}

if (( $# < 1 )) ; then
    echo "Usage: $0 [homedir]"
    exit 1
else
    Go "$@"
fi



export LSST_HOME="${CONDA_PREFIX}/lsst_home"
export LSST_CONDA_ENV_NAME=${CONDA_DEFAULT_ENV}

export EUPS_DIR="${LSST_HOME}/eups/2.1.5"
source ${EUPS_DIR}/bin/setups.sh
export -f setup
export -f unsetup
LSST_EUPS_PKGROOT_BASE_URL="https://eups.lsst.codes/stack"
if [[ `uname -s` == "Darwin" ]]; then
    EUPS_PKGROOT="${LSST_EUPS_PKGROOT_BASE_URL}/osx/10.9/clang-1000.10.44.4/miniconda3-4.5.12-1172c30|$LSST_EUPS_PKGROOT_BASE_URL/src"
else
    EUPS_PKGROOT="$LSST_EUPS_PKGROOT_BASE_URL/src"
fi
export EUPS_PKGROOT="${EUPS_PKGROOT}"

# try except
{
    setup lsst_distrib
} || {
    echo "\

You must run:

    eups distrib install -v -t v18_1_0 lsst_distrib
    curl -sSL https://raw.githubusercontent.com/lsst/shebangtron/master/shebangtron | python
    setup lsst_distrib

in order to use the stack!
"
}

function _backup_and_append_envvar() {
    local way=$1
    local envvar=$2
    local appval=$3
    local appsep=$4
    eval oldval="\$${envvar}"

    if [[ ${way} == "activate" ]]; then
        eval "export STACKVANA_BACKUP_${envvar}=${oldval}"
        if [[ ! ${oldval} ]]; then
            eval "export ${envvar}=${appval}"
        else
            eval "export ${envvar}=${oldval}${appsep}${appval}"
        fi
    else
        eval backval="\$STACKVANA_BACKUP_${envvar}"

        if [[ ! ${backval} ]]; then
            eval "unset ${envvar}"
        else
            eval "export ${envvar}=${backval}"
        fi
        eval "unset STACKVANA_BACKUP_${envvar}"
    fi
}

# conda env includes are searched after the command line -I paths
_backup_and_append_envvar \
    activate \
    CPATH \
    "${CONDA_PREFIX}/include" \
    ":"

# add conda nv libraries for linking
_backup_and_append_envvar \
    activate \
    LIBRARY_PATH \
    "${CONDA_PREFIX}/lib" \
    ":"

# set rpaths to rsolve links properly at run time
_backup_and_append_envvar \
    activate \
    LDFLAGS \
    "-Wl,-rpath,${CONDA_PREFIX}/lib -L${CONDA_PREFIX}/lib" \
    " "

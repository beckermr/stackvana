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

# add to the flags for building stuff with eups
if [[ ! ${CPATH} ]]; then
    export CPATH="${CONDA_PREFIX}/include"  # searched after the command line
else
    export CPATH="${CPATH}:${CONDA_PREFIX}/include"  # searched after the command line
fi

if [[ ! ${LIBRARY_PATH} ]]; then
    export LIBRARY_PATH="${CONDA_PREFIX}/lib"
else
    export LIBRARY_PATH="${LIBRARY_PATH}:${CONDA_PREFIX}/lib"
fi

if [[ ! ${LD_LIBRARY_PATH} ]]; then
    export LD_LIBRARY_PATH="${CONDA_PREFIX}/lib"
else
    export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:${CONDA_PREFIX}/lib"
fi

if [[ ! ${LDFLAGS} ]]; then
    export LDFLAGS="-Wl,-rpath,${CONDA_PREFIX}/lib -L${CONDA_PREFIX}/lib"
else
    export LDFLAGS="${LDFLAGS} -Wl,-rpath,${CONDA_PREFIX}/lib -L${CONDA_PREFIX}/lib"
fi

unsetup lsst_distrib
unset EUPS_PKGROOT
unset EUPS_DIR
unset LSST_CONDA_ENV_NAME
unset LSST_HOME

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
    deactivate \
    CPATH \
    "${CONDA_PREFIX}/include" \
    ":"

# add conda nv libraries for linking
_backup_and_append_envvar \
    deactivate \
    LIBRARY_PATH \
    "${CONDA_PREFIX}/lib" \
    ":"

# set rpaths to rsolve links properly at run time
_backup_and_append_envvar \
    deactivate \
    LDFLAGS \
    "-Wl,-rpath,${CONDA_PREFIX}/lib -L${CONDA_PREFIX}/lib" \
    " "

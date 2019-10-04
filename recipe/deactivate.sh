unsetup lsst_distrib
unset -f setup
unset -f unsetup
unset EUPS_PKGROOT
unset EUPS_DIR
unset LSST_CONDA_ENV_NAME
unset LSST_HOME

# conda env includes are searched after the command line -I paths
stackvana_backup_and_append_envvar \
    deactivate \
    CPATH \
    "${CONDA_PREFIX}/include" \
    ":"

# add conda nv libraries for linking
stackvana_backup_and_append_envvar \
    deactivate \
    LIBRARY_PATH \
    "${CONDA_PREFIX}/lib" \
    ":"

# set rpaths to rsolve links properly at run time
stackvana_backup_and_append_envvar \
    deactivate \
    LDFLAGS \
    "-Wl,-rpath,${CONDA_PREFIX}/lib -L${CONDA_PREFIX}/lib" \
    " "

unset -f stackvana_backup_and_append_envvar

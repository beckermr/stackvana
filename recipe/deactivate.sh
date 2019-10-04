unsetup lsst_distrib
unset -f setup
unset -f unsetup
unset EUPS_PKGROOT
unset EUPS_DIR
unset LSST_CONDA_ENV_NAME
unset LSST_HOME
unset BR2_PACKAGE_LIBICONV

# remove stackvana env changes
stackvana_backup_and_append_envvar \
    deactivate \
    CPATH \
    "${CONDA_PREFIX}/include" \
    ":"

stackvana_backup_and_append_envvar \
    deactivate \
    LIBRARY_PATH \
    "${CONDA_PREFIX}/lib" \
    ":"

stackvana_backup_and_append_envvar \
    deactivate \
    LDFLAGS \
    "-Wl,-rpath,${CONDA_PREFIX}/lib -L${CONDA_PREFIX}/lib" \
    " "

unset -f stackvana_backup_and_append_envvar

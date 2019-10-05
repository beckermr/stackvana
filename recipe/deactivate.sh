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
    CPATH

stackvana_backup_and_append_envvar \
    deactivate \
    LIBRARY_PATH

stackvana_backup_and_append_envvar \
    deactivate \
    LDFLAGS

stackvana_backup_and_append_envvar \
    deactivate \
    EUPSPKG_SCONSFLAGS

unset -f stackvana_backup_and_append_envvar

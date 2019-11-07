
# is eups around?
eups -h
echo " "

# make sure env is activated
if [[ ! $STACKVANA_ACTIVATED ]]; then
    exit 1
fi
if [[ ! $LSST_HOME ]]; then
    exit 1
fi
if [[ ! $LSST_CONDA_ENV_NAME ]]; then
    exit 1
fi

# make sure lsst_distrib is around
if [[ ! `eups list -s | grep "lsst_distrib"` ]]; then
    exit 1
fi

# try setting things up
echo -n "setting up 'cfitsio' ... "
val=`setup cfitsio 2>&1`
if [[ ! ${val} ]]; then
    echo "worked!"
    setup cfitsio
    fpack -V
else
    echo "failed!"
    echo "setup val: '${val}'"
    exit 1
fi
echo " "

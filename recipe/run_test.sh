
set -ex

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

# try setting things up
echo -n "setting up 'afw' ... "
val=`setup afw 2>&1`
if [[ ! ${val} ]]; then
    echo "worked!"
else
    echo "failed!"
    echo "setup val: '${val}'"
    exit 1
fi
echo " "

# make sure lsst_distrib is around
if [[ ! `eups list -s | grep "lsst_distrib"` ]]; then
    exit 1
fi

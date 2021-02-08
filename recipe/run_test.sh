
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

# try setting things up
echo -n "setting up 'kht' ... "
set +ex
val=`setup kht 2>&1`
set -ex
if [[ ! ${val} ]]; then
    echo "worked!"
else
    echo "failed!"
    echo "setup val: '${val}'"
    exit 1
fi
echo " "

# # make sure lsst_distrib is around
# if [[ ! `eups list -s | grep "lsst_distrib"` ]]; then
#     exit 1
# fi

python -c "import import lsst.kht"

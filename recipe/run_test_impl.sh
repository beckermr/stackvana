
# is eups around?
eups -h
echo " "

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

echo -n "setting up 'lsst_distrib' ... "
val=`setup lsst_distrib 2>&1`
if [[ ! ${val} ]]; then
    echo "worked!"
else
    echo "failed!"
    echo "setup val: '${val}'"
    exit 1
fi

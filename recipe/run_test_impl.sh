
# is eups around?
eups -h

# try setting things up
val=`setup cfitsio 2>&1`
if [[ ! ${val} ]]; then
    exit 1
fi
fpack -V

# val=`setup lsst_distrib 2>&1`
# if [[ ! ${val} ]]; then
#     exit 1
# fi

import os
import sys

TEMPLATE = """\
#!/usr/bin/env bash

if [[ `uname -s` == "Darwin" ]]; then
    eups distrib install -v -t %s lsst_distrib
    curl -sSL https://raw.githubusercontent.com/lsst/shebangtron/master/shebangtron | python
else
    LD_LIBRARY_PATH=${CONDA_PREFIX}/lib eups distrib install -v -t %s lsst_distrib
    curl -sSL https://raw.githubusercontent.com/lsst/shebangtron/master/shebangtron | python
fi
"""  # noqa

version = os.environ['PKG_VERSION'].replace('.', '_')

if version[-1] == 'w':
    version = 'w_' + version[:-1]
else:
    version = 'v' + version

script = TEMPLATE % (version, version)

with open(sys.argv[1], 'w') as fp:
    fp.write(script)

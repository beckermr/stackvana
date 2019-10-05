import os
import sys

TEMPLATE = """\
#!/usr/bin/env bash

eups distrib install -v -t %s lsst_distrib
curl -sSL https://raw.githubusercontent.com/lsst/shebangtron/master/shebangtron | python
"""  # noqa

version = os.environ['PKG_VERSION'].replace('.', '_')

if version[-1] == 'w':
    version = 'w_' + version[:-1]
else:
    version = 'v' + version

script = TEMPLATE % version

with open(sys.argv[1], 'w') as fp:
    fp.write(script)

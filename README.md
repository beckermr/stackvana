# stackvana
[![Anaconda-Server Badge](https://anaconda.org/beckermr/stackvana/badges/version.svg)](https://anaconda.org/beckermr/stackvana) [![Anaconda-Server Badge](https://anaconda.org/beckermr/stackvana/badges/downloads.svg)](https://anaconda.org/beckermr/stackvana) [![Build Status](https://dev.azure.com/beckermr/beckermr%20conda%20channel/_apis/build/status/beckermr.stackvana?branchName=master)](https://dev.azure.com/beckermr/beckermr%20conda%20channel/_build/latest?definitionId=6&branchName=master)

a ``conda``-based LSST DM stack installation

#### DISCLAIMER: This installation of the DM stack is not supported, promised to work, or promised to be bug free in any way. You use this package at your own risk.

## Usage

It is best to create a brand new ``conda`` environment for the DM stack.

```bash
conda create -c beckermr -n mystack stackvana
```

On Linux, the command above will create a ``conda`` environment with a full installation of
the DM stack, activated and ready to use. On OSX, you will need to run a further
installation step as described below.

### Finishing the Installation on OSX

In order to finish the OSX installation, run the following commands in your activated `conda` 
environment

```bash
$ eups install distrib -v -t ${LSST_DM_TAG} lsst_distrib
$ curl -sSL https://raw.githubusercontent.com/lsst/shebangtron/master/shebangtron | python
$ setup lsst_distrib
```

These commands follow the LSST DM
[documentation](https://pipelines.lsst.io/install/newinstall.html#install-science-pipelines-packages).
They will download the LSST project's prebuilt binaries for OSX and install them with `eups`.


## Important Gotchas

- In general, it is not safe to update to a new weekly build tag inside of an
  existing `stackvana` environment. This process **may** work, but it may fail in
  unexpected ways.
- The `conda` dependencies of `stackvana` are pinned up to their micro versions.
  If you need a newer version of one of these packages to move to the next weekly
  tag, you will need to either download a new `stackvana` version that matches the
  desired tag, or you will need to force install the new dependence in the existing
  `conda` environment.


## Notes about this DM stack Installation

- On Linux, the full stack has been built from source using the `conda` compilers.
- On OSX, the core stack routines are installed with the binaries from the LSST
  project by the user according to the directions above. I was unable to get the
  stack to fully build with the `conda` compilers on OSX.
- On both Linux and OSX, this package carefully sets up `eups` within the
  `conda` environment when the `conda` environment is activated. Upon deactivation,
  all of the changes from `eups` and this package are removed. This process leaves
  the original environment as it was and should help enable more than one installation
  of the DM stack to coexist nicely.
- On OSX during the first installation, you may see some errors from `eups` related to
  trying to setup the DM stack package `lsst_distrib`. Once the additional installation
  steps above are completed, these errors should go away.
- This `conda` package injects the variable `LSST_DM_TAG` into your environment. This
  variable is the value of the `eups` tag that corresponds to the `stackvana`
  version.
- When installing this package, you may see warnings related to `conda` clobbering paths.
  These are related `eups/ups` database entries that overlap between the two packages and
  can be ignored.

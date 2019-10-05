# stackvana
a ``conda``-based LSST DM stack development environment

#### DISCLAIMER: This installation of the DM stack is not supported, promised to work, or promised to be bug free in any way. You use this package at your own risk.


## Usage

It is best to create a brand new ``conda`` environment for the DM stack.

```bash
conda create -c beckermr -n mystackenv stackvana
```

The command above will create a ``conda`` environment with all of the dependencies
and tools you need to actually build the DM stack. To execute this build, you
then need to run

```bash
$ stackvana-run-the-build
```

On linux, this process will build the full stack from source and will take about
two to six hours. On OSX, the precompiled binaries from the LSST DM team will be downloaded
and installed. This command only needs to be executed once. After that, you
can simply activate the ``conda`` environment, activate the stack via `setup lsst_distrib`,
and the DM stack will be there.

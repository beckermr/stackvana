# stackvana
[![Anaconda-Server Badge](https://anaconda.org/beckermr/stackvana/badges/version.svg)](https://anaconda.org/beckermr/stackvana) [![Anaconda-Server Badge](https://anaconda.org/beckermr/stackvana/badges/downloads.svg)](https://anaconda.org/beckermr/stackvana) [![Build Status](https://dev.azure.com/beckermr/beckermr%20conda%20channel/_apis/build/status/beckermr.stackvana?branchName=master)](https://dev.azure.com/beckermr/beckermr%20conda%20channel/_build/latest?definitionId=6&branchName=master)

a ``conda``-based LSST DM stack installation

#### DISCLAIMER: This installation of the DM stack is not supported, promised to work, or promised to be bug free in any way. You use this package at your own risk.

## Usage

It is best to create a brand new ``conda`` environment for the DM stack.

```bash
conda create -c beckermr -n mystack stackvana
```

The command above will create a ``conda`` environment with a full installation of
the DM stack, activated and ready to use.

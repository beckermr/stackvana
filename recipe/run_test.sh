#!/bin/bash
if [[ ! $LSST_HOME ]]
then
    exit 1
fi

if [[ ! $LSST_CONDA_ENV_NAME ]]
then
    exit 1
fi

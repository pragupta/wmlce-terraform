#!/bin/bash -e

#source env file
source /tmp/scripts/env.sh

#Install Miniconda
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-ppc64le.sh
bash Miniconda3-latest-Linux-ppc64le.sh -b -f
rm Miniconda3-latest-Linux-ppc64le.sh

#Get conda command to work
eval "$($HOME/miniconda3/bin/conda shell.bash hook)"

#Setup conda environment
conda config --prepend channels https://public.dhe.ibm.com/ibmdl/export/pub/software/server/ibm-ai/conda/
conda create --name wmlce_env_${WMLCE_VERSION}  python=${PYTHON_VERSION} -y
conda activate wmlce_env_${WMLCE_VERSION}

#Install wmlce
export IBM_POWERAI_LICENSE_ACCEPT=yes
conda install powerai=${WMLCE_VERSION} -y
#conda install ddl-tensorflow powerai-release=${WMLCE_VERSION} -y

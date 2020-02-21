#!/bin/bash -e
# Copyright 2020. IBM All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


# Install NVIDIA Driver
modinfo nvidia && which nvidia-smi
has_gpu_driver=$?

if [ $has_gpu_driver -ne 0 ]; then
  #Install gcc as needed by the nvidia driver
  echo "Installing build essentials."
  apt install build-essential -y

  # Install Nvidia
  echo "Installing Nvidia drivers."
  nvidia_run="NVIDIA-Linux-ppc64le-440.33.01.run"
  wget http://us.download.nvidia.com/tesla/440.33.01/${nvidia_run}
  chmod +x ${nvidia_run}
  ./${nvidia_run} --silent

  # Cleaning up
  echo "Removing .run file "
  rm ${nvidia_run}

  echo "Reloading the daemon"
  systemctl daemon-reload

  nvidia-smi
else
  echo "Nvidia drivers installed on machine already. Skipping install of drivers."
fi

#!/bin/bash

# Chloroform is a script for setting up suspend-then-hibernate on your system.
# It will detect swapfiles, make them an adequate size, and then enable hibernation.

chloroform() {
  echo "Chloroform: Preparing to set up suspend-then-hibernate..."
  detectSwapFile
}

detectSwapFile() {
  local swapOutput=$(swapon --show)
  if [[ -z $swapOutput ]]; then
    echo "Swap is not enabled. Creating swap..."
    createSwap
  elif [[ $swapOutput == */swapfile* ]]; then
    echo "Detected swapfile."
    checkSwap
  elif [[ $swapOutput == */dev/* ]]; then
    echo "Swap partitions aren't currently supported."
    exit 1
  else
    echo "Unexpected swap configuration."
    exit 1
  fi
}

checkSwap() {
  local totalSwap=$(grep SwapTotal /proc/meminfo | awk '{print $2}')
  local totalRam=$(grep MemTotal /proc/meminfo | awk '{print $2}')
  if [ "$totalSwap" -ge "$totalRam" ]; then
    echo "Swap size is adequate."
    postCheckSwap
  else
    echo "Swap size is not adequate. Resizing swap..."
    resizeSwap
  fi
}

createSwap() {
  echo "Turning off swap..."
  # sudo swapoff -a

  echo "Creating a 32GB swapfile..."
  # sudo dd if=/dev/zero of=/swapfile bs=1G count=32 status=progress

  echo "Setting swapfile permissions..."
  # sudo chmod 600 /swapfile

  echo "Making swapfile usable for swap..."
  # sudo mkswap /swapfile

  echo "Activating swapfile..."
  # sudo swapon /swapfile

  enableAutoMountOnStartup
}

resizeSwap() {
  echo "[resizeSwap] Not implemented yet."
}

enableAutoMountOnStartup() {
  echo "Enabling swapfile to be mounted on startup..."
  echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab
}

postCheckSwap() {
  echo "[postCheckSwap] Placeholder for further actions after checking swap size."
}

chloroform

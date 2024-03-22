# #!/bin/bash

# # Chloroform is a script for setting up suspend-then-hibernate on your system.
# # It will detect swapfiles, make them an adequate size, and then enable hibernation.

# chloroform() {
#   echo "go to sleep..."
#   detectSwapSpace
# }

# detectSwapFile() {
#   # The main command to run here is `swapon --show`. We need to use the output
#   # of this command to determine if they are using a swapfile, a swap partition,
#   # or don't have swap enabled.

#   # If they are using a swap partition then we should exit with non-zero status
#   # and say "swap partitions aren't currently supported".

#   # If they don't have swap, say "Swap is not enabled" and then call createSwap

#   # If swap is enabled then say, "detected swapfile" and call checkSwap

#   # Note: you can tell which one it is based on the output of swapon. I think
#   # if it outputs something like /dev/sdax partition then you are using a swap
#   # partition, and if it outputs /swapfile then they are using a swap file. But
#   # you probably know better than me here how to detect.
#   echo "[detectSwapFile] Not implemented"
# }

# checkSwap() {
#   # this function should run `free` and check the output to see if the total size
#   # of the swap is the same or bigger than the total memory. If it is big enough
#   # then you can call postCheckSwap() (I'm not sure what it'll do yet so this
#   # will be a placeholder).

#   # If it isn't big enough then call resizeSwap
#   echo "[checkSwap] Not implemented"
# }

# createSwap() {
#   # This will:

#   # 1. turnoff swap
#   # `sudo swapoff -a`
#   #
#   # 2. create a swapfile
#   # sudo dd if=/dev/zero of=/swapfile bs=1G count=32
#   #
#   # 3. Update the permissions
#   # sudo chmod 600 /swapfile
#   #
#   # 4. Make it usable for swap
#   # `sudo mkswap /swapfile`
#   #
#   # 5. Make it the active swapfile
#   # `sudo swapon /swapfile`
#   #
#   # 6. Call enableAutoMountOnStartup
#   echo "[checkSwap] Not implemented"
# }


# chloroform

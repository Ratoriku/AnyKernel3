#!/system/bin/sh
# Do NOT assume where your module will be located.
# ALWAYS use $MODDIR if you need to know where this script
# and module is placed.
# This will make sure your module will still work
# if Magisk change its mount point in the future
MODDIR=${0%/*}

# This script will be executed in post-fs-data mode

# I/O Boost to max
for i in /sys/block/*/queue do
  echo 0 > $i/iostats
  echo 256 > $i/nr_requests
  echo 2048 > $i/read_ahead_kb
done

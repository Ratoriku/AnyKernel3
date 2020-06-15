# AnyKernel3 Ramdisk Mod Script
# osm0sis @ xda-developers

## AnyKernel setup
# begin properties
properties() { '
kernel.string=PaperMoon Kernel by Ratoriku@github.com
do.devicecheck=1
do.modules=0
do.systemless=1
do.cleanup=1
do.cleanuponabort=0
device.name1=lavender
supported.versions=
supported.patchlevels=
'; } # end properties

# shell variables
block=/dev/block/bootdevice/by-name/boot;
is_slot_device=0;
ramdisk_compression=auto;

## AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. tools/ak3-core.sh;

# Extra
ui_print " " "Tracing Majutsu Reiso (魔術礼装)"
rm -rf /data/adb/modules/barairo;
cp -rf $home/magisk_module /data/adb/modules/barairo;

## AnyKernel install
split_boot;

# Screen OC
case "$ZIPFILE" in
  *63fps*|*63hz*)
    ui_print "  • Setting 63 Hz refresh rate"
    patch_cmdline "mdss_dsi.framerate_override" "mdss_dsi.framerate_override=1"
    ;;
  *66fps*|*66hz*)
    ui_print "  • Setting 66 Hz refresh rate"
    patch_cmdline "mdss_dsi.framerate_override" "mdss_dsi.framerate_override=2"
    ;;
  *70fps*|*70hz*)
    ui_print "  • Setting 70 Hz refresh rate"
    patch_cmdline "mdss_dsi.framerate_override" "mdss_dsi.framerate_override=3"
    ;;
  *)
    patch_cmdline "mdss_dsi.framerate_override" ""
esac

flash_boot;
flash_dtbo;
## end install


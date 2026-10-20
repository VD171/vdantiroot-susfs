#!/system/bin/sh
# ======================================================================
#  VDANTIROOT-SUSFS  ::  SUSFS definitions
#  This is my own module with many resetprop, susfs and settings.
#  These are the SUSFS definitions (and only those) of that module.
#
#  Copyright (C) 2026  VD171
#  SPDX-License-Identifier: MIT
#
#  Free software under the MIT License.
#
#  SUSFS (LKM)    : inforcqb/susfs4ksu-lkm https://github.com/inforcqb/susfs4ksu-lkm
#  BRENE (alt)    : https://github.com/rrr333nnn333/BRENE https://t.me/rrr333nnn333updates
#
#  Site           : https://vd171.ru
#  Site           : https://vd.priv8.ru
#  Source         : https://github.com/VD171/vdantiroot-susfs
#  GitHub         : @VD171 https://github.com/VD171
#  XDA-Developers : @VD171 https://xdaforums.com/m/vd171.4699873/
#  Telegram       : @VD_Priv8 https://t.me/VD_Priv8
#  Discord        : @VD.Priv8 https://discord.com/users/1296831918989639721
#  E-mail         : vd.priv8@pm.me
# ======================================================================

#2026-10-20
VD_VERSAO=95

SUSFS_BIN="$BIN/ksu_susfs"
SUSFS_IFACE=""

susfs() {
    [ -z "$SUSFS_IFACE" ] && {
        if [ -e /proc/susfs_path ]; then SUSFS_IFACE=lkm
        elif "$SUSFS_BIN" show version >/dev/null 2>&1; then SUSFS_IFACE=classic
        else SUSFS_IFACE=none; fi
    }
    case "$SUSFS_IFACE" in
        classic) "$SUSFS_BIN" "$@" ;;
        lkm)     _susfs_lkm "$@" ;;
        *)       return 0 ;;
    esac
}

_susfs_lkm() {
    case "$1" in
        add_sus_path|add_sus_path_loop)           [ -n "$2" ] && echo "add $2" > /proc/susfs_path 2>/dev/null ;;
        add_sus_kstat_statically)                 echo "$*" > /proc/susfs_kstat 2>/dev/null ;;
        set_sdcard_root_path|set_android_data_root_path) : ;;
        *)                                        "$SUSFS_BIN" "$@" ;;
    esac
}

rm -f /data/adb/susfs_umount_for_zygote_system_process
susfs add_sus_path_loop /system/addon.d
susfs add_sus_path /system/addon.d
susfs add_sus_path /data/adb
susfs add_sus_path /data/adb/modules
susfs add_sus_path /vendor/bin/install-recovery.sh
susfs add_sus_path /system/bin/install-recovery.sh
susfs add_sus_path /debug_ramdisk
susfs add_sus_path /system/vendor/bin/install-recovery.sh
for device in $(ls -Ld /proc/fs/jbd2/loop*8 | sed 's|/proc/fs/jbd2/||; s|-8||'); do
    susfs add_sus_path /proc/fs/jbd2/${device}-8
    susfs add_sus_path /proc/fs/ext4/${device}
done
susfs enable_avc_log_spoofing 1
susfs add_sus_map /data/adb/modules/COPG-VD/zygisk/arm64-v8a.so
susfs add_sus_map /data/adb/modules/COPG-VD/zygisk/armeabi-v7a.so
susfs add_sus_map /data/adb/modules/playintegrityfix/zygisk/arm64-v8a.so
susfs add_sus_map /data/adb/modules/playintegrityfix/zygisk/armeabi-v7a.so
susfs add_sus_map /data/adb/modules/treat_wheel/zygisk/arm64-v8a.so
susfs add_sus_map /data/adb/modules/treat_wheel/zygisk/armeabi-v7a.so
susfs add_sus_map /data/adb/modules/zygisk-sui/zygisk/arm64-v8a.so
susfs add_sus_map /data/adb/modules/zygisk-sui/zygisk/armeabi-v7a.so
susfs add_sus_map /data/adb/modules/zygisk_lsposed/zygisk/arm64-v8a.so
susfs add_sus_map /data/adb/modules/zygisk_lsposed/zygisk/armeabi-v7a.so
susfs add_sus_map /data/adb/rezygisk/lib/libzygisk.so
susfs add_sus_map /data/adb/rezygisk/lib64/libzygisk.so
susfs add_sus_map /system/fonts/Roboto-Regular.ttf
susfs add_sus_map /system/fonts/RobotoStatic-Regular.ttf
susfs add_sus_map /data/adb/modules/hma_oss_zygisk/zygisk/arm64-v8a.so
susfs add_sus_map /data/adb/modules/hma_oss_zygisk/zygisk/armeabi-v7a.so
for i in $(ls /data/local/tmp); do
    susfs add_sus_path_loop "/data/local/tmp/$i"
done
for n in 0 1 2 3 4 5; do susfs add_sus_path_loop "/dev/pts/$n"; done
susfs add_sus_kstat_statically /data/local/tmp 100 default default 4096 default default default default default default 8 4096
susfs hide_sus_mnts_for_all_procs 1

susfs set_sdcard_root_path /sdcard
susfs set_android_data_root_path /sdcard/Android/data
susfs set_sdcard_root_path /sdcard
susfs set_android_data_root_path /sdcard/Android/data
for i in $(ls /sdcard/Android/data); do
    susfs add_sus_path /sdcard/Android/data/${i}
done
susfs add_sus_path /sdcard/Fox
susfs add_sus_path /sdcard/MT2
susfs add_sus_path /sdcard/TWRP
susfs add_sus_path /sdcard/OhMyFont
susfs add_sus_path /sdcard/AppManager
susfs add_sus_path /storage/emulated/TWRP

case "$SUSFS_IFACE" in lkm|classic)
    i=0; while [ $i -lt 60 ]; do
        sleep 1
        susfs add_sus_path /system/addon.d
        i=$((i+1))
    done
esac

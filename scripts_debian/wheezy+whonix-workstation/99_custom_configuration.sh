#!/bin/bash
# vim: set ts=4 sw=4 sts=4 et :

# ------------------------------------------------------------------------------
# Source external scripts
# ------------------------------------------------------------------------------
. ${SCRIPTSDIR}/vars.sh
. ./umount_kill.sh >/dev/null

# ------------------------------------------------------------------------------
# Configurations
# ------------------------------------------------------------------------------
if [ "${VERBOSE}" -ge 2 -o "${DEBUG}" == "1" ]; then
    set -x
else
    set -e
fi

# ------------------------------------------------------------------------------
# whonix-netvm-gateway contains last known IP used to search and replace
# ------------------------------------------------------------------------------
if [ -f "${INSTALLDIR}/tmp/.whonix_prepared" -a ! -f "${INSTALLDIR}/tmp/.whonix_custom_configurations" ]; then
    # --------------------------------------------------------------------------
    # Install Custom Configurations
    # --------------------------------------------------------------------------
    echo "10.152.152.11" > "${INSTALLDIR}/etc/whonix-ip"
    echo "10.152.152.10" > "${INSTALLDIR}/etc/whonix-netvm-gateway"

    touch "${INSTALLDIR}/tmp/.whonix_custom_configurations"
fi

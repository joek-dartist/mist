#!/bin/bash

sudo rpm-ostree override remove \
  plasma-desktop plasma-workspace plasma-workspace-wayland \
  plasma-nm plasma-nm-openvpn plasma-nm-vpnc plasma-nm-openconnect \
  plasma-pa plasma-discover plasma-discover-notifier plasma-discover-flatpak plasma-discover-rpm-ostree \
  plasma-print-manager plasma-print-manager-libs \
  plasma-lookandfeel-fedora plasma-systemmonitor \
  sddm sddm-breeze sddm-kcm kde-settings-sddm kde-gtk-config

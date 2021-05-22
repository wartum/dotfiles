#!/bin/sh
SWITCH=$(echo "Cancel\nLogout\nReboot\nShutdown" | custom_dmenu)
case "$SWITCH" in
  "Cancel") exit 0 ;;
  "Logout") pkill .*auto_refresh.*; /usr/bin/i3-msg exit ;;
  "Reboot") /usr/bin/shutdown -r now ;;
  "Shutdown") /usr/bin/shutdown -P now ;;
esac

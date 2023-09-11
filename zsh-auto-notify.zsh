function _has_notification_service() {
  # Check dbus-send command exists
  if ! type dbus-send >/dev/null; then
    # perhaps it should run notify-send
    print "unknown"
    return
  fi
  local interfaces="$(dbus-send --session \
    --type=method_call \
    --print-reply \
    --dest=org.freedesktop.DBus \
    /org/freedesktop/DBus org.freedesktop.DBus.ListNames)"
  if [[ $interfaces == *"org.freedesktop.Notifications"* ]]; then
    print "yes"
  else
    print "no"
  fi
}

if [[ "$(_has_notification_service)" == "no" ]]; then
  type disable_auto_notify >/dev/null && disable_auto_notify
fi

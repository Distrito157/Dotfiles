#!/bin/bash

start_live_server() {
  if pgrep -x "live-server" > /dev/null
  then
    echo "Live Server already running."
  else
    nohup live-server --browser=chromium > /dev/null 2>&1 &
    echo "Live Server started."
  fi
}

stop_live_server() {
  if pkill -f "node /home/yank/.nvm/versions/node/v20.6.1/bin/live-server --browser=chromium"
  then
    echo "Live Server stopped."
  else
    echo "Live Server is not running."
  fi
}

case "$1" in
  "start")
    start_live_server
    ;;
  "stop")
    stop_live_server
    ;;
  *)
    echo "Usage: $0 {start|stop}"
    exit 1
    ;;
esac

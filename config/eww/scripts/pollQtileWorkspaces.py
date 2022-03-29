#!/usr/bin/env python3

# Poll the qtile daemon for the workspace config and currently selected workspace

import os, time
from libqtile.command.client import InteractiveCommandClient

qtc = InteractiveCommandClient()

poll_timeout = os.getenv("POLL_TIMEOUT")
if poll_timeout == None:
   poll_timeout = 1

user_id = os.getuid()

fifo_path = "/run/user/" + str(user_id) + "/eww-scripts/qtile-workspaces"

while True:
   os.remove(fifo_path)
   os.mkfifo(fifo_path)
   f = open(fifo_path, "w")
   while True:
      _, active_group = qtc.screen[0].items("group")
      _, all_groups = qtc.items("group")

      try:
         for g in all_groups:
            f.write(str(g) + ",")

         f.write(";;" + str(active_group))

         f.write("\n")
         f.flush()
      except Exception:
         break

      time.sleep(poll_timeout)

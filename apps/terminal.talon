tag: terminal
-
^abort: key(escape)
^slap: key(enter)
^pick:
  key(enter)
  key(enter)
^fuse: key(ctrl-t)
^vim: "v "
^vim <user.text>:
  insert("v ")
  key(ctrl-t)
  sleep(50ms)
  insert("{text}")

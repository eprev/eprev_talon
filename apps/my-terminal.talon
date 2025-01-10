tag: terminal
-
make dear$: insert("mkdir ")

abort: key(ctrl-c)
enter: key(enter)
push$:
  key(enter)
  key(enter)
push <number_small>$:
  key(down)
  repeat(number_small - 2)
  key(enter)
  key(enter)
pick <number_small>$:
  key(down)
  repeat(number_small - 2)
  key(enter)
^fuse: key(ctrl-t)
^vim <user.text>:
  insert("v ")
  key(ctrl-t)
  sleep(50ms)
  insert("{text}")

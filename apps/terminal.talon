tag: terminal
-
slap: key(enter)
vim$: "v "
vim <user.text>:
  insert("v ")
  key(ctrl-t)
  sleep(50ms)
  insert("{text}")

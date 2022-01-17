pap: key(pageup)
pop: key(pagedown)
press slow <user.modifiers>:
  key("{modifiers}:down")
  sleep(1s)
  key("{modifiers}:up")

os: mac
-
character (viewer | picker): key(cmd-ctrl-space)
menu search$: key(cmd-shift-?)
menu search <user.text>:
    key(cmd-shift-?)
    sleep(50ms)
    insert("{text}")
focus menu bar: key(ctrl-f2)
focus status menu: key(ctrl-f8)
brightness down: key(ctrl-cmd-f1)
brightness up: key(ctrl-cmd-f2)
lock screen: key(ctrl-cmd-q)
glen <user.text>:
    key(ctrl-cmd-shift-alt-g)
    sleep(100ms)
    insert("{text}")
glen$: key(ctrl-cmd-shift-alt-g)

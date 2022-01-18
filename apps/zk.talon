tag: terminal
-
zet: "zk "
zet index: "zk index\n"
zet tags: "zk tag list\n"
zet list (tagged | tag): "zk list --interactive --tag\n"
zet list$: "zk list --interactive\n"
zet list <user.text>:
    insert("zk list --interactive\n")
    sleep(50ms)
    insert("{text}")
zet recent: "zk recent\n"
zet edit: "zk edit --interactive\n"
zet list related: "zk list --related "
zet edit last: "zk editlast\n"
zet new$: "zk nt "
zet new <user.text>:
    insert("zk nt {text}\n")
zet backlinks: "zk bl "
zet save: "zk save "

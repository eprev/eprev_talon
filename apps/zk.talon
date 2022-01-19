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
zet drafts: "zk drafts\n"
zet edit: "zk edit --interactive\n"
zet list related: "zk list --related "
zet edit last: "zk editlast\n"
zet new$: "zk quick "
zet new draft:
    insert("zk draft\n")
zet new <user.text>:
    insert("zk quick ")
    user.insert_formatted(text, "CAPITALIZE_ALL_WORDS")
    insert("\n")
zet backlinks: "zk bl "
zet update: "zk update\n"
zet save: "zk save "

not mode: sleep
-
^russian mode$:
    mode.disable("sleep")
    mode.disable("command")
    mode.enable("dictation")
    mode.enable("user.russian")

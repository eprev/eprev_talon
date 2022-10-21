mode: dictation
language: ru_RU
-
<phrase>: insert("{phrase} ")
точка$: insert(". ")
запятая$: insert(", ")
вопросительный знак$: insert("? ")
восклицательный знак$: insert("! ")
(диктант закончен | английский режим)$:
    mode.disable("dictation")
    mode.disable("user.russian")
    mode.enable("command")


app: vim
-

settings():
    user.vim_debug = 1

over:
    key(escape)

push$:
  key(down)
  key(enter)
push <number_small>:
  key(down)
  repeat(number_small - 1)
  key(enter)

insert (mode | here)$:
    user.vim_set_mode("i")
# insert <user.text>:
#     insert("i{text}")
#     key(escape)
# insert <user.unmodified_key>:
#     insert("i{unmodified_key}")
#     key(escape)
# append <user.text>:
#     insert("i{text}")
#     key(escape)
# append <user.unmodified_key>:
#     insert("i{unmodified_key}")
#     key(escape)

command$:
    user.vim_set_mode_np("c")

command <user.text>:
    user.vim_set_mode_np("c")
    insert("{text}")

normal mode$: key(esc)
undo:
    user.vim_set_mode("n")
    key(u)
redo: key(ctrl-r)
bat (new | open): 
    user.vim_set_mode("n")
    insert(":tabe\n")
bat (next | neck):
    user.vim_set_mode("n")
    key(g)
    key(t)
bat (previous | prev | last):
    user.vim_set_mode("n")
    key(g)
    key(T)

quote this:
    insert(",q'")
double quote this:
    insert(',q"')

<number> <user.vim_arrows>$:
  insert("{number}")
  key(vim_arrows)

<user.vim_commands> (<user.vim_positions>) <user.vim_text_objects>$:
    key(vim_commands)
    insert("{vim_positions}" or "")
  key(vim_text_objects)

(move | indent) right:
    user.vim_set_mode("n")
    insert(">>")
(move | indent) left:
    user.vim_set_mode("n")
    insert("<<")

sage:
    user.vim_set_mode("n")
    insert(":w\n")
file save as:
    user.vim_set_mode_np("n")
    insert(":w ")
file save all:
    user.vim_set_mode_np("n")
    insert(":wa\n")
(file save and (quit|close)|squeak):
    user.vim_set_mode_np("n")
    insert(":wq\n")
file (close|quite):
    user.vim_set_mode_np("n")
    insert(":q\n")
force [file] (close|quit):
    user.vim_set_mode_np("n")
    insert(":q!\n")

(close|quit) all:
    user.vim_set_mode_np("n")
    insert(":qa\n")

force (close|quit) all:
    user.vim_set_mode_np("n")
    insert(":qa!\n")

file refresh:
    user.vim_set_mode_np("n")
    insert(":e!\n")
edit [file|new]:
    user.vim_set_mode_np("n")
    insert(":e ")

matching: key(%)
matching <user.symbol_key>: insert("f{symbol_key}%")

[go] (row|line) <number>:
    user.vim_set_mode_np("n")
    insert(":{number}\n")

show jump list: insert(":jumps\n")
clear jump list: insert(":clearjumps\n")
go (last|prev|previous) jump [entry]: key(ctrl-o)
go (next|newer) jump [entry]: key(ctrl-i)
(go|jump) [to] last change: insert("g;")
(go|jump) [to] next change: user.vim_normal_mode("g,")

scroll top: insert("zt")
scroll (center|middle): insert("zz")
scroll bottom: insert("zb")

wipe line: insert("0d$")
delete line: insert("dd")
(dup|duplicate) line: insert("Yp")
append line: key(A)
prepend line: key(I)

sort (selected | visual | highlighted):
    insert(":")
    # leave time for vim to populate '<,'>
    sleep(50ms)
    insert("sort\n")

replace [in] (selected | visual | highlighted):
    insert(":")
    # leave time for vim to populate '<,'>
    sleep(50ms)
    insert("s///g")
    key(left:3)

(visual | highlight) all: insert("ggVG")
reselect: insert("gv")

force last [comand]:
    key(: up ! enter)

magnet <user.unmodified_key>: insert("f{unmodified_key}")
magnet back <user.unmodified_key>: insert("F{unmodified_key}")

comment [that]: insert("gcc")

open [current] (dear | directory): insert(":ed %%\n")
config reload: insert(",vs")

search <user.text>:
    user.vim_set_mode_np("n")
    key(/)
    insert("{text}")
    key(enter)
next:
    key(n)

quick open:
    user.vim_set_mode("n")
    insert(":copen\n")
quick close:
    user.vim_set_mode("n")
    insert(":cclose\n")
quick (next | neck):
    user.vim_set_mode("n")
    insert(":cn\n")
quick (previous | prev):
    user.vim_set_mode("n")
    insert(":cp\n")
quick first:
    user.vim_set_mode("n")
    insert(":cr\n")
quick last:
    user.vim_set_mode("n")
    insert(":cla\n")
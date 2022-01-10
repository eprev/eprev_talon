import time
import re
from talon import Module, Context, actions, settings, ui

ctx = Context()
mod = Module()
mod.apps.vim = r"""
title: /vim/i
app.bundle: com.apple.Terminal
"""

ctx.matches = r"""
app: vim
"""

mod.list("vim_arrows", desc="VIM direction keys")
mod.list("vim_commands", desc="List of available commands in VIM")
mod.list("vim_positions", desc="List of available positions in VIM")
mod.list("vim_text_objects", desc="List of available text objects in VIM")

ctx.lists["self.vim_arrows"] = {
    "left": "h",
    "right": "l",
    "up": "k",
    "down": "j",
}

ctx.lists["self.vim_commands"] =  {
    "change": "c",
    "delete": "d",
    "copy": "y",
    "select": "v"
}

ctx.lists["self.vim_positions"] = {
    "in": "i", 
    "inside": "i",
    "around": "a"
}

ctx.lists["self.vim_text_objects"] = {
    "word": "w",
    "paragraph": "p",
    "block": "b",
    "string": "'",
    "dubstring": '"',
    "parens": '(',
    "braces": '{',
    "brackets": '[',
}

@mod.capture(rule="{self.vim_arrows}")
def vim_arrows(m) -> str:
    return m.vim_arrows

@mod.capture(rule='{self.vim_commands}')
def vim_commands(m) -> str:
    return m.vim_commands

@mod.capture(rule='{self.vim_positions}')
def vim_positions(m) -> str:
    return m.vim_positions

@mod.capture(rule='{self.vim_text_objects}')
def vim_text_objects(m) -> str:
    return m.vim_text_objects

mod.setting(
    "vim_debug",
    type=int,
    default=0,
    desc="Print debug messages",
)

mod.setting(
    "vim_mode_change_timeout",
    type=float,
    default=0.3,
    desc="How long to wait before issuing commands after a mode change",
)

@mod.action_class
class Actions:
    def vim_set_mode(mode: str):
        ''' Set VIM mode, preserve insert mode '''
        v = VimMode()
        v.set_mode(mode)

    def vim_set_mode_np(mode: str):
        ''' Set VIM mode '''
        v = VimMode()
        v.set_mode(mode, False)

@ctx.action_class("win")
class win_actions:
    def filename():
        title = actions.win.title()
        # print(title)
        m = re.search(r'VIM \((?P<file>.*?)@(?P<mode>\w+)\)', title)
        if m:
            result = m.group('file')
            # print(result)
            if "." in result:
                return result
        return ""

    def file_ext():
        ext = actions.win.filename().split(".")[-1]
        # print(ext)
        return ext

class VimMode:

    def __init__(self):
        self.current_mode = self.get_mode()

    def get_mode(self):
        title = ui.active_window().title
        mode = None
        m = re.search(r'VIM \((?P<file>.*?)@(?P<mode>\w+)\)', title)
        if m:
            mode = m.group('mode')
            self.debug(mode)
            self.current_mode = mode
        return mode

    def debug(self, s):
        if settings.get("user.vim_debug"):
            print(s)

    def is_normal_mode(self):
        return self.current_mode == "n"

    def is_visual_mode(self):
        return self.current_mode in ["v", "V", "^V"]

    def is_insert_mode(self):
        return self.current_mode == "i"

    def wait_mode_change(self):
        timeout = settings.get("user.vim_mode_change_timeout")
        time.sleep(timeout)

    def set_mode(self, wanted_mode, preserve=True):
        current_mode = self.get_mode()
        if current_mode == wanted_mode:
            return

        if self.is_insert_mode():
            if wanted_mode == "n" and preserve:
                actions.key("ctrl-o") 
            else:
               actions.key("right")
               actions.key("escape")
            self.wait_mode_change()
        elif self.is_visual_mode():
            actions.key("escape")
            self.wait_mode_change()

        if wanted_mode == "i":
            actions.key("i")
        elif wanted_mode == "v":
            actions.key("v")
        elif wanted_mode == "V":
            actions.key("V")
        elif wanted_mode == "c":
            actions.key(":")

@ctx.action_class('edit')
class AppActions:
    def find(text: str=None):
        actions.user.vim_set_mode_np('n')
        actions.key('/')
    def find_next():
        actions.user.vim_set_mode_np('n')
        actions.key('n')
    def find_previous():
        actions.user.vim_set_mode_np('n')
        actions.key('N')
    def word_left():
        actions.user.vim_set_mode("n")
        actions.key('b')
    def word_right():
        actions.user.vim_set_mode("n")
        actions.key('w')
    def line_start():
        actions.user.vim_set_mode("n")
        actions.key('^')
    def line_end():
        actions.user.vim_set_mode("n")
        actions.key('$')
    def file_end():
        actions.user.vim_set_mode("n")
        actions.key('G')
    def file_start():
        actions.user.vim_set_mode("n")
        actions.insert("gg")
    def page_down():
        actions.user.vim_set_mode("n")
        actions.key('ctrl-f')
    def page_up():
        actions.user.vim_set_mode("n")
        actions.key('ctrl-b')
    def indent_more():
        actions.user.vim_set_mode("n")
        actions.insert(">>")
    def indent_less():
        actions.user.vim_set_mode("n")
        actions.insert("<<")
    def delete_line():
        actions.user.vim_set_mode("n")
        actions.insert("dd")
    def redo():
        actions.key('ctrl-r')
    def undo():
        actions.user.vim_set_mode("n")
        actions.insert("u")
    def save():
        actions.user.vim_set_mode("n")
        actions.insert(":w\n")


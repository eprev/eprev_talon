import os
from talon import Module
mod = Module()


@mod.action_class
class Actions:
    # this is implemented as an action so it may be overridden in other contexts
    def get_vocabulary_file_path():
        """Returns the path for the active vocabulary file"""
        vocabulary_directory = os.path.dirname(os.path.realpath(__file__))
        vocabulary_file_path = os.path.join(
            vocabulary_directory, "vocabulary.talon-list"
        )
        return vocabulary_file_path

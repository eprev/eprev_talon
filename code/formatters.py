from talon import Context

ctx = Context()

class ImmuneString(object):
    """Wrapper that makes a string immune from formatting."""

    def __init__(self, string):
        self.string = string

# Overwrites https://github.com/knausj85/knausj_talon/blob/b11092ce/code/formatters.py#L220
# So it is possible to say "camel get quote result" and get "getQuoteResult" instead of
# "get'result"
@ctx.capture(
    # Add anything else into this that you want to be able to speak during a
    # formatter.
    "user.formatter_immune", 
    rule="numb <number>"
)
def formatter_immune(m) -> ImmuneString:
    """Text that can be interspersed into a formatter, e.g. characters.

    It will be inserted directly, without being formatted.

    """
    if hasattr(m, "number"):
        value = m.number
    else:
        value = m[0]
    return ImmuneString(str(value))

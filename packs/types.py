BOOLEAN_TRUE_STRINGS = ('true', 'on', 'ok', 'y', 'yes', '1')


def bool(string: str) -> bool: return string.lower() in BOOLEAN_TRUE_STRINGS

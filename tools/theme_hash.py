# Shared SHA-256 hashing for theme color data, used by the JSON/YAML generators.

import hashlib

COLOR_FIELDS = [
    "color_01", "color_02", "color_03", "color_04",
    "color_05", "color_06", "color_07", "color_08",
    "color_09", "color_10", "color_11", "color_12",
    "color_13", "color_14", "color_15", "color_16",
]


def hash_palette(data):
    """SHA-256 of the 16 ANSI colors only (color_01..color_16), independent
    of name/author/variant/background/foreground/cursor."""
    colors = ''.join(str(data.get(field, "")).strip() for field in COLOR_FIELDS)
    return hashlib.sha256(colors.encode()).hexdigest()


def hash_background(data):
    """SHA-256 of the background value only."""
    background = str(data.get("background", "")).strip()
    return hashlib.sha256(background.encode()).hexdigest()

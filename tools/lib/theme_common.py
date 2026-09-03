# Shared helpers used by tools/generate/* and tools/validate/*: SHA-256
# hashing of theme color data, the canonical theme field order, and the
# filename-slugging rules used when a theme name becomes a file on disk.

import hashlib
import re
from unidecode import unidecode

COLOR_FIELDS = [
    "color_01", "color_02", "color_03", "color_04",
    "color_05", "color_06", "color_07", "color_08",
    "color_09", "color_10", "color_11", "color_12",
    "color_13", "color_14", "color_15", "color_16",
]

FIELD_ORDER = [
    "name", "author", "variant",
    *COLOR_FIELDS,
    "background", "foreground", "cursor",
    "hash", "hash_bg",
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


def build_ordered_theme(data):
    """Return a theme dict with keys in the canonical FIELD_ORDER, pulling
    from `data` (a raw theme dict, optionally with hash/hash_bg already set)."""
    return {field: data.get(field, "") for field in FIELD_ORDER}


def slugify_theme_name(name):
    """Lowercase, accent-stripped, filesystem-safe slug for a theme name.
    Used by the per-theme file generators (json/yaml/txt) in tools/generate/.
    Callers pass theme.get("name", "untitled") so a missing name still slugs
    to "untitled"; an empty-string name intentionally slugs to "" (unchanged
    from the pre-refactor behavior of each generator)."""
    slug = unidecode(name.lower())
    slug = re.sub(r'[^\w-]+', '-', slug)
    return slug.strip('-')


def unique_path(output_dir, slug, suffix):
    """Path in `output_dir` for `slug + suffix`, appending -1, -2, ... on
    collision so two themes that slugify the same never overwrite each other."""
    path = output_dir / f"{slug}{suffix}"
    counter = 1
    while path.exists():
        path = output_dir / f"{slug}-{counter}{suffix}"
        counter += 1
    return path

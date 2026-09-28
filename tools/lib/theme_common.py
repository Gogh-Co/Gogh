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
    "name", "author", "author_name", "author_url", "variant",
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


def installer_slug(name):
    """Slug for the public installer filename, installs/<slug>.sh (step 7
    of the generate/ pipeline). Differs from slugify_theme_name() for names
    with underscores, so it's kept as its own rule."""
    slug = re.sub(r'[^a-zA-Z0-9]+', '-', unidecode(name).lower().replace(' ', '-'))
    return re.sub(r'[-]+', '-', slug).strip('-')


def gogh_list_slug(name):
    """Slug for the theme's entry in gogh.sh's THEMES array, <slug>.sh
    (step 8 of the generate/ pipeline)."""
    return re.sub(r'[^a-zA-Z0-9\s]+', '-', unidecode(name).lower().replace(' ', '-')).rstrip('-')


def theme_file_slugs(name):
    """Every slug a theme name becomes a file or list entry under, keyed by
    where it's used. Two themes sharing any of them would collide: the
    THEMES array silently drops one, installs/ overwrites one, and data/
    renames one with a -1 suffix."""
    return {
        "gogh.sh THEMES": gogh_list_slug(name),
        "installs/": installer_slug(name),
        "data/": slugify_theme_name(name),
    }


def unique_path(output_dir, slug, suffix):
    """Path in `output_dir` for `slug + suffix`, appending -1, -2, ... on
    collision so two themes that slugify the same never overwrite each other."""
    path = output_dir / f"{slug}{suffix}"
    counter = 1
    while path.exists():
        path = output_dir / f"{slug}-{counter}{suffix}"
        counter += 1
    return path


def _relative_luminance(hex_color):
    """WCAG relative luminance of a '#RRGGBB' color."""
    hex_color = hex_color.lstrip("#")
    channels = (int(hex_color[i:i + 2], 16) / 255 for i in (0, 2, 4))

    def linearize(c):
        return c / 12.92 if c <= 0.03928 else ((c + 0.055) / 1.055) ** 2.4

    r, g, b = (linearize(c) for c in channels)
    return 0.2126 * r + 0.7152 * g + 0.0722 * b


def contrast_ratio(hex_a, hex_b):
    """WCAG contrast ratio (1:1 .. 21:1) between two '#RRGGBB' colors."""
    l_a = _relative_luminance(hex_a)
    l_b = _relative_luminance(hex_b)
    lighter, darker = max(l_a, l_b), min(l_a, l_b)
    return (lighter + 0.05) / (darker + 0.05)

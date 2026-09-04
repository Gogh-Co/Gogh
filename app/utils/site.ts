export const SITE_URL = 'https://gogh.website';
export const SITE_NAME = 'Gogh';
export const SITE_IMAGE = 'https://raw.githubusercontent.com/Gogh-Co/Gogh/master/.images/gogh/Gogh-logo-header.png';
export const SITE_DESCRIPTION = 'Gogh is a collection of hundreds of color schemes for terminal emulators like GNOME Terminal, iTerm2, Tilix, and more. Install any theme with a single command.';

export function canonicalUrl(path: string): string {
    return `${SITE_URL}${path}`;
}

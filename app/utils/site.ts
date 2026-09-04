export const SITE_URL = 'https://gogh.website';
export const SITE_NAME = 'Gogh';
export const SITE_IMAGE = 'https://raw.githubusercontent.com/Gogh-Co/Gogh/master/.images/gogh/Gogh-logo-header.png';

export function canonicalUrl(path: string): string {
    return `${SITE_URL}${path}`;
}

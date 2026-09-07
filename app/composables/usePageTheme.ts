export type PageTheme = 'light' | 'dark';

const PAGE_THEME_STORAGE_KEY = 'gogh-page-theme';

// Shared across every Header instance (one per page, since Header isn't in
// a layout) via useState, so the toggle stays in sync and persisted no
// matter which page mounted it first.
export function usePageTheme() {
    const pageTheme = useState<PageTheme>('gogh-page-theme', () => 'light');

    function setPageTheme(mode: PageTheme) {
        pageTheme.value = mode;

        try {
            localStorage.setItem(PAGE_THEME_STORAGE_KEY, mode);
        } catch {
            // Ignore storage failures (private browsing, disabled storage, etc.).
        }
    }

    function togglePageTheme() {
        setPageTheme(pageTheme.value === 'dark' ? 'light' : 'dark');
    }

    // localStorage isn't available during SSR, so the saved preference is
    // applied post-mount (matches the pre-existing home page behaviour).
    function initPageTheme() {
        try {
            const saved = localStorage.getItem(PAGE_THEME_STORAGE_KEY);
            if (saved === 'dark' || saved === 'light') {
                pageTheme.value = saved;
            }
        } catch {
            // Ignore storage failures (private browsing, disabled storage, etc.).
        }
    }

    return { pageTheme, setPageTheme, togglePageTheme, initPageTheme };
}

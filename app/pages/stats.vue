<template>
    <Header />

    <div class="gogh-content stats-page">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-md-8">
                    <h2>Theme statistics</h2>
                    <p class="stats-intro">
                        Aggregated analytics for Gogh themes from the GitHub source.
                    </p>
                    <div v-if="loading" class="gogh-banner-anim" aria-hidden="true">
                        <span class="gogh-banner-anim__color gogh-banner-anim__color--01"></span>
                        <span class="gogh-banner-anim__color gogh-banner-anim__color--02"></span>
                        <span class="gogh-banner-anim__color gogh-banner-anim__color--03"></span>
                        <span class="gogh-banner-anim__color gogh-banner-anim__color--04"></span>
                        <span class="gogh-banner-anim__color gogh-banner-anim__color--05"></span>
                        <span class="gogh-banner-anim__color gogh-banner-anim__color--06"></span>
                        <span class="gogh-banner-anim__color gogh-banner-anim__color--07"></span>
                        <span class="gogh-banner-anim__color gogh-banner-anim__color--08"></span>
                        <span class="gogh-banner-anim__shine"></span>
                    </div>
                </div>
                <div class="col-md-4 stats-page__actions">
                    <Button class="btn" type="button" @click="refreshThemes">
                        Refresh
                    </Button>
                    <Button class="btn" to="/">
                        &lt; Back to themes
                    </Button>
                </div>
            </div>

            <div v-if="loading" class="stats-status stats-status--loading" role="status" aria-live="polite">
                Loading theme statistics...
            </div>

            <div v-else-if="errorMessage" class="stats-status stats-status--error" role="alert">
                <p>{{ errorMessage }}</p>
                <Button class="btn" type="button" @click="loadThemes(true)">Try again</Button>
            </div>

            <template v-else>
                <div class="stats-meta-row">
                    <span v-if="lastUpdatedLabel">Updated: {{ lastUpdatedLabel }}</span>
                    <span>Total themes: <strong>{{ totalThemes }}</strong></span>
                </div>

                <div class="row stats-summary-row">
                    <div class="col-md-6 col-lg-3">
                        <div class="stats-card summary-card h-100">
                            <h3>Total themes</h3>
                            <p class="stats-value">{{ totalThemes }}</p>
                        </div>
                    </div>

                    <div class="col-md-6 col-lg-3">
                        <div class="stats-card summary-card h-100">
                            <h3>Author coverage</h3>
                            <ul class="summary-list">
                                <li>
                                    <span>With author</span>
                                    <strong class="summary-number">{{ authorCounts.present }}</strong>
                                </li>
                                <li>
                                    <span>Missing author</span>
                                    <strong class="summary-number">{{ authorCounts.missing }}</strong>
                                </li>
                            </ul>
                        </div>
                    </div>

                    <div class="col-md-6 col-lg-3">
                        <div class="stats-card summary-card h-100">
                            <h3>Name duplicates</h3>
                            <ul class="summary-list">
                                <li>
                                    <span>Duplicate groups</span>
                                    <strong class="summary-number">{{ duplicateNames.length }}</strong>
                                </li>
                            </ul>
                        </div>
                    </div>

                    <div class="col-md-6 col-lg-3">
                        <div class="stats-card summary-card h-100">
                            <h3>Hash duplicates</h3>
                            <ul class="summary-list">
                                <li>
                                    <span>Duplicate groups</span>
                                    <strong class="summary-number">{{ duplicateHashes.length }}</strong>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>

                <div class="row stats-secondary-row">
                    <div class="col-md-6">
                        <div class="stats-card h-100">
                            <h3>Variant counts</h3>
                            <table class="stats-table">
                                <thead>
                                    <tr>
                                        <th>Variant</th>
                                        <th>Count</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr v-for="entry in variantCounts" :key="entry.value">
                                        <td>{{ entry.value }}</td>
                                        <td>{{ entry.count }}</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="stats-card h-100">
                            <h3>Background classification</h3>
                            <p class="stats-note">
                                Rule: a background is considered <strong>light</strong> when relative luminance is
                                <strong>&gt;= 0.5</strong>, otherwise <strong>dark</strong>.
                            </p>
                            <table class="stats-table">
                                <thead>
                                    <tr>
                                        <th>Class</th>
                                        <th>Count</th>
                                        <th>Percent</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>Light background</td>
                                        <td>{{ backgroundClassCounts.light }}</td>
                                        <td>{{ formatPercent(backgroundClassCounts.light, totalThemes) }}</td>
                                    </tr>
                                    <tr>
                                        <td>Dark background</td>
                                        <td>{{ backgroundClassCounts.dark }}</td>
                                        <td>{{ formatPercent(backgroundClassCounts.dark, totalThemes) }}</td>
                                    </tr>
                                </tbody>
                            </table>

                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-4">
                        <div class="stats-card">
                            <h3>Top background colors</h3>
                            <table class="stats-table">
                                <thead>
                                    <tr>
                                        <th>Color</th>
                                        <th>Hex</th>
                                        <th>Count</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr v-for="entry in topBackgroundColors" :key="entry.value">
                                        <td><span class="color-swatch" :style="{ backgroundColor: entry.value }"></span></td>
                                        <td>{{ entry.value }}</td>
                                        <td>{{ entry.count }}</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <div class="col-lg-4">
                        <div class="stats-card">
                            <h3>Top foreground colors</h3>
                            <table class="stats-table">
                                <thead>
                                    <tr>
                                        <th>Color</th>
                                        <th>Hex</th>
                                        <th>Count</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr v-for="entry in topForegroundColors" :key="entry.value">
                                        <td><span class="color-swatch" :style="{ backgroundColor: entry.value }"></span></td>
                                        <td>{{ entry.value }}</td>
                                        <td>{{ entry.count }}</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <div class="col-lg-4">
                        <div class="stats-card">
                            <h3>Top palette colors (01..16)</h3>
                            <table class="stats-table">
                                <thead>
                                    <tr>
                                        <th>Color</th>
                                        <th>Hex</th>
                                        <th>Count</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr v-for="entry in topPaletteColors" :key="entry.value">
                                        <td><span class="color-swatch" :style="{ backgroundColor: entry.value }"></span></td>
                                        <td>{{ entry.value }}</td>
                                        <td>{{ entry.count }}</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <div class="stats-card">
                    <h3>Themes table</h3>

                    <div class="table-filters">
                        <div class="table-filter-field table-filter-field--search">
                            <label for="stats-search">Search name or author</label>
                            <input
                                id="stats-search"
                                v-model.trim="searchQuery"
                                type="search"
                                placeholder="Search by name or author"
                            >
                        </div>

                        <div class="table-filter-field">
                            <label for="variant-filter">Variant</label>
                            <select id="variant-filter" v-model="variantFilter">
                                <option value="all">All</option>
                                <option
                                    v-for="entry in variantCounts"
                                    :key="entry.value"
                                    :value="entry.value"
                                >
                                    {{ entry.value }}
                                </option>
                            </select>
                        </div>

                        <div class="table-filter-field">
                            <label for="author-filter">Author</label>
                            <select id="author-filter" v-model="authorFilter">
                                <option value="all">All</option>
                                <option value="present">Author present</option>
                                <option value="missing">Author missing</option>
                            </select>
                        </div>

                        <div class="table-filter-field">
                            <label for="bg-filter">Background class</label>
                            <select id="bg-filter" v-model="backgroundFilter">
                                <option value="all">All</option>
                                <option value="light">Light</option>
                                <option value="dark">Dark</option>
                            </select>
                        </div>

                        <div class="table-filter-field">
                            <label for="duplicate-filter">Duplicates</label>
                            <select id="duplicate-filter" v-model="duplicatesFilter">
                                <option value="all">All themes</option>
                                <option value="duplicates">Duplicates only</option>
                            </select>
                        </div>

                        <div class="table-filter-field">
                            <label for="sort-filter">Sort</label>
                            <select id="sort-filter" v-model="sortBy">
                                <option value="name-asc">Name (A-Z)</option>
                                <option value="author-asc">Author (A-Z)</option>
                                <option value="variant-asc">Variant (A-Z)</option>
                                <option value="luminance-asc">Background luminance (light-dark)</option>
                                <option value="luminance-desc">Background luminance (dark-light)</option>
                            </select>
                        </div>
                    </div>

                    <div class="table-wrap" role="region" aria-label="Themes data table" tabindex="0">
                        <table class="stats-table stats-table--themes">
                            <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Author</th>
                                    <th>Variant</th>
                                    <th>Background</th>
                                    <th>Foreground</th>
                                    <th>Palette</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr
                                    v-for="(theme, index) in paginatedThemes"
                                    :key="`${theme.hash || theme.name || 'theme'}-${index}`"
                                    tabindex="0"
                                    class="theme-row"
                                    @click="openDetail(theme)"
                                    @keydown.enter.prevent="openDetail(theme)"
                                    @keydown.space.prevent="openDetail(theme)"
                                >
                                    <td>{{ theme.name || '—' }}</td>
                                    <td>{{ theme.author || '—' }}</td>
                                    <td>{{ theme.variant || 'unspecified' }}</td>
                                    <td>
                                        <span class="inline-color"><span class="color-swatch" :style="{ backgroundColor: theme.background }"></span>{{ theme.background || '—' }}</span>
                                    </td>
                                    <td>
                                        <span class="inline-color"><span class="color-swatch" :style="{ backgroundColor: theme.foreground }"></span>{{ theme.foreground || '—' }}</span>
                                    </td>
                                    <td>
                                        <div class="palette-preview">
                                            <span
                                                v-for="key in COLOR_KEYS"
                                                :key="`${theme.hash || theme.name}-${key}`"
                                                class="palette-preview__swatch"
                                                :style="{ backgroundColor: theme[key] || '#000000' }"
                                            ></span>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                    <div class="table-footer">
                        <div class="table-footer__count">
                            Showing {{ paginatedThemes.length }} of {{ filteredThemes.length }} themes
                        </div>

                        <div class="table-footer__controls">
                            <label for="page-size">Rows</label>
                            <select id="page-size" v-model.number="pageSize">
                                <option :value="10">10</option>
                                <option :value="25">25</option>
                                <option :value="50">50</option>
                                <option :value="-1">All</option>
                            </select>

                            <Button class="btn" type="button" :disabled="currentPage === 1" @click="currentPage -= 1">
                                Previous
                            </Button>
                            <span>Page {{ currentPage }} / {{ totalPages }}</span>
                            <Button class="btn" type="button" :disabled="currentPage >= totalPages" @click="currentPage += 1">
                                Next
                            </Button>
                        </div>
                    </div>
                </div>

                <div class="stats-card">
                    <h3>All colors usage</h3>
                    <p class="stats-note">
                        Includes all color fields: color_01..color_16, background, foreground and cursor.
                    </p>

                    <div class="table-wrap" role="region" aria-label="All colors usage table" tabindex="0">
                        <table class="stats-table stats-table--all-colors">
                            <thead>
                                <tr>
                                    <th>Color</th>
                                    <th>Hex</th>
                                    <th>Total uses</th>
                                    <th>Themes count</th>
                                    <th>Themes</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr v-for="entry in allColorUsage" :key="entry.value">
                                    <td>
                                        <span class="color-swatch" :style="{ backgroundColor: entry.value }"></span>
                                    </td>
                                    <td>{{ entry.value }}</td>
                                    <td>{{ entry.count }}</td>
                                    <td>{{ entry.themes.length }}</td>
                                    <td class="themes-list-cell">{{ entry.themes.join(', ') }}</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </template>
        </div>

        <div
            v-if="selectedTheme"
            class="stats-lightbox"
            role="dialog"
            aria-modal="true"
            aria-labelledby="stats-detail-title"
            @click.self="closeDetail"
        >
            <div class="stats-lightbox__content" tabindex="-1" ref="detailModalRef">
                <button
                    type="button"
                    class="stats-lightbox__close"
                    aria-label="Close details"
                    @click="closeDetail"
                >
                    ×
                </button>

                <h3 id="stats-detail-title">{{ selectedTheme.name || 'Theme details' }}</h3>
                <p class="stats-note">Author: {{ selectedTheme.author || '—' }}</p>

                <div class="stats-lightbox__actions">
                    <Button class="btn" type="button" @click="copyThemeName">
                        Copy theme name
                    </Button>
                    <Button class="btn" type="button" @click="copyThemeJson">
                        Copy JSON
                    </Button>
                    <span v-if="copyMessage" class="copy-message" role="status" aria-live="polite">{{ copyMessage }}</span>
                </div>

                <table class="stats-table stats-table--detail">
                    <tbody>
                        <tr>
                            <th>Name</th>
                            <td>{{ selectedTheme.name || '—' }}</td>
                        </tr>
                        <tr>
                            <th>Author</th>
                            <td>{{ selectedTheme.author || '—' }}</td>
                        </tr>
                        <tr>
                            <th>Variant</th>
                            <td>{{ selectedTheme.variant || 'unspecified' }}</td>
                        </tr>
                        <tr>
                            <th>Hash</th>
                            <td>{{ selectedTheme.hash || '—' }}</td>
                        </tr>
                    </tbody>
                </table>

                <div class="table-wrap" role="region" aria-label="Theme base colors" tabindex="0">
                    <table class="stats-table stats-table--detail-meta-colors">
                        <thead>
                            <tr>
                                <th>background</th>
                                <th>foreground</th>
                                <th>cursor</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>
                                    <span class="inline-color">
                                        <span class="color-swatch" :style="{ backgroundColor: selectedTheme.background || '#000000' }"></span>
                                        {{ selectedTheme.background || '—' }}
                                    </span>
                                </td>
                                <td>
                                    <span class="inline-color">
                                        <span class="color-swatch" :style="{ backgroundColor: selectedTheme.foreground || '#000000' }"></span>
                                        {{ selectedTheme.foreground || '—' }}
                                    </span>
                                </td>
                                <td>
                                    <span class="inline-color">
                                        <span class="color-swatch" :style="{ backgroundColor: selectedTheme.cursor || '#000000' }"></span>
                                        {{ selectedTheme.cursor || '—' }}
                                    </span>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div class="detail-colors-grid">
                    <table class="stats-table stats-table--detail-colors">
                        <thead>
                            <tr>
                                <th>Color</th>
                                <th>Value</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr v-for="key in detailPaletteKeysLeft" :key="key">
                                <th>{{ key }}</th>
                                <td>
                                    <span class="inline-color">
                                        <span class="color-swatch" :style="{ backgroundColor: selectedTheme[key] || '#000000' }"></span>
                                        {{ selectedTheme[key] || '—' }}
                                    </span>
                                </td>
                            </tr>
                        </tbody>
                    </table>

                    <table class="stats-table stats-table--detail-colors">
                        <thead>
                            <tr>
                                <th>Color</th>
                                <th>Value</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr v-for="key in detailPaletteKeysRight" :key="key">
                                <th>{{ key }}</th>
                                <td>
                                    <span class="inline-color">
                                        <span class="color-swatch" :style="{ backgroundColor: selectedTheme[key] || '#000000' }"></span>
                                        {{ selectedTheme[key] || '—' }}
                                    </span>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup>
import Header from '@/components/Header/Header.vue';
import Button from '@/components/Buttons/Button.vue';

const COLOR_KEYS = Array.from({ length: 16 }, (_, index) => `color_${String(index + 1).padStart(2, '0')}`);
const ALL_COLOR_FIELDS = [...COLOR_KEYS, 'background', 'foreground', 'cursor'];

const cachedThemes = useState('stats-themes-cache', () => null);
const cachedUpdatedAt = useState('stats-themes-cache-updated', () => 0);

const themes = ref([]);
const loading = ref(false);
const errorMessage = ref('');

const searchQuery = ref('');
const variantFilter = ref('all');
const authorFilter = ref('all');
const backgroundFilter = ref('all');
const duplicatesFilter = ref('all');
const sortBy = ref('name-asc');
const pageSize = ref(25);
const currentPage = ref(1);

const selectedTheme = ref(null);
const detailModalRef = ref(null);
const copyMessage = ref('');

const detailPaletteKeysLeft = COLOR_KEYS.slice(0, 8);
const detailPaletteKeysRight = COLOR_KEYS.slice(8);
const GITHUB_THEMES_RAW_API = 'https://api.github.com/repos/Gogh-Co/Gogh/contents/data/themes-min.json?ref=master';

function normalizeThemes(remoteThemes) {
    if (Array.isArray(remoteThemes)) {
        return remoteThemes;
    }

    if (Array.isArray(remoteThemes?.data)) {
        return remoteThemes.data;
    }

    return [];
}

function normalizeString(value) {
    return typeof value === 'string' ? value.trim() : '';
}

function normalizeHexColor(value) {
    if (typeof value !== 'string') {
        return '';
    }

    const trimmed = value.trim();
    const withHash = trimmed.startsWith('#') ? trimmed : `#${trimmed}`;

    if (/^#[0-9a-fA-F]{3}$/.test(withHash)) {
        const [r, g, b] = withHash.slice(1);
        return `#${r}${r}${g}${g}${b}${b}`.toUpperCase();
    }

    if (/^#[0-9a-fA-F]{6}$/.test(withHash)) {
        return withHash.toUpperCase();
    }

    return '';
}

function normalizeTheme(theme) {
    const normalized = {
        ...theme,
        name: normalizeString(theme?.name),
        author: normalizeString(theme?.author),
        variant: normalizeString(theme?.variant) || 'unspecified',
        background: normalizeHexColor(theme?.background),
        foreground: normalizeHexColor(theme?.foreground),
        cursor: normalizeHexColor(theme?.cursor),
        hash: normalizeString(theme?.hash),
    };

    COLOR_KEYS.forEach((key) => {
        normalized[key] = normalizeHexColor(theme?.[key]);
    });

    normalized.backgroundClass = classifyBackground(normalized.background);
    normalized.backgroundLuminance = relativeLuminance(normalized.background);

    return normalized;
}

function channelToLinear(channelValue) {
    const normalized = channelValue / 255;
    if (normalized <= 0.04045) {
        return normalized / 12.92;
    }

    return ((normalized + 0.055) / 1.055) ** 2.4;
}

function relativeLuminance(hex) {
    const normalized = normalizeHexColor(hex);
    if (!normalized) {
        return 0;
    }

    const rgbHex = normalized.slice(1);
    const red = Number.parseInt(rgbHex.slice(0, 2), 16);
    const green = Number.parseInt(rgbHex.slice(2, 4), 16);
    const blue = Number.parseInt(rgbHex.slice(4, 6), 16);

    const linearRed = channelToLinear(red);
    const linearGreen = channelToLinear(green);
    const linearBlue = channelToLinear(blue);

    return (0.2126 * linearRed) + (0.7152 * linearGreen) + (0.0722 * linearBlue);
}

function classifyBackground(backgroundHex) {
    // Deterministic threshold: luminance >= 0.5 => light, otherwise dark.
    return relativeLuminance(backgroundHex) >= 0.5 ? 'light' : 'dark';
}

async function loadThemes(forceRefresh = false) {
    if (!forceRefresh && Array.isArray(cachedThemes.value) && cachedThemes.value.length) {
        themes.value = cachedThemes.value;
        errorMessage.value = '';
        return;
    }

    loading.value = true;
    errorMessage.value = '';

    try {
        let remoteThemes;

        try {
            remoteThemes = await $fetch('/api/themes', {
                timeout: 12000,
            });
        } catch {
            // Static deploy fallback (e.g. GitHub Pages): fetch directly from GitHub API.
            remoteThemes = await $fetch(GITHUB_THEMES_RAW_API, {
                timeout: 12000,
                headers: {
                    Accept: 'application/vnd.github.raw+json',
                    'X-GitHub-Api-Version': '2022-11-28',
                },
            });
        }

        const normalized = normalizeThemes(remoteThemes).map((theme) => normalizeTheme(theme));

        themes.value = normalized;
        cachedThemes.value = normalized;
        cachedUpdatedAt.value = Date.now();
    } catch {
        errorMessage.value = 'Could not fetch theme data from GitHub.';

        if (Array.isArray(cachedThemes.value) && cachedThemes.value.length) {
            themes.value = cachedThemes.value;
        }
    } finally {
        loading.value = false;
    }
}

async function refreshThemes() {
    await loadThemes(true);
}

function countBy(items, getValue) {
    const counts = new Map();

    items.forEach((item) => {
        const value = getValue(item);

        if (!value) {
            return;
        }

        counts.set(value, (counts.get(value) || 0) + 1);
    });

    return counts;
}

function topColorsBy(items, keys, limit = 10) {
    const colorMap = new Map();

    items.forEach((item) => {
        keys.forEach((key) => {
            const value = normalizeHexColor(item[key]);
            if (!value) {
                return;
            }

            colorMap.set(value, (colorMap.get(value) || 0) + 1);
        });
    });

    return [...colorMap.entries()]
        .sort((a, b) => b[1] - a[1] || a[0].localeCompare(b[0]))
        .slice(0, limit)
        .map(([value, count]) => ({ value, count }));
}

function duplicateEntriesBy(items, getValue) {
    const counts = countBy(items, getValue);

    return [...counts.entries()]
        .filter(([, count]) => count > 1)
        .sort((a, b) => b[1] - a[1] || a[0].localeCompare(b[0]))
        .map(([value, count]) => ({ value, count }));
}

const totalThemes = computed(() => themes.value.length);

const variantCounts = computed(() => {
    const counts = countBy(themes.value, (theme) => theme.variant || 'unspecified');

    return [...counts.entries()]
        .sort((a, b) => b[1] - a[1] || a[0].localeCompare(b[0]))
        .map(([value, count]) => ({ value, count }));
});

const authorCounts = computed(() => {
    const present = themes.value.filter((theme) => Boolean(theme.author)).length;
    return {
        present,
        missing: themes.value.length - present,
    };
});

const duplicateNames = computed(() => duplicateEntriesBy(themes.value, (theme) => theme.name));
const duplicateHashes = computed(() => duplicateEntriesBy(themes.value, (theme) => theme.hash));

const duplicateNameValues = computed(() => new Set(duplicateNames.value.map((entry) => entry.value)));
const duplicateHashValues = computed(() => new Set(duplicateHashes.value.map((entry) => entry.value)));

const topBackgroundColors = computed(() => topColorsBy(themes.value, ['background']));
const topForegroundColors = computed(() => topColorsBy(themes.value, ['foreground']));
const topPaletteColors = computed(() => topColorsBy(themes.value, COLOR_KEYS));
const allColorUsage = computed(() => {
    const usageMap = new Map();

    themes.value.forEach((theme) => {
        const themeName = theme.name || '(unnamed theme)';

        ALL_COLOR_FIELDS.forEach((key) => {
            const hex = normalizeHexColor(theme[key]);
            if (!hex) {
                return;
            }

            if (!usageMap.has(hex)) {
                usageMap.set(hex, {
                    value: hex,
                    count: 0,
                    themesSet: new Set(),
                });
            }

            const entry = usageMap.get(hex);
            entry.count += 1;
            entry.themesSet.add(themeName);
        });
    });

    return [...usageMap.values()]
        .map((entry) => ({
            value: entry.value,
            count: entry.count,
            themes: [...entry.themesSet].sort((a, b) => a.localeCompare(b)),
        }))
        .sort((a, b) => b.count - a.count || a.value.localeCompare(b.value));
});

const backgroundClassCounts = computed(() => {
    const light = themes.value.filter((theme) => theme.backgroundClass === 'light').length;
    return {
        light,
        dark: themes.value.length - light,
    };
});

const filteredThemes = computed(() => {
    const query = searchQuery.value.trim().toLowerCase();

    return themes.value
        .filter((theme) => {
            if (query) {
                const name = (theme.name || '').toLowerCase();
                const author = (theme.author || '').toLowerCase();

                if (!name.includes(query) && !author.includes(query)) {
                    return false;
                }
            }

            if (variantFilter.value !== 'all' && theme.variant !== variantFilter.value) {
                return false;
            }

            if (authorFilter.value === 'present' && !theme.author) {
                return false;
            }

            if (authorFilter.value === 'missing' && theme.author) {
                return false;
            }

            if (backgroundFilter.value !== 'all' && theme.backgroundClass !== backgroundFilter.value) {
                return false;
            }

            if (duplicatesFilter.value === 'duplicates') {
                const isDuplicateName = duplicateNameValues.value.has(theme.name);
                const isDuplicateHash = duplicateHashValues.value.has(theme.hash);

                if (!isDuplicateName && !isDuplicateHash) {
                    return false;
                }
            }

            return true;
        })
        .sort((left, right) => {
            const nameCompare = (left.name || '').localeCompare(right.name || '');
            const authorCompare = (left.author || '').localeCompare(right.author || '');
            const variantCompare = (left.variant || '').localeCompare(right.variant || '');
            const luminanceCompare = left.backgroundLuminance - right.backgroundLuminance;

            switch (sortBy.value) {
                case 'author-asc':
                    return authorCompare || nameCompare;
                case 'variant-asc':
                    return variantCompare || nameCompare;
                case 'luminance-asc':
                    return luminanceCompare || nameCompare;
                case 'luminance-desc':
                    return (right.backgroundLuminance - left.backgroundLuminance) || nameCompare;
                case 'name-asc':
                default:
                    return nameCompare || authorCompare;
            }
        });
});

const totalPages = computed(() => {
    if (pageSize.value === -1) {
        return 1;
    }

    const pages = Math.ceil(filteredThemes.value.length / pageSize.value);
    return pages > 0 ? pages : 1;
});

const paginatedThemes = computed(() => {
    if (pageSize.value === -1) {
        return filteredThemes.value;
    }

    const page = Math.min(currentPage.value, totalPages.value);
    const start = (page - 1) * pageSize.value;
    return filteredThemes.value.slice(start, start + pageSize.value);
});

const lastUpdatedLabel = computed(() => {
    if (!cachedUpdatedAt.value) {
        return '';
    }

    return new Date(cachedUpdatedAt.value).toLocaleString();
});

function formatPercent(count, total) {
    if (!total) {
        return '0.0%';
    }

    return `${((count / total) * 100).toFixed(1)}%`;
}

watch(
    [searchQuery, variantFilter, authorFilter, backgroundFilter, duplicatesFilter, sortBy, pageSize],
    () => {
        currentPage.value = 1;
    },
);

watch(filteredThemes, () => {
    if (currentPage.value > totalPages.value) {
        currentPage.value = totalPages.value;
    }
});

function onGlobalKeydown(event) {
    if (event.key === 'Escape' && selectedTheme.value) {
        closeDetail();
    }
}

function openDetail(theme) {
    selectedTheme.value = theme;
    copyMessage.value = '';

    nextTick(() => {
        detailModalRef.value?.focus();
    });
}

function closeDetail() {
    selectedTheme.value = null;
    copyMessage.value = '';
}

async function copyText(text) {
    if (!text) {
        return false;
    }

    try {
        if (globalThis.navigator?.clipboard?.writeText) {
            await globalThis.navigator.clipboard.writeText(text);
            return true;
        }
    } catch {
        // Continue to fallback below.
    }

    try {
        const textarea = document.createElement('textarea');
        textarea.value = text;
        textarea.setAttribute('readonly', '');
        textarea.style.position = 'absolute';
        textarea.style.left = '-9999px';
        document.body.appendChild(textarea);
        textarea.select();
        const didCopy = document.execCommand('copy');
        document.body.removeChild(textarea);
        return didCopy;
    } catch {
        return false;
    }
}

async function copyThemeName() {
    const didCopy = await copyText(selectedTheme.value?.name || '');
    copyMessage.value = didCopy ? 'Theme name copied.' : 'Copy failed.';
}

async function copyThemeJson() {
    const didCopy = await copyText(JSON.stringify(selectedTheme.value, null, 2));
    copyMessage.value = didCopy ? 'Theme JSON copied.' : 'Copy failed.';
}

onMounted(() => {
    loadThemes();
    window.addEventListener('keydown', onGlobalKeydown);
});

onUnmounted(() => {
    window.removeEventListener('keydown', onGlobalKeydown);
});
</script>

<style lang="scss" scoped>
@use '@/pages/stats.scss';
</style>

<template>
    <Header />

    <div class="gogh-content" :style="pageContentStyle">
        <div class="container">

            <div class="row hero-row">
                <div class="col-md-6">
                    <h2>
                        Color scheme for your terminal
                    </h2>

                    <p>
                        Gogh is a collection of color schemes for various terminal emulators, including Gnome Terminal, Pantheon Terminal, Tilix, and XFCE4 Terminal. These schemes are designed to make your terminal more visually appealing and improve your productivity by providing a better contrast and color differentiation.
                    </p>

                    <p class="install-intro">
                        <strong>Install: </strong>Just copy and paste One line command.
                    </p>
                </div>

                <div class="col-md-6">
                    <div class="code-wrap">
                        <h4>Linux <span>(wget)</span></h4>
                        <div class="code-holder">
                            <pre><code class="language-bash" id="code-linux">bash -c  "$(wget -qO- https://gogh.website/gogh)" </code></pre>
                            <button type="button" class="btn-copy" data-clipboard-target="#code-linux" aria-label="Copy Linux install command">
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" fill="#000" width="48" height="48"> <path d="M27.4,14.7l-6.1-6.1C21,8.2,20.5,8,20,8h-8c-1.1,0-2,0.9-2,2v18c0,1.1,0.9,2,2,2h14c1.1,0,2-0.9,2-2V16.1C28,15.6,27.8,15.1,27.4,14.7z M20,10l5.9,6H20V10z M12,28V10h6v6c0,1.1,0.9,2,2,2h6l0,10H12z"/> <path d="M6,18H4V4c0-1.1,0.9-2,2-2h14v2H6V18z"/> <rect width="32" height="32" fill="none"/> </svg>
                            </button>
                        </div>
                    </div>

                    <div class="code-wrap">
                        <h4>Mac <span>(curl)</span></h4>
                        <div class="code-holder">
                            <pre><code class="language-bash" id="code-mac">bash -c  "$(curl -fsSL https://gogh.website/gogh)" </code></pre>
                            <button type="button" class="btn-copy" data-clipboard-target="#code-mac" aria-label="Copy macOS install command">
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" fill="#000" width="48" height="48"> <path d="M27.4,14.7l-6.1-6.1C21,8.2,20.5,8,20,8h-8c-1.1,0-2,0.9-2,2v18c0,1.1,0.9,2,2,2h14c1.1,0,2-0.9,2-2V16.1C28,15.6,27.8,15.1,27.4,14.7z M20,10l5.9,6H20V10z M12,28V10h6v6c0,1.1,0.9,2,2,2h6l0,10H12z"/> <path d="M6,18H4V4c0-1.1,0.9-2,2-2h14v2H6V18z"/> <rect width="32" height="32" fill="none"/> </svg>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>



        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="filters">
                        <div class="filters__row filters__row--filters">
                            <ButtonFilter extra-class="js-btn--filter" :active="filter === 'all'"
                                @click="setFilter('all'); resetMenuSelected()">
                                All

                            </ButtonFilter>

                            <ButtonFilter extra-class="js-btn--filter" :active="filter === 'light'"
                                @click="setFilter('light'); resetMenuSelected()">
                                Light Themes
                            </ButtonFilter>

                            <ButtonFilter extra-class="js-btn--filter" :active="filter === 'dark'"
                                @click="setFilter('dark'); resetMenuSelected()">
                                Dark Themes
                            </ButtonFilter>

                            <ButtonFilter :active="selected === 'background' || filter === 'background'"
                                @click="setBackground(); toggleFilterBackground();">
                                by Background
                            </ButtonFilter>

                            <div class="view-toggle" role="group" aria-label="Gallery view">
                                <ButtonFilter :active="viewMode === 'compact'" @click="setViewMode('compact')">
                                    Compact
                                </ButtonFilter>

                                <ButtonFilter :active="viewMode === 'detailed'" @click="setViewMode('detailed')">
                                    Detailed
                                </ButtonFilter>
                            </div>

                            <div class="sort-toggle" role="group" aria-label="Sort themes">
                                <ButtonFilter :active="sortMode === 'alphabetical'" @click="setSortMode('alphabetical')">
                                    {{ sortDirection === 'desc' ? 'Z-A' : 'A-Z' }}
                                </ButtonFilter>

                                <ButtonFilter :active="sortMode === 'random'" @click="setSortMode('random')">
                                    Shuffle
                                </ButtonFilter>
                            </div>

                            <button
                                type="button"
                                class="page-theme-toggle"
                                :aria-label="pageTheme === 'dark' ? 'Switch page to light background' : 'Switch page to dark background'"
                                :aria-pressed="pageTheme === 'dark'"
                                @click="togglePageTheme"
                            >
                                <svg v-if="pageTheme === 'dark'" xmlns="http://www.w3.org/2000/svg" width="22" height="22" viewBox="0 0 24 24"><path fill="currentColor" d="M12 7a5 5 0 1 0 0 10a5 5 0 0 0 0-10m0-5a1 1 0 0 1 1 1v1a1 1 0 1 1-2 0V3a1 1 0 0 1 1-1m0 18a1 1 0 0 1 1 1v1a1 1 0 1 1-2 0v-1a1 1 0 0 1 1-1M3 11a1 1 0 0 1 0 2H2a1 1 0 1 1 0-2zm19 0a1 1 0 0 1 0 2h-1a1 1 0 1 1 0-2zM4.929 4.929a1 1 0 0 1 1.414 0l.707.707A1 1 0 1 1 5.636 7.05l-.707-.707a1 1 0 0 1 0-1.414m12.02 12.02a1 1 0 0 1 1.415 0l.707.707a1 1 0 1 1-1.414 1.414l-.707-.707a1 1 0 0 1 0-1.414M19.071 4.929a1 1 0 0 1 0 1.414l-.707.707a1 1 0 1 1-1.414-1.414l.707-.707a1 1 0 0 1 1.414 0M7.05 16.95a1 1 0 0 1 0 1.414l-.707.707a1 1 0 0 1-1.414-1.414l.707-.707a1 1 0 0 1 1.414 0"/></svg>
                                <svg v-else xmlns="http://www.w3.org/2000/svg" width="22" height="22" viewBox="0 0 24 24"><path fill="currentColor" d="M9.822 2.238a.75.75 0 0 1 .174.808a7.5 7.5 0 0 0 9.958 9.958a.75.75 0 0 1 .982.982A9.001 9.001 0 0 1 12 21a9 9 0 0 1-2.834-17.539a.75.75 0 0 1 .656.777"/></svg>
                            </button>

                            <div class="theme-search" role="search">
                                <button
                                    v-if="searchQuery"
                                    type="button"
                                    class="theme-search__clear"
                                    aria-label="Clear search"
                                    @click="clearSearchQuery"
                                >
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path fill="currentColor" d="M18.3 5.71L12 12l6.3 6.29l-1.41 1.42L10.59 13.4L4.29 19.71L2.88 18.3L9.17 12L2.88 5.71L4.29 4.29l6.3 6.3l6.29-6.3z"/></svg>
                                </button>
                                <span class="theme-search__icon" aria-hidden="true">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" viewBox="0 0 24 24"><!-- Icon from Material Symbols by Google - https://github.com/google/material-design-icons/blob/master/LICENSE --><path fill="currentColor" d="m19.6 21l-6.3-6.3q-.75.6-1.725.95T9.5 16q-2.725 0-4.612-1.888T3 9.5t1.888-4.612T9.5 3t4.613 1.888T16 9.5q0 1.1-.35 2.075T14.7 13.3l6.3 6.3zM9.5 14q1.875 0 3.188-1.312T14 9.5t-1.312-3.187T9.5 5T6.313 6.313T5 9.5t1.313 3.188T9.5 14"/></svg>
                                </span>
                                <input
                                    v-model.trim="searchQuery"
                                    class="theme-search__input"
                                    type="search"
                                    placeholder="Search theme by name"
                                    aria-label="Search theme by name"
                                >
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>


        <br>

        <div v-if="themesError && !themes.length" class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <div class="themes-status themes-status--error" role="alert">
                        <p>{{ themesError }}</p>
                    </div>
                </div>
            </div>
        </div>

        <div class="container-fluid">
            <div class="row ">
                <template v-for="theme in visibleThemes" :key="getThemeName(theme) || theme.background + theme.foreground">
                    <div :class="viewMode === 'compact' ? 'col-6 col-md-4 col-lg-3 col-xl-2' : 'col-12 col-md-6  col-xl-4'">
                        <div
                            class="terminal-preview"
                            role="button"
                            tabindex="0"
                            @click="openThemeLightbox(theme)"
                            @keydown.enter.prevent="openThemeLightbox(theme)"
                            @keydown.space.prevent="openThemeLightbox(theme)"
                        >
                            <CompactThemeCard v-if="viewMode === 'compact'" :theme="theme" />
                            <PreviewTerminal v-else :theme="theme" />
                        </div>
                    </div>
                </template>
            </div>

            <div ref="loadMoreSentinel" class="load-more-sentinel" aria-hidden="true"></div>
        </div>

        <div
            v-if="lightboxVisible && lightboxTheme"
            class="terminal-lightbox"
            @click.self="closeThemeLightbox"
        >
            <button
                type="button"
                class="terminal-lightbox__close"
                aria-label="Close fullscreen preview"
                @click="closeThemeLightbox"
            >
                ×
            </button>



            <div class="terminal-lightbox__content">
                <PreviewTerminal :theme="lightboxTheme" />

                <div v-if="lightboxTheme" class="code-wrap terminal-lightbox__install">
                    <div class="code-holder lightbox-code-holder">
                        <pre><code class="language-bash" :id="getLightboxInstallCodeId(lightboxTheme)">{{ getLightboxInstallCommand(lightboxTheme) }}</code></pre>
                        <button type="button" class="btn-copy" :data-clipboard-target="`#${getLightboxInstallCodeId(lightboxTheme)}`" aria-label="Copy install command">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" fill="#000" width="48" height="48"> <path d="M27.4,14.7l-6.1-6.1C21,8.2,20.5,8,20,8h-8c-1.1,0-2,0.9-2,2v18c0,1.1,0.9,2,2,2h14c1.1,0,2-0.9,2-2V16.1C28,15.6,27.8,15.1,27.4,14.7z M20,10l5.9,6H20V10z M12,28V10h6v6c0,1.1,0.9,2,2,2h6l0,10H12z"/> <path d="M6,18H4V4c0-1.1,0.9-2,2-2h14v2H6V18z"/> <rect width="32" height="32" fill="none"/> </svg>
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <div
            v-if="filterBackgroundVisible"
            class="background-lightbox"
            @click.self="toggleFilterBackground(false)"
        >
            <button
                type="button"
                class="background-lightbox__close"
                aria-label="Close background filter"
                @click="toggleFilterBackground(false)"
            >
                ×
            </button>

            <div class="background-lightbox__content">
                <h3 class="background-lightbox__title">Filter by background color</h3>

                <div class="background-lightbox__grid">
                    <template v-for="item in themeBackgrounds" :key="item">
                        <button
                            type="button"
                            class="background-lightbox__swatch"
                            :class="{ active: filter === item.toLowerCase() }"
                            :style="'background-color:' + item"
                            @click="setFilter(item); toggleFilterBackground(false);"
                        >
                            <span>{{ item.toLowerCase() }}</span>
                        </button>
                    </template>
                </div>
            </div>
        </div>
    </div>

    <div id=master-dev style="display:none">
        4d 69 67 75 65 6c 20 44 2e 20 51 75 69 6e 74 65 72 6f 20 2d 20 6d 69 67 75 65 6c 64 61 76 69 64 71 40 67 6d 61 69 6c 2e 63 6f 6d
    </div>
</template>

<script setup>
import chroma from 'chroma-js';
import ClipboardJS from 'clipboard';
import Prism from 'prismjs';

const title = 'Gogh - Terminal Color Schemes';
const description = SITE_DESCRIPTION;

useSeoMeta({
    title,
    description,
    ogTitle: title,
    ogDescription: description,
    ogUrl: canonicalUrl('/'),
    twitterTitle: title,
    twitterDescription: description,
});
useHead({
    link: [{ rel: 'canonical', href: canonicalUrl('/') }],
});

import PreviewTerminal from '@/components/Terminal/PreviewTerminal.vue';
import CompactThemeCard from '@/components/Terminal/CompactThemeCard.vue';
import Header from '@/components/Header/Header.vue';
import ButtonFilter from '@/components/Buttons/ButtonFilter.vue';

const getUrl = '/api/themes';
const GITHUB_THEMES_RAW_API = 'https://api.github.com/repos/Gogh-Co/Gogh/contents/data/themes-min.json?ref=master';
const THEMES_PAGE_SIZE = 60;

const VIEW_MODE_STORAGE_KEY = 'gogh-gallery-view-mode';
const SORT_MODE_STORAGE_KEY = 'gogh-gallery-sort-mode';
const SORT_DIRECTION_STORAGE_KEY = 'gogh-gallery-sort-direction';
const PAGE_THEME_STORAGE_KEY = 'gogh-page-theme';
const PAGE_THEME_DARK_STYLE = {
    '--site-background': '#121F2A',
    '--site-foreground': '#e7e7e7',
    '--generator-action-background': '#e7e7e7',
    '--generator-action-foreground': '#0d1926',
    '--code-block-background': '#0d1926',
    '--code-block-foreground': '#e7e7e7',
};

const themes = ref([]);
const themesError = ref('');
const filter = ref('all');
const viewMode = ref('compact');
const sortMode = ref('alphabetical');
const sortDirection = ref('asc');
const shuffleOrder = ref(new Map());
const pageTheme = ref('light');
const themeBackgrounds = ref([]);
const selected = ref(null);
const filterBackgroundVisible = ref(false);
const lightboxVisible = ref(false);
const visibleCount = ref(THEMES_PAGE_SIZE);
const loadMoreSentinel = ref(null);
let loadMoreObserver = null;
const lightboxTheme = ref(null);
const searchQuery = ref('');

function lightOrDark(color) {
    // Variables for red, green, blue values
    var r, g, b, hsp;
    // Check the format of the color, HEX or RGB?
    if (color.match(/^rgb/)) {
        // If RGB --> store the red, green, blue values in separate variables
        color = color.match(/^rgba?\((\d+),\s*(\d+),\s*(\d+)(?:,\s*(\d+(?:\.\d+)?))?\)$/);
        r = color[1];
        g = color[2];
        b = color[3];
    } else {
        // If hex --> Convert it to RGB: http://gist.github.com/983661
        color = +('0x' + color.slice(1).replace(color.length < 5 && /./g, '$&$&'));
        r = color >> 16;
        g = color >> 8 & 255;
        b = color & 255;
    }
    // HSP (Highly Sensitive Poo) equation from http://alienryderflex.com/hsp.html
    hsp = Math.sqrt(0.299 * (r * r) + 0.587 * (g * g) + 0.114 * (b * b));
    // Using the HSP value, determine whether the color is light or dark
    if (hsp > 127.5) {
        return 'light';
    } else {
        return 'dark';
    }
}

function colorDistance(color1, color2) {
    // This is actually the square of the distance but
    // this doesn't matter for sorting.
    var result = 0;
    for (var i = 0; i < color1.length; i++)
        result += (color1[i] - color2[i]) * (color1[i] - color2[i]);
    return result;
}

function sortColors(colors) {
    // Calculate distance between each color
    var distances = [];
    for (var i = 0; i < colors.length; i++) {
        distances[i] = [];
        for (var j = 0; j < i; j++)
            distances.push([
                colors[i],
                colors[j],
                colorDistance(colors[i], colors[j]),
            ]);
    }
    distances.sort(function (a, b) {
        return a[2] - b[2];
    });

    // Put each color into separate cluster initially
    var colorToCluster = {};
    for (var y = 0; y < colors.length; y++)
        colorToCluster[colors[y]] = [colors[y]];

    // Merge clusters, starting with lowest distances
    var lastCluster;
    for (var e = 0; e < distances.length; e++) {
        var color1 = distances[e][0];
        var color2 = distances[e][1];
        var cluster1 = colorToCluster[color1];
        var cluster2 = colorToCluster[color2];
        if (!cluster1 || !cluster2 || cluster1 == cluster2)
            continue;

        // Make sure color1 is at the end of its cluster and
        // color2 at the beginning.
        if (color1 !== cluster1[cluster1.length - 1])
            cluster1.reverse();
        if (color2 !== cluster2[0])
            cluster2.reverse();

        // Merge cluster2 into cluster1
        cluster1.push.apply(cluster1, cluster2);
        delete colorToCluster[color1];
        delete colorToCluster[color2];
        colorToCluster[cluster1[0]] = cluster1;
        colorToCluster[cluster1[cluster1.length - 1]] = cluster1;
        lastCluster = cluster1;
    }

    // By now all colors should be in one cluster
    return lastCluster;
}

function normalizeThemes(remoteThemes) {
    if (Array.isArray(remoteThemes)) {
        return remoteThemes;
    }

    if (Array.isArray(remoteThemes?.data)) {
        return remoteThemes.data;
    }

    return [];
}

async function fetchData() {
    try {
        const remoteThemes = await $fetch(getUrl, {
            timeout: 12000,
        });

        themesError.value = '';
        return normalizeThemes(remoteThemes);
    } catch {
        // Static deploy fallback (e.g. GitHub Pages): /api/themes only exists
        // at build time, so fetch directly from GitHub API at runtime.
        try {
            const remoteThemes = await $fetch(GITHUB_THEMES_RAW_API, {
                timeout: 12000,
                headers: {
                    Accept: 'application/vnd.github.raw+json',
                    'X-GitHub-Api-Version': '2022-11-28',
                },
            });

            themesError.value = '';
            return normalizeThemes(remoteThemes);
        } catch {
            themesError.value = 'Could not fetch theme data from GitHub.';
            return [];
        }
    }
}

function setFilter(f) {
    filter.value = '';
    setTimeout(() => {
        filter.value = f;
    }, 100);
}

function setBackground() {
    selected.value = 'background';
    filter.value = 'background';
}

function setViewMode(mode) {
    viewMode.value = mode;

    try {
        localStorage.setItem(VIEW_MODE_STORAGE_KEY, mode);
    } catch {
        // Ignore storage failures (private browsing, disabled storage, etc.).
    }
}

function setPageTheme(mode) {
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

const pageContentStyle = computed(() => (pageTheme.value === 'dark' ? PAGE_THEME_DARK_STYLE : undefined));

function getBackgrounds() {
    if (!Array.isArray(themes.value) || themes.value.length === 0) {
        themeBackgrounds.value = [];
        return;
    }

    const bgs = themes.value.map(e => e.background);
    const bgsLowerCase = bgs.map(ele => ele.toLowerCase());
    const bgsUnique = [...new Set(bgsLowerCase)];
    const bgsRGB = bgsUnique.map(ele => chroma(ele).rgb());
    const bgsSort = sortColors(bgsRGB);
    const bgsHEX = (bgsSort || []).map(ele => chroma(ele).hex());
    themeBackgrounds.value = bgsHEX.reverse();
}


function resetMenuSelected() {
    selected.value = '';
    filterBackgroundVisible.value = false;
}

function toggleFilterBackground(force) {
    if (typeof force === 'boolean') {
        filterBackgroundVisible.value = force;
    } else {
        filterBackgroundVisible.value = !filterBackgroundVisible.value;
    }
}

function openThemeLightbox(theme) {
    lightboxTheme.value = theme;
    lightboxVisible.value = true;

    nextTick(() => {
        requestAnimationFrame(() => {
            Prism.highlightAll();
        });
    });
}

function closeThemeLightbox() {
    lightboxVisible.value = false;
    lightboxTheme.value = null;
}

function onWindowKeydown(event) {
    if (event.key !== 'Escape') {
        return;
    }

    if (lightboxVisible.value) {
        closeThemeLightbox();
    }

    if (filterBackgroundVisible.value) {
        toggleFilterBackground(false);
    }
}

function getLightboxThemeName(theme) {
    return (theme?.name || theme?.theme || 'Theme').replace(/\"/g, '\\"');
}

function getLightboxInstallCodeId(theme) {
    const themeName = (theme?.name || theme?.theme || 'theme').toLowerCase();
    const safeThemeName = themeName.replace(/[^a-z0-9]+/g, '-').replace(/(^-|-$)/g, '');
    return `code-lightbox-${safeThemeName || 'theme'}`;
}

function getLightboxInstallCommand(theme) {
    return `bash -c "$(wget -qO- https://gogh.website/gogh)" -- "${getLightboxThemeName(theme)}"`;
}

function getThemeName(theme) {
    return (theme?.name || theme?.theme || '').toString();
}

function clearSearchQuery() {
    searchQuery.value = '';
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

function themeHasExactHexColor(theme, searchHex) {
    if (!theme || !searchHex) {
        return false;
    }

    return Object.values(theme).some((value) => normalizeHexColor(value) === searchHex);
}

function matchesThemeSearch(theme) {
    const rawSearch = searchQuery.value.trim();
    const normalizedSearch = rawSearch.toLowerCase();

    if (!normalizedSearch) {
        return true;
    }

    const normalizedHexSearch = normalizeHexColor(rawSearch);

    if (normalizedHexSearch) {
        return themeHasExactHexColor(theme, normalizedHexSearch);
    }

    return getThemeName(theme).toLowerCase().includes(normalizedSearch);
}

function themeMatchesFilter(theme) {
    return (filter.value === theme.category || filter.value === 'all' || filter.value === 'background' || filter.value === theme.background.toLowerCase()) && matchesThemeSearch(theme);
}

function themeSortKey(theme) {
    return getThemeName(theme) || `${theme.background}-${theme.foreground}`;
}

function generateShuffleOrder() {
    const map = new Map();
    themes.value.forEach((theme) => {
        map.set(themeSortKey(theme), Math.random());
    });
    shuffleOrder.value = map;
}

function setSortMode(mode) {
    if (mode === 'alphabetical' && sortMode.value === 'alphabetical') {
        sortDirection.value = sortDirection.value === 'asc' ? 'desc' : 'asc';
    } else if (mode === 'alphabetical') {
        sortDirection.value = 'asc';
    }

    sortMode.value = mode;
    visibleCount.value = THEMES_PAGE_SIZE;

    if (mode === 'random') {
        generateShuffleOrder();
    }

    try {
        localStorage.setItem(SORT_MODE_STORAGE_KEY, mode);
        localStorage.setItem(SORT_DIRECTION_STORAGE_KEY, sortDirection.value);
    } catch {
        // Ignore storage failures (private browsing, disabled storage, etc.).
    }
}

const filteredThemes = computed(() => {
    const matched = themes.value.filter(themeMatchesFilter);

    if (sortMode.value === 'random') {
        return [...matched].sort((a, b) => {
            const keyA = shuffleOrder.value.get(themeSortKey(a)) ?? 0;
            const keyB = shuffleOrder.value.get(themeSortKey(b)) ?? 0;
            return keyA - keyB;
        });
    }

    const direction = sortDirection.value === 'desc' ? -1 : 1;
    return [...matched].sort((a, b) => direction * getThemeName(a).localeCompare(getThemeName(b)));
});
const visibleThemes = computed(() => filteredThemes.value.slice(0, visibleCount.value));

watch([filter, searchQuery], () => {
    visibleCount.value = THEMES_PAGE_SIZE;
});

const { data: themesData } = await useAsyncData('themes', () => fetchData(), {
    default: () => [],
});

const rawThemes = normalizeThemes(themesData.value);

themes.value = rawThemes.map((theme) => ({
    ...theme,
    category: lightOrDark(theme.background),
}));

getBackgrounds();

onMounted(() => {
    new ClipboardJS('.btn-copy');

    try {
        const savedViewMode = localStorage.getItem(VIEW_MODE_STORAGE_KEY);
        if (savedViewMode === 'compact' || savedViewMode === 'detailed') {
            viewMode.value = savedViewMode;
        }
    } catch {
        // Ignore storage failures (private browsing, disabled storage, etc.).
    }

    try {
        const savedPageTheme = localStorage.getItem(PAGE_THEME_STORAGE_KEY);
        if (savedPageTheme === 'dark' || savedPageTheme === 'light') {
            pageTheme.value = savedPageTheme;
        }
    } catch {
        // Ignore storage failures (private browsing, disabled storage, etc.).
    }

    try {
        const savedSortMode = localStorage.getItem(SORT_MODE_STORAGE_KEY);
        if (savedSortMode === 'alphabetical' || savedSortMode === 'random') {
            sortMode.value = savedSortMode;
        }

        const savedSortDirection = localStorage.getItem(SORT_DIRECTION_STORAGE_KEY);
        if (savedSortDirection === 'asc' || savedSortDirection === 'desc') {
            sortDirection.value = savedSortDirection;
        }
    } catch {
        // Ignore storage failures (private browsing, disabled storage, etc.).
    }

    if (sortMode.value === 'random' && themes.value.length) {
        generateShuffleOrder();
    }

    if (!themes.value.length) {
        fetchData().then((clientThemes) => {
            themes.value = clientThemes.map((theme) => ({
                ...theme,
                category: lightOrDark(theme.background),
            }));
            getBackgrounds();

            if (sortMode.value === 'random') {
                generateShuffleOrder();
            }
        });
    }

    getBackgrounds();
    window.addEventListener('keydown', onWindowKeydown);

    if (loadMoreSentinel.value && typeof IntersectionObserver !== 'undefined') {
        loadMoreObserver = new IntersectionObserver((entries) => {
            if (entries.some((entry) => entry.isIntersecting) && visibleCount.value < filteredThemes.value.length) {
                visibleCount.value = Math.min(visibleCount.value + THEMES_PAGE_SIZE, filteredThemes.value.length);
            }
        });
        loadMoreObserver.observe(loadMoreSentinel.value);
    }
});

onUnmounted(() => {
    window.removeEventListener('keydown', onWindowKeydown);
    loadMoreObserver?.disconnect();
});
</script>



<style lang="scss" scoped>
@use '@/pages/index.scss';
</style>

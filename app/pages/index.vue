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
                            <div class="filters__group" role="group" aria-label="Filter themes">
                                <span class="filters__group-label">Filter</span>

                                <ButtonFilter extra-class="js-btn--filter" :active="filter === 'all' && !colorFilterField"
                                    @click="setFilter('all'); clearColorFilter()">
                                    All

                                </ButtonFilter>

                                <ButtonFilter extra-class="js-btn--filter" :active="filter === 'light' && !colorFilterField"
                                    @click="setFilter('light'); clearColorFilter()">
                                    Light Themes
                                </ButtonFilter>

                                <ButtonFilter extra-class="js-btn--filter" :active="filter === 'dark' && !colorFilterField"
                                    @click="setFilter('dark'); clearColorFilter()">
                                    Dark Themes
                                </ButtonFilter>

                                <ButtonFilter extra-class="js-btn--filter" :active="filter === 'popular' && !colorFilterField"
                                    @click="setFilter('popular'); clearColorFilter(); setSortMode('random'); setViewMode('compact')">
                                    Popular
                                </ButtonFilter>

                                <ButtonFilter
                                    :active="!!colorFilterField"
                                    aria-haspopup="dialog"
                                    :aria-expanded="colorFilterFieldMenuOpen"
                                    @click="openColorFilterFieldMenu"
                                >
                                    by Color
                                </ButtonFilter>
                            </div>

                            <div class="filters__group view-toggle" role="group" aria-label="Gallery view">
                                <span class="filters__group-label">View</span>

                                <ButtonFilter :active="viewMode === 'compact'" @click="setViewMode('compact')">
                                    Compact
                                </ButtonFilter>

                                <ButtonFilter :active="viewMode === 'detailed'" @click="setViewMode('detailed')">
                                    Detailed
                                </ButtonFilter>
                            </div>

                            <div class="filters__group sort-toggle" role="group" aria-label="Sort themes">
                                <span class="filters__group-label">Sort</span>

                                <ButtonFilter :active="sortMode === 'alphabetical'" @click="setSortMode('alphabetical')">
                                    {{ sortMode === 'alphabetical' && sortDirection === 'desc' ? 'Z-A' : 'A-Z' }}
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
            v-if="colorFilterFieldMenuOpen"
            class="color-filter-lightbox"
            @click.self="closeColorFilterFieldMenu"
        >
            <button
                type="button"
                class="color-filter-lightbox__close"
                aria-label="Close color filter"
                @click="closeColorFilterFieldMenu"
            >
                ×
            </button>

            <div class="color-filter-lightbox__content">
                <div class="color-filter-grid" role="group" aria-label="Filter by color">
                    <button
                        type="button"
                        class="color-filter-cube color-filter-cube--background"
                        :class="{ active: colorFilterField === 'background' }"
                        :style="'background-color:' + BACKGROUND_FILTER_OPTION.previewColor"
                        :aria-pressed="colorFilterField === 'background'"
                        :title="BACKGROUND_FILTER_OPTION.label"
                        :aria-label="'Filter by ' + BACKGROUND_FILTER_OPTION.label"
                        @click="selectColorFilterField('background')"
                    ></button>

                    <div class="color-filter-grid__ansi">
                        <div class="color-filter-grid__row">
                            <button
                                v-for="option in NORMAL_COLOR_FILTER_OPTIONS"
                                :key="option.key"
                                type="button"
                                class="color-filter-cube"
                                :class="{ active: colorFilterField === option.key }"
                                :style="'background-color:' + option.previewColor"
                                :aria-pressed="colorFilterField === option.key"
                                :title="option.label"
                                :aria-label="'Filter by ' + option.label"
                                @click="selectColorFilterField(option.key)"
                            ></button>
                        </div>

                        <div class="color-filter-grid__row">
                            <button
                                v-for="option in BRIGHT_COLOR_FILTER_OPTIONS"
                                :key="option.key"
                                type="button"
                                class="color-filter-cube"
                                :class="{ active: colorFilterField === option.key }"
                                :style="'background-color:' + option.previewColor"
                                :aria-pressed="colorFilterField === option.key"
                                :title="option.label"
                                :aria-label="'Filter by ' + option.label"
                                @click="selectColorFilterField(option.key)"
                            ></button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div
            v-if="colorFilterValueMenuOpen"
            class="background-lightbox"
            @click.self="closeColorFilterValueMenu"
        >
            <button
                type="button"
                class="background-lightbox__close"
                aria-label="Close color filter"
                @click="closeColorFilterValueMenu"
            >
                ×
            </button>

            <div class="background-lightbox__content">
                <div class="background-lightbox__header">
                    <h3 class="background-lightbox__title">Filter by {{ colorFilterFieldLabel }} color</h3>

                    <div class="background-lightbox__sort" role="group" aria-label="Sort swatches">
                        <ButtonFilter :active="colorFilterValueSortMode === 'color'" @click="setColorFilterValueSortMode('color')">
                            Color
                        </ButtonFilter>

                        <ButtonFilter :active="colorFilterValueSortMode === 'count'" @click="setColorFilterValueSortMode('count')">
                            {{ colorFilterValueSortMode === 'count' && colorFilterValueSortDirection === 'asc' ? 'Least first' : 'Most first' }}
                        </ButtonFilter>
                    </div>
                </div>

                <div class="background-lightbox__grid">
                    <template v-for="item in colorFilterFieldValues" :key="item.hex">
                        <button
                            type="button"
                            class="background-lightbox__swatch"
                            :class="{ active: colorFilterValue === item.hex.toLowerCase() }"
                            :style="'background-color:' + item.hex"
                            :title="item.count + (item.count === 1 ? ' theme' : ' themes')"
                            @click="selectColorFilterValue(item.hex)"
                        >
                            <span class="background-lightbox__count" :style="{ color: item.textColor, textShadow: item.textShadow }">{{ item.count }}</span>
                            <span class="background-lightbox__hex">{{ item.hex.toLowerCase() }}</span>
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

// The 48 most popular terminal color schemes, used by the "Popular" filter.
// One single research pass (web search, Sept 2026), ranking every candidate
// on the same two signals:
//   1. GitHub stars on the scheme's own origin repo (api.github.com/repos/<owner>/<repo>).
//   2. VS Code Marketplace install counts for the closest matching editor theme.
// ...corroborated with "best terminal/iTerm2/VS Code theme" roundup articles
// and r/unixporn / r/neovim mentions where no repo/install number applied.
// Each entry is matched to its exact Gogh filename (Gogh/themes/<Name>.yml)
// -- re-verify spelling/casing against Gogh/themes/ before reusing this list,
// scheme names there aren't normalized (e.g. "Github Light" vs "GitHub Dark",
// "Papercolor Dark" vs "PaperColor" upstream).
//
// Ranked by evidence found (strongest first):
//   GitHub Dark        - github/github-vscode-theme, 18.8M VS Code installs
//   Dracula            - dracula/dracula-theme, 7.5M installs / 23,577 GH stars
//   One Dark Pro       - Binaryify/OneDark-Pro, 6.7M installs
//   Catppuccin Mocha   - catppuccin/catppuccin, 3.5M installs / 19,729 GH stars
//   Monokai            - "Monokai" VS Code theme, 2.9M installs
//   TokyoNight Storm   - folke/tokyonight.nvim, 2.7M installs / 8,183 GH stars
//   Solarized Dark     - altercation/solarized, 16,013 GH stars
//   Gruvbox Dark       - morhetz/gruvbox, 15,727 GH stars
//   Tomorrow Night     - chriskempson/tomorrow-theme, 13,988 GH stars
//   Material Theme     - equinusocio/material-theme, 11,313 GH stars
//   Nord               - nordtheme/nord (=arcticicestudio/nord), 6,874 GH stars
//   Kanagawa Wave      - rebelot/kanagawa.nvim, 6,370 GH stars
//   Synthwave 84       - robb0wen/synthwave-vscode, 5,290 GH stars
//   Everforest Dark    - sainnhe/everforest, 4,189 GH stars
//   Nightfox           - EdenEast/nightfox.nvim, 4,065 GH stars
//   Aura               - daltonmenezes/aura-theme, 3,818 GH stars
//   Rose Pine          - rose-pine/neovim, 3,085 GH stars
//   Night Owl          - sdras/night-owl-vscode-theme, 2,956 GH stars
//   Papercolor Dark    - NLKNguyen/papercolor-theme, 2,844 GH stars
//   Andromeda          - EliverLara/andromeda, 2,420 GH stars
//   Iceberg Dark       - cocopon/iceberg.vim, 2,380 GH stars
//   Sonokai            - sainnhe/sonokai, 1,954 GH stars
//   Seoul256           - junegunn/seoul256.vim, 1,756 GH stars
//   Snazzy             - sindresorhus/hyper-snazzy, ~1.5k GH stars, widely mirrored
//   Hybrid             - w0ng/vim-hybrid, 1,490 GH stars
//   Doom One / Doom Vibrant - doomemacs/themes, 1,490 stars (Doom Emacs host: 20k+ stars)
//   Zenburn            - jnurmine/Zenburn, 920 GH stars (one of the oldest ported schemes)
//   Ayu Dark           - ayu-theme/ayu-colors, 851 GH stars but very widely ported
//   Cobalt2            - wesbos/cobalt2-vscode, 807 GH stars
//   Vesper             - raunofreiberg/vesper, 778 GH stars, trending 2025-26
//
//   No single hard star/install number found for these, but each recurs
//   across multiple independent "best terminal themes" roundups:
//   Palenight, Horizon, Panda, Oceanic Next, One Half Dark, Spacegray,
//   IR Black (classic TextMate/Sublime scheme, still cited constantly)
//
//   Ubuntu             - default terminal palette, high exposure by
//                        install-base rather than GH stars/roundup mentions
//
//   Light/other-flavor variants of a family already above (independently
//   popular, not redundant with the parent entry):
//   Gruvbox Light, Catppuccin Macchiato, Catppuccin Frappe, TokyoNight Moon,
//   Kanagawa Dragon, Rose Pine Moon, Ayu Mirage, Github Light, Everforest Light
//
// Checked but deliberately left out as redundant or too weak a signal:
//   - Molokai (tomasr/molokai, 3,626 GH stars) -- a Monokai reskin, same
//     family already covered by "Monokai" above; keeping both reads as one
//     entry duplicated under two names in a 48-theme gallery.
//   - Bluloco (https://www.blulocotheme.com/, 227-442 stars across its repos)
//   - Poimandres (https://github.com/topics/poimandres, ~490 stars, Neovim-niche)
//   - "City Lights" (no matching origin repo found under that name)
//
// Sources consulted (re-run similar searches to refresh this list):
//   - https://moltamp.com/blog/best-terminal-color-schemes-2026/
//   - https://terminalcolors.com/
//   - https://www.jit.io/blog/best-vs-code-themes-2023
//   - https://dev.to/dhavalkurkutiya/material-nova-the-best-vs-code-theme-of-2026-50el
//   - https://terminalcandy.com/blog/iterm2-themes-2026/
//   - GitHub REST API, api.github.com/repos/<owner>/<repo>, for GH star counts above
//   - VS Code Marketplace listing pages, for install counts above
const POPULAR_THEME_NAMES = new Set([
    'GitHub Dark',
    'Dracula',
    'One Dark Pro',
    'Catppuccin Mocha',
    'Monokai',
    'TokyoNight Storm',
    'Solarized Dark',
    'Gruvbox Dark',
    'Tomorrow Night',
    'Material Theme',
    'Nord',
    'Kanagawa Wave',
    'Synthwave 84',
    'Everforest Dark',
    'Nightfox',
    'Aura',
    'Rose Pine',
    'Night Owl',
    'Papercolor Dark',
    'Andromeda',
    'Iceberg Dark',
    'Sonokai',
    'Seoul256',
    'Snazzy',
    'Hybrid',
    'Doom One',
    'Doom Vibrant',
    'Zenburn',
    'Ayu Dark',
    'Cobalt2',
    'Vesper',
    'Palenight',
    'Horizon',
    'Panda',
    'Oceanic Next',
    'One Half Dark',
    'Spacegray',
    'IR Black',
    'Ubuntu',
    'Gruvbox Light',
    'Catppuccin Macchiato',
    'Catppuccin Frappe',
    'TokyoNight Moon',
    'Kanagawa Dragon',
    'Rose Pine Moon',
    'Ayu Mirage',
    'Github Light',
    'Everforest Light',
]);

const VIEW_MODE_STORAGE_KEY = 'gogh-gallery-view-mode';
const SORT_MODE_STORAGE_KEY = 'gogh-gallery-sort-mode';
const SORT_DIRECTION_STORAGE_KEY = 'gogh-gallery-sort-direction';
const PAGE_THEME_STORAGE_KEY = 'gogh-page-theme';

// Labels/preview swatches for the "filter by color" submenu, in theme-template.yml
// order (color_01..color_16: 8 base ANSI colors, then their 8 bright variants).
// Preview colors are lifted verbatim from the "Gogh" theme itself
// (themes/Gogh.yml on master) rather than generic ANSI primaries, so the
// filter cubes read as the project's own palette.
const COLOR_FILTER_SLOTS = [
    { label: 'Black', previewColor: '#243342' },
    { label: 'Red', previewColor: '#C54133' },
    { label: 'Green', previewColor: '#27AE60' },
    { label: 'Yellow', previewColor: '#EDB20A' },
    { label: 'Blue', previewColor: '#2479D0' },
    { label: 'Magenta', previewColor: '#7D3EA0' },
    { label: 'Cyan', previewColor: '#1D8579' },
    { label: 'White', previewColor: '#C9CCCD' },
    { label: 'Bright Black', previewColor: '#34495E' },
    { label: 'Bright Red', previewColor: '#E74C3C' },
    { label: 'Bright Green', previewColor: '#2ECC71' },
    { label: 'Bright Yellow', previewColor: '#F1C40F' },
    { label: 'Bright Blue', previewColor: '#3498DB' },
    { label: 'Bright Magenta', previewColor: '#9B59B6' },
    { label: 'Bright Cyan', previewColor: '#2AA198' },
    { label: 'Bright White', previewColor: '#ECF0F1' },
];

const COLOR_FILTER_OPTIONS = [
    { key: 'background', label: 'Background', previewColor: '#0D1926' },
    ...COLOR_FILTER_SLOTS.map((slot, index) => ({
        key: `color_${String(index + 1).padStart(2, '0')}`,
        label: slot.label,
        previewColor: slot.previewColor,
    })),
];

const COLOR_FILTER_KEYS = new Set(COLOR_FILTER_OPTIONS.map((option) => option.key));

// Split for the field-picker lightbox's layout: a background cube beside a
// 2-row grid of the 16 ANSI colors (normal row on top, bright row below),
// matching the swatch grid on CompactThemeCard.
const BACKGROUND_FILTER_OPTION = COLOR_FILTER_OPTIONS[0];
const NORMAL_COLOR_FILTER_OPTIONS = COLOR_FILTER_OPTIONS.slice(1, 9);
const BRIGHT_COLOR_FILTER_OPTIONS = COLOR_FILTER_OPTIONS.slice(9, 17);

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
const colorFilterField = ref('');
const colorFilterValue = ref('');
const colorFilterFieldMenuOpen = ref(false);
const colorFilterValueMenuOpen = ref(false);
const colorFilterValueSortMode = ref('color');
const colorFilterValueSortDirection = ref('desc');
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

// Unique, rainbow-ordered values for whichever field the 2-step "by Color"
// filter has picked (an ANSI slot or "background"). Neutrals are grouped
// black-to-white first, then hue-sorted, so a hue like blue always shows as
// one contiguous run instead of being scattered by sort noise -- same
// ordering as the field-picker cubes themselves.
const colorFilterFieldValues = computed(() => {
    if (!colorFilterField.value || !Array.isArray(themes.value) || themes.value.length === 0) {
        return [];
    }

    const counts = new Map();
    themes.value.forEach((theme) => {
        const value = theme[colorFilterField.value];
        if (typeof value !== 'string' || !value) {
            return;
        }

        const hex = chroma(value.toLowerCase()).hex();
        counts.set(hex, (counts.get(hex) || 0) + 1);
    });

    return [...counts.entries()]
        .map(([hex, count]) => {
            // Adaptive contrast (reusing the same light/dark check as the
            // category filter) so the theme count reads on any swatch color,
            // light or dark, without a background box cluttering the grid.
            const isLight = lightOrDark(hex) === 'light';
            return {
                hex,
                count,
                textColor: isLight ? '#0d1926' : '#ffffff',
                textShadow: isLight ? '0 0 3px rgba(255, 255, 255, 0.75)' : '0 0 3px rgba(0, 0, 0, 0.75)',
            };
        })
        .sort((a, b) => {
            if (colorFilterValueSortMode.value === 'count' && a.count !== b.count) {
                const direction = colorFilterValueSortDirection.value === 'asc' ? 1 : -1;
                return direction * (a.count - b.count);
            }

            // Rainbow order: the default sort, and the tie-breaker when
            // sorting by count (so same-count swatches still read as a
            // contiguous run instead of a shuffled pile).
            return compareHexRainbow(a.hex, b.hex);
        });
});

const colorFilterFieldLabel = computed(() => {
    const option = COLOR_FILTER_OPTIONS.find((opt) => opt.key === colorFilterField.value);
    return option ? option.label.toLowerCase() : 'color';
});

function isValidColorFilterKey(key) {
    return COLOR_FILTER_KEYS.has(key);
}

function clearColorFilter() {
    colorFilterField.value = '';
    colorFilterValue.value = '';
    colorFilterFieldMenuOpen.value = false;
    colorFilterValueMenuOpen.value = false;
}

function openColorFilterFieldMenu() {
    colorFilterFieldMenuOpen.value = true;
}

function closeColorFilterFieldMenu() {
    colorFilterFieldMenuOpen.value = false;
}

function selectColorFilterField(fieldKey) {
    if (!isValidColorFilterKey(fieldKey)) {
        return;
    }

    colorFilterField.value = fieldKey;
    colorFilterValue.value = '';
    colorFilterValueSortMode.value = 'color';
    colorFilterFieldMenuOpen.value = false;
    colorFilterValueMenuOpen.value = true;
}

function closeColorFilterValueMenu() {
    colorFilterValueMenuOpen.value = false;
}

function selectColorFilterValue(hex) {
    colorFilterValue.value = hex.toLowerCase();
    colorFilterValueMenuOpen.value = false;
}

function setColorFilterValueSortMode(mode) {
    if (mode === 'count' && colorFilterValueSortMode.value === 'count') {
        colorFilterValueSortDirection.value = colorFilterValueSortDirection.value === 'desc' ? 'asc' : 'desc';
    } else if (mode === 'count') {
        colorFilterValueSortDirection.value = 'desc';
    }

    colorFilterValueSortMode.value = mode;
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

    if (colorFilterValueMenuOpen.value) {
        closeColorFilterValueMenu();
    } else if (colorFilterFieldMenuOpen.value) {
        closeColorFilterFieldMenu();
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
    if (colorFilterField.value && colorFilterValue.value) {
        const themeValue = (theme[colorFilterField.value] || '').toLowerCase();
        return themeValue === colorFilterValue.value && matchesThemeSearch(theme);
    }

    return (filter.value === theme.category || filter.value === 'all' || (filter.value === 'popular' && theme.popular)) && matchesThemeSearch(theme);
}

function themeSortKey(theme) {
    return getThemeName(theme) || `${theme.background}-${theme.foreground}`;
}

// Cached per hex value (many themes/slots share the exact same hex), so sorting
// by color doesn't re-run chroma's LCH conversion on every pairwise comparison.
const colorSortTupleCache = new Map();

// Below this LCH chroma, a color's hue is just noise -- HSL saturation was
// tried first, but it blows up near the lightness extremes (an off-white like
// #FDF0ED reads as 80% "saturated" in HSL despite being barely tinted), which
// scattered near-white colors across the whole hue spectrum instead of
// grouping them. LCH chroma measures actual colorfulness without that
// distortion, so it stays low for true near-black/near-white colors regardless
// of how light or dark they are. Those go in their own achromatic bucket (-2,
// sorted black-to-white by lightness) ahead of the true hue-sorted rainbow.
const ACHROMATIC_CHROMA_THRESHOLD = 15;

function getColorSortTuple(hex) {
    if (typeof hex !== 'string' || !hex) {
        return [-2, 0, 0];
    }

    const cacheKey = hex.toLowerCase();
    const cached = colorSortTupleCache.get(cacheKey);
    if (cached) {
        return cached;
    }

    let tuple;
    try {
        const [l, c, h] = chroma(hex).lch();
        const hue = Number.isNaN(h) ? null : h;
        const isAchromatic = hue === null || c < ACHROMATIC_CHROMA_THRESHOLD;
        // Within a hue, sort light-to-dark (a shade gradient) before chroma.
        tuple = isAchromatic ? [-2, l, c] : [hue, l, c];
    } catch {
        tuple = [-2, 0, 0];
    }

    colorSortTupleCache.set(cacheKey, tuple);
    return tuple;
}

function compareHexRainbow(hexA, hexB) {
    const tupleA = getColorSortTuple(hexA);
    const tupleB = getColorSortTuple(hexB);

    for (let i = 0; i < tupleA.length; i++) {
        if (tupleA[i] !== tupleB[i]) {
            return tupleA[i] - tupleB[i];
        }
    }

    return 0;
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

watch([filter, searchQuery, colorFilterValue], () => {
    visibleCount.value = THEMES_PAGE_SIZE;
});

const { data: themesData } = await useAsyncData('themes', () => fetchData(), {
    default: () => [],
});

const rawThemes = normalizeThemes(themesData.value);

themes.value = rawThemes.map((theme) => ({
    ...theme,
    category: lightOrDark(theme.background),
    popular: POPULAR_THEME_NAMES.has(getThemeName(theme)),
}));

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
                popular: POPULAR_THEME_NAMES.has(getThemeName(theme)),
            }));

            if (sortMode.value === 'random') {
                generateShuffleOrder();
            }
        });
    }

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

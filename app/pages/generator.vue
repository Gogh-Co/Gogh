<template>
    <Header :background-color="siteBackgroundColor" />

    <div
        class="gogh-content"
        :style="{ '--site-background': siteBackgroundColor }"
    >
        <div class="container generator-page">
            <div class="row">
                <div class="col-md-12">
                    <h2>Theme Generator</h2>
                </div>
            </div>

            <div class="row terminal-row">
                <div class="col-md-12">
                    <GeneratorTerminal
                        :theme="previewTheme"
                        :flat="hasAdjustedSiteBackground"
                        @update-color="onTerminalColorUpdate"
                    />
                </div>
            </div>

            <div class="row terminal-actions-row">
                <div class="col-md-12">
                    <div
                        class="terminal-actions"
                        :style="{
                            '--generator-action-background': actionBackgroundColor,
                            '--generator-action-foreground': actionForegroundColor,
                        }"
                    >
                        <Button class="btn" type="button" @click="downloadTheme">
                            Download YML
                        </Button>
                        <Button class="btn" type="button" @click="resetTheme">
                            Reset
                        </Button>
                        <div class="site-background-control">
                            <label for="site-background">Background</label>
                            <span aria-hidden="true">Dark</span>
                            <input
                                id="site-background"
                                v-model.number="siteBackgroundLightness"
                                type="range"
                                min="0"
                                max="255"
                                :aria-valuetext="siteBackgroundDescription"
                                aria-label="Site background brightness, from dark to light"
                                @input="hasAdjustedSiteBackground = true"
                            >
                            <span aria-hidden="true">Light</span>
                        </div>
                        <div class="theme-source-control" @focusout="onSourceFocusOut">
                            <label for="theme-source-search">FROM:</label>
                            <div class="theme-source-combobox">
                                <input
                                    id="theme-source-search"
                                    v-model="sourceQuery"
                                    type="search"
                                    role="combobox"
                                    aria-autocomplete="list"
                                    aria-controls="theme-source-options"
                                    :aria-expanded="sourceMenuOpen"
                                    :aria-activedescendant="activeSourceOptionId"
                                    autocomplete="off"
                                    placeholder="Search themes"
                                    @focus="openSourceMenu"
                                    @input="onSourceInput"
                                    @keydown.down.prevent="moveSourceOption(1)"
                                    @keydown.up.prevent="moveSourceOption(-1)"
                                    @keydown.enter.prevent="selectActiveSource"
                                    @keydown.esc.prevent="closeSourceMenu"
                                >
                                <button
                                    type="button"
                                    class="theme-source-toggle"
                                    aria-label="Toggle theme list"
                                    :aria-expanded="sourceMenuOpen"
                                    @click="toggleSourceMenu"
                                >
                                    <span aria-hidden="true">⌄</span>
                                </button>
                                <div
                                    v-if="sourceMenuOpen"
                                    id="theme-source-options"
                                    class="theme-source-options"
                                    role="listbox"
                                >
                                    <button
                                        v-for="(theme, index) in filteredSourceThemes"
                                        :id="`theme-source-option-${index}`"
                                        :key="theme.name"
                                        type="button"
                                        role="option"
                                        :aria-selected="theme.name === selectedSourceName"
                                        :class="{ 'is-active': index === activeSourceIndex }"
                                        @mousedown.prevent="selectSourceTheme(theme)"
                                    >
                                        <span
                                            class="theme-source-swatch"
                                            :style="{ backgroundColor: sanitizeHex(theme.background) }"
                                            aria-hidden="true"
                                        ></span>
                                        {{ theme.name }}
                                    </button>
                                    <p v-if="!filteredSourceThemes.length" class="theme-source-empty">
                                        No themes found
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <p v-if="showRequiredError" class="required-note">
                        * Change Name and Author from the default values to download.
                    </p>
                </div>
            </div>

            <div class="row">
                <div class="col-md-6">
                    <div class="generator-card">
                        <h3>Theme data</h3>

                        <div class="theme-meta-rows">
                            <div class="field-wrap">
                                <label for="name">Name</label>
                                <input
                                    id="name"
                                    v-model="form.name"
                                    type="text"
                                    :class="{ 'input-error': showRequiredError && isNameInvalid }"
                                    @input="clearRequiredError"
                                >
                            </div>

                            <div class="field-wrap">
                                <label for="author">Author</label>
                                <input
                                    id="author"
                                    v-model="form.author"
                                    type="text"
                                    :class="{ 'input-error': showRequiredError && isAuthorInvalid }"
                                    @input="clearRequiredError"
                                >
                            </div>

                            <div class="field-wrap">
                                <label for="variant">Variant</label>
                                <select id="variant" v-model="form.variant">
                                    <option value="dark">dark</option>
                                    <option value="light">light</option>
                                </select>
                            </div>
                        </div>

                        <div class="colors-columns">
                            <div class="colors-grid">
                                <div class="field-wrap" v-for="key in colorKeysLeft" :key="key">
                                    <label :for="key">{{ key }}</label>
                                    <div class="color-input-wrap">
                                        <color-picker
                                            v-model="form[key]"
                                            :storage-key="`generator-${key}`"
                                            with-hex-input
                                            :with-colors-history="6"
                                            v-slot="{ show }"
                                        >
                                            <button
                                                class="picker-btn"
                                                type="button"
                                                :style="`background-color: ${sanitizeHex(form[key])}`"
                                                :aria-label="`Pick color for ${key}`"
                                                @click.stop.prevent="show($event)"
                                            ></button>
                                        </color-picker>
                                        <input
                                            :id="key"
                                            v-model="form[key]"
                                            type="text"
                                            placeholder="#RRGGBB"
                                            @blur="normalizeColorField(key)"
                                        >
                                    </div>
                                </div>
                            </div>

                            <div class="colors-grid">
                                <div class="field-wrap" v-for="key in colorKeysRight" :key="key">
                                    <label :for="key">{{ key }}</label>
                                    <div class="color-input-wrap">
                                        <color-picker
                                            v-model="form[key]"
                                            :storage-key="`generator-${key}`"
                                            with-hex-input
                                            :with-colors-history="6"
                                            v-slot="{ show }"
                                        >
                                            <button
                                                class="picker-btn"
                                                type="button"
                                                :style="`background-color: ${sanitizeHex(form[key])}`"
                                                :aria-label="`Pick color for ${key}`"
                                                @click.stop.prevent="show($event)"
                                            ></button>
                                        </color-picker>
                                        <input
                                            :id="key"
                                            v-model="form[key]"
                                            type="text"
                                            placeholder="#RRGGBB"
                                            @blur="normalizeColorField(key)"
                                        >
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="colors-grid colors-grid--meta">
                            <div class="field-wrap">
                                <label for="background">background</label>
                                <div class="color-input-wrap">
                                    <color-picker
                                        v-model="form.background"
                                        storage-key="generator-background"
                                        with-hex-input
                                        :with-colors-history="6"
                                        v-slot="{ show }"
                                    >
                                        <button
                                            class="picker-btn"
                                            type="button"
                                            :style="`background-color: ${sanitizeHex(form.background)}`"
                                            aria-label="Pick background color"
                                            @click.stop.prevent="show($event)"
                                        ></button>
                                    </color-picker>
                                    <input
                                        id="background"
                                        v-model="form.background"
                                        type="text"
                                        placeholder="#RRGGBB"
                                        @blur="normalizeColorField('background')"
                                    >
                                </div>
                            </div>

                            <div class="field-wrap">
                                <label for="foreground">foreground</label>
                                <div class="color-input-wrap">
                                    <color-picker
                                        v-model="form.foreground"
                                        storage-key="generator-foreground"
                                        with-hex-input
                                        :with-colors-history="6"
                                        v-slot="{ show }"
                                    >
                                        <button
                                            class="picker-btn"
                                            type="button"
                                            :style="`background-color: ${sanitizeHex(form.foreground)}`"
                                            aria-label="Pick foreground color"
                                            @click.stop.prevent="show($event)"
                                        ></button>
                                    </color-picker>
                                    <input
                                        id="foreground"
                                        v-model="form.foreground"
                                        type="text"
                                        placeholder="#RRGGBB"
                                        @blur="normalizeColorField('foreground')"
                                    >
                                </div>
                            </div>

                            <div class="field-wrap">
                                <label for="cursor">cursor</label>
                                <div class="color-input-wrap">
                                    <color-picker
                                        v-model="form.cursor"
                                        storage-key="generator-cursor"
                                        with-hex-input
                                        :with-colors-history="6"
                                        v-slot="{ show }"
                                    >
                                        <button
                                            class="picker-btn"
                                            type="button"
                                            :style="`background-color: ${sanitizeHex(form.cursor)}`"
                                            aria-label="Pick cursor color"
                                            @click.stop.prevent="show($event)"
                                        ></button>
                                    </color-picker>
                                    <input
                                        id="cursor"
                                        v-model="form.cursor"
                                        type="text"
                                        placeholder="#RRGGBB"
                                        @blur="normalizeColorField('cursor')"
                                    >
                                </div>
                            </div>
                        </div>

                        <div class="action-row">
                            <Button class="btn" to="/">< Back to themes</Button>
                        </div>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="generator-card">
                        <h3>Generated file preview</h3>
                        <pre><code>{{ generatedTheme }}</code></pre>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup>
import Header from '@/components/Header/Header.vue';
import GeneratorTerminal from '@/components/Terminal/GeneratorTerminal.vue';
import themeTemplate from '../../theme-template.yml?raw';
import Button from '@/components/Buttons/Button.vue';

const DEFAULT_NAME = 'My Theme';
const DEFAULT_AUTHOR = 'Your Name (https://example.com)';
const GENERATOR_STORAGE_KEY = 'gogh-generator-form-v2';
const LEGACY_GENERATOR_STORAGE_KEY = 'gogh-generator-form-v1';

const DEFAULT_FORM = {
  name: DEFAULT_NAME,
  author: DEFAULT_AUTHOR,
  variant: 'dark',
  color_01: '#232323',
  color_02: '#FF000F',
  color_03: '#8CE10B',
  color_04: '#FFB900',
  color_05: '#008DF8',
  color_06: '#6D43A6',
  color_07: '#00D8EB',
  color_08: '#FFFFFF',
  color_09: '#444444',
  color_10: '#FF2740',
  color_11: '#ABE15B',
  color_12: '#FFD242',
  color_13: '#0092FF',
  color_14: '#9A5FEB',
  color_15: '#67FFF0',
  color_16: '#FFFFFF',
  background: '#0E1019',
  foreground: '#FFFAF4',
  cursor: '#FFFAF4',
};

const form = reactive({ ...DEFAULT_FORM });
const { data: sourceThemesData } = await useFetch('/api/themes', {
    default: () => [],
});
const sourceQuery = ref('Argonaut');
const selectedSourceName = ref('Argonaut');
const sourceMenuOpen = ref(false);
const activeSourceIndex = ref(-1);
const siteBackgroundLightness = ref(231);
const hasAdjustedSiteBackground = ref(false);

const siteBackgroundColor = computed(() => {
    const value = Math.max(0, Math.min(255, siteBackgroundLightness.value));
    return `rgb(${value}, ${value}, ${value})`;
});

const usesDarkBackground = computed(() => siteBackgroundLightness.value < 128);
const actionBackgroundColor = computed(() => usesDarkBackground.value ? '#ffffff' : '#0d1926');
const actionForegroundColor = computed(() => usesDarkBackground.value ? '#0d1926' : '#ffffff');
const siteBackgroundDescription = computed(() => {
    const percent = Math.round((siteBackgroundLightness.value / 255) * 100);
    return `${percent}% light`;
});

const colorKeys = Array.from({ length: 16 }, (_, i) =>
  `color_${String(i + 1).padStart(2, '0')}`
);
const persistedColorKeys = [...colorKeys, 'background', 'foreground', 'cursor'];
const sourceThemes = computed(() => Array.isArray(sourceThemesData.value) ? sourceThemesData.value : []);
const filteredSourceThemes = computed(() => {
    const query = sourceQuery.value.trim().toLocaleLowerCase();
    if (!query || query === selectedSourceName.value.toLocaleLowerCase()) {
        return sourceThemes.value;
    }

    return sourceThemes.value.filter((theme) =>
        String(theme.name || '').toLocaleLowerCase().includes(query)
    );
});
const activeSourceOptionId = computed(() =>
    sourceMenuOpen.value && activeSourceIndex.value >= 0
        ? `theme-source-option-${activeSourceIndex.value}`
        : undefined
);

const colorKeysLeft = computed(() => colorKeys.slice(0, 8));
const colorKeysRight = computed(() => colorKeys.slice(8));

function normalizeColorField(key) {
  form[key] = sanitizeHex(form[key]);
}

function sanitizeHex(value) {
  if (!value) {
    return '#000000';
  }

  const hex = value.startsWith('#') ? value : `#${value}`;

  if (/^#[0-9a-fA-F]{6}$/.test(hex)) {
    return hex.toUpperCase();
  }

  return '#000000';
}

function yamlEscape(value) {
  return String(value).replaceAll("'", "''");
}

const generatedTheme = computed(() => {
  const map = {
    NAME: yamlEscape(form.name),
    AUTHOR: yamlEscape(form.author),
    VARIANT: yamlEscape(form.variant),
    BACKGROUND: sanitizeHex(form.background),
    FOREGROUND: sanitizeHex(form.foreground),
    CURSOR: sanitizeHex(form.cursor),
  };

  colorKeys.forEach((key, index) => {
    map[`COLOR_${String(index + 1).padStart(2, '0')}`] = sanitizeHex(form[key]);
  });

  let output = themeTemplate;
  for (const [token, value] of Object.entries(map)) {
    output = output.replaceAll(`__${token}__`, value);
  }

  return output;
});

const previewTheme = computed(() => ({
  ...form,
  background: sanitizeHex(form.background),
  foreground: sanitizeHex(form.foreground),
  cursor: sanitizeHex(form.cursor),
  ...Object.fromEntries(
    colorKeys.map((key) => [key, sanitizeHex(form[key])])
  ),
}));

const downloadFileName = computed(() => {
  const slug = form.name
    .trim()
    .toLowerCase()
    .replace(/[^a-z0-9]+/g, '-')
    .replace(/^-+|-+$/g, '');

  return `${slug || 'my-theme'}.yml`;
});

const canDownload = computed(() => {
  const name = form.name?.trim() || '';
  const author = form.author?.trim() || '';

  return (
    Boolean(name) &&
    Boolean(author) &&
    name !== DEFAULT_NAME &&
    author !== DEFAULT_AUTHOR
  );
});

const showRequiredError = ref(false);

const isNameInvalid = computed(() => {
  const name = form.name?.trim() || '';
  return !name || name === DEFAULT_NAME;
});

const isAuthorInvalid = computed(() => {
  const author = form.author?.trim() || '';
  return !author || author === DEFAULT_AUTHOR;
});

function clearRequiredError() {
  showRequiredError.value = false;
}

function openSourceMenu() {
    sourceMenuOpen.value = true;
    activeSourceIndex.value = filteredSourceThemes.value.findIndex(
        (theme) => theme.name === selectedSourceName.value
    );
}

function closeSourceMenu() {
    sourceMenuOpen.value = false;
    activeSourceIndex.value = -1;
}

function toggleSourceMenu() {
    if (sourceMenuOpen.value) {
        closeSourceMenu();
        return;
    }

    openSourceMenu();
}

function onSourceInput() {
    sourceMenuOpen.value = true;
    activeSourceIndex.value = filteredSourceThemes.value.length ? 0 : -1;
}

function moveSourceOption(direction) {
    if (!sourceMenuOpen.value) {
        openSourceMenu();
    }

    const count = filteredSourceThemes.value.length;
    if (!count) {
        activeSourceIndex.value = -1;
        return;
    }

    activeSourceIndex.value = (activeSourceIndex.value + direction + count) % count;
}

function selectActiveSource() {
    const theme = filteredSourceThemes.value[activeSourceIndex.value];
    if (theme) {
        selectSourceTheme(theme);
    }
}

function selectSourceTheme(theme) {
    persistedColorKeys.forEach((key) => {
        form[key] = sanitizeHex(theme[key]);
    });
    form.variant = theme.variant === 'light' ? 'light' : 'dark';
    selectedSourceName.value = theme.name;
    sourceQuery.value = theme.name;
    showRequiredError.value = false;
    closeSourceMenu();
}

function onSourceFocusOut(event) {
    if (!event.currentTarget.contains(event.relatedTarget)) {
        closeSourceMenu();
        sourceQuery.value = selectedSourceName.value;
    }
}

function resetTheme() {
    Object.assign(form, DEFAULT_FORM);
    selectedSourceName.value = 'Argonaut';
    sourceQuery.value = 'Argonaut';
    closeSourceMenu();
    showRequiredError.value = false;

    if (process.client) {
        localStorage.removeItem(GENERATOR_STORAGE_KEY);
    }
}

function downloadTheme() {
  if (!canDownload.value) {
    showRequiredError.value = true;
    return;
  }

  showRequiredError.value = false;

  const blob = new Blob([generatedTheme.value], { type: 'text/yaml;charset=utf-8' });
  const url = URL.createObjectURL(blob);
  const link = document.createElement('a');
  link.href = url;
  link.download = downloadFileName.value;
  link.click();
  URL.revokeObjectURL(url);
}

function onTerminalColorUpdate({ key, value }) {
  if (!key || !(key in form)) {
    return;
  }

  form[key] = sanitizeHex(value);
}

onMounted(() => {
    if (!process.client) {
        return;
    }

    localStorage.removeItem(LEGACY_GENERATOR_STORAGE_KEY);
    const saved = localStorage.getItem(GENERATOR_STORAGE_KEY);
    if (!saved) {
        return;
    }

    try {
        const parsed = JSON.parse(saved);
        if (!parsed || typeof parsed !== 'object') {
            return;
        }

        form.name = typeof parsed.name === 'string' ? parsed.name : DEFAULT_FORM.name;
        form.author = typeof parsed.author === 'string' ? parsed.author : DEFAULT_FORM.author;
        form.variant = parsed.variant === 'light' ? 'light' : 'dark';

        persistedColorKeys.forEach((key) => {
            if (typeof parsed[key] === 'string') {
                form[key] = sanitizeHex(parsed[key]);
            }
        });
    } catch {
        localStorage.removeItem(GENERATOR_STORAGE_KEY);
    }
});

watch(
    form,
    () => {
        if (!process.client) {
            return;
        }

        const payload = {
            name: form.name,
            author: form.author,
            variant: form.variant,
        };

        persistedColorKeys.forEach((key) => {
            payload[key] = form[key];
        });

        localStorage.setItem(GENERATOR_STORAGE_KEY, JSON.stringify(payload));
    },
    { deep: true }
);
</script>

<style lang="scss" scoped>
@use '@/pages/generator.scss';
</style>

<template>
    <Header />

    <div class="gogh-content">
        <div class="container generator-page">
            <div class="row">
                <div class="col-md-12">
                    <h2>Theme Generator</h2>
                </div>
            </div>

            <div class="row terminal-row">
                <div class="col-md-12">
                    <Terminal
                        :theme="previewTheme"
                        :enable-color-picker="true"
                        @update-color="onTerminalColorUpdate"
                    />
                </div>
            </div>

            <div class="row terminal-actions-row">
                <div class="col-md-12">
                    <div class="terminal-actions">
                        <button class="btn" type="button" @click="downloadTheme">
                            Download YML
                        </button>
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

                        <div class="colors-grid">
                            <div class="field-wrap" v-for="key in colorKeys" :key="key">
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
                            <NuxtLink class="btn" to="/">Back to themes</NuxtLink>
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
import Terminal from '@/components/Terminal/Terminal.vue';
import themeTemplate from '../../theme-template.yml?raw';

const DEFAULT_NAME = 'My Theme';
const DEFAULT_AUTHOR = 'Your Name (https://example.com)';

const form = reactive({
  name: DEFAULT_NAME,
  author: DEFAULT_AUTHOR,
  variant: 'dark',
  color_01: '#1f1f28',
  color_02: '#e46876',
  color_03: '#87a987',
  color_04: '#e6c384',
  color_05: '#7fb4ca',
  color_06: '#957fb8',
  color_07: '#7aa89f',
  color_08: '#dcd7ba',
  color_09: '#727169',
  color_10: '#ff5d62',
  color_11: '#98bb6c',
  color_12: '#ffa066',
  color_13: '#7fb4ca',
  color_14: '#957fb8',
  color_15: '#7aa89f',
  color_16: '#c8c093',
  background: '#1f1f28',
  foreground: '#dcd7ba',
  cursor: '#c8c093',
});

const colorKeys = Array.from({ length: 16 }, (_, i) =>
  `color_${String(i + 1).padStart(2, '0')}`
);

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
</script>

<style lang="scss" scoped>
@use '@/pages/generator.scss';
</style>

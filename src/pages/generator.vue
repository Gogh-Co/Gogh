<script setup>
import Terminal from '@/components/Terminal/Terminal.vue';
import themeTemplate from '../../theme-template.yml?raw';

const form = reactive({
  name: 'My Theme',
  author: 'Your Name (https://example.com)',
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

function downloadTheme() {
  const blob = new Blob([generatedTheme.value], { type: 'text/yaml;charset=utf-8' });
  const url = URL.createObjectURL(blob);
  const link = document.createElement('a');
  link.href = url;
  link.download = downloadFileName.value;
  link.click();
  URL.revokeObjectURL(url);
}
</script>

<template>
  <header class="gogh-header">
    <h1>
      <span> Gogh </span>
      <img src="https://raw.githubusercontent.com/Gogh-Co/Gogh/master/.images/gogh/Gogh-logo-dark.png" alt="">
    </h1>
  </header>

  <div class="gogh-content">
    <div class="container generator-page">
      <div class="row">
        <div class="col-md-12">
          <h2>Theme Generator</h2>
          <p>Create a single YAML theme file using the root template.</p>
          <p>
            Template file:
            <strong>theme-template.yml</strong>
          </p>
        </div>
      </div>

      <div class="row">
        <div class="col-md-6">
          <div class="generator-card">
            <h3>Theme data</h3>

            <div class="field-wrap">
              <label for="name">Name</label>
              <input id="name" v-model="form.name" type="text">
            </div>

            <div class="field-wrap">
              <label for="author">Author</label>
              <input id="author" v-model="form.author" type="text">
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
                <input :id="key" v-model="form[key]" type="text" placeholder="#RRGGBB">
              </div>
            </div>

            <div class="colors-grid colors-grid--meta">
              <div class="field-wrap">
                <label for="background">background</label>
                <input id="background" v-model="form.background" type="text" placeholder="#RRGGBB">
              </div>

              <div class="field-wrap">
                <label for="foreground">foreground</label>
                <input id="foreground" v-model="form.foreground" type="text" placeholder="#RRGGBB">
              </div>

              <div class="field-wrap">
                <label for="cursor">cursor</label>
                <input id="cursor" v-model="form.cursor" type="text" placeholder="#RRGGBB">
              </div>
            </div>

            <div class="action-row">
              <button class="btn" type="button" @click="downloadTheme">Download YML</button>
              <NuxtLink class="btn" to="/">Back to themes</NuxtLink>
            </div>
          </div>
        </div>

        <div class="col-md-6">
          <Terminal :theme="previewTheme" />

          <div class="generator-card">
            <h3>Generated file preview</h3>
            <pre><code>{{ generatedTheme }}</code></pre>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<style lang="scss" scoped>
@use '@/sass/main.scss';

.generator-page {
  .generator-card {
    margin: 0 0 30px;
    padding: 20px;
    border: 1px solid #d6d6d6;
    background: #f8f8f8;
  }

  h3 {
    margin-bottom: 16px;
  }

  .field-wrap {
    margin: 0 0 14px;

    label {
      display: block;
      margin: 0 0 6px;
      font-size: 1.4rem;
      font-weight: 700;
      text-transform: lowercase;
    }

    input,
    select {
      width: 100%;
      border: 1px solid #b2b2b2;
      background: #fff;
      padding: 10px;
      color: #0d1926;
      font-size: 1.4rem;
    }
  }

  .colors-grid {
    display: grid;
    grid-template-columns: repeat(2, minmax(0, 1fr));
    gap: 0 16px;
  }

  .colors-grid--meta {
    margin-top: 10px;
  }

  .action-row {
    display: flex;
    flex-wrap: wrap;
    gap: 12px;
    margin-top: 20px;
  }

  pre {
    max-height: 540px;
    overflow: auto;
    margin: 0;
    padding: 16px;
    border: 1px solid #d6d6d6;
    background: #f5f2f0;
    color: #2f2f2f;
    font-size: 1.2rem;
    line-height: 1.5;
  }
}
</style>

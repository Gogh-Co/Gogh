<template>
    <header class="gogh-header">
        <div class="gogh-header__inner">
            <NuxtLink to="/" class="gogh-header__brand" aria-label="Gogh home">
                <span class="gogh-header__brand-text">Gogh</span>
                <span class="gogh-header__logo-bar" aria-hidden="true">
                    <span
                        v-for="(color, index) in logoBarColors"
                        :key="index"
                        class="gogh-header__logo-swatch"
                        :style="{ backgroundColor: color }"
                    ></span>
                </span>
            </NuxtLink>

            <nav class="gogh-header__nav" aria-label="Primary">
                <NuxtLink to="/generator" class="gogh-header__nav-link">
                    Generator
                </NuxtLink>
                <NuxtLink to="/wcsg" class="gogh-header__nav-link">
                    WCSG
                </NuxtLink>
                <NuxtLink to="/stats" class="gogh-header__nav-link">
                    Stats
                </NuxtLink>
                <NuxtLink to="/wallpapers" class="gogh-header__nav-link">
                    Wallpapers
                </NuxtLink>
                <NuxtLink to="/terminals" class="gogh-header__nav-link">
                    Terminals
                </NuxtLink>

                <div class="gogh-header__github">
                    <a class="github-button"
                        href="https://github.com/Gogh-Co/Gogh"
                        data-color-scheme="no-preference: dark; light: light; dark: dark;"
                        data-size="large"
                        aria-label="Open Gogh-Co/Gogh on GitHub">
                        View
                    </a>
                    <a class="github-button"
                        href="https://github.com/Gogh-Co/Gogh"
                        data-color-scheme="no-preference: dark; light: light; dark: dark;"
                        data-icon="octicon-star"
                        data-size="large"
                        data-show-count="true"
                        aria-label="Star Gogh-Co/Gogh on GitHub">
                        Star
                    </a>
                </div>
            </nav>
        </div>
    </header>
</template>

<script setup>
import githubButtonsScript from '@/assets/static/buttons.js?raw';

const logoBarColors = [
    '#243342', '#C54133', '#27AE60', '#EDB20A', '#2479D0', '#7D3EA0', '#1D8579', '#C9CCCD',
    '#34495E', '#E74C3C', '#2ECC71', '#F1C40F', '#3498DB', '#9B59B6', '#2AA198', '#ECF0F1',
];

function mountGithubButtons() {
    if (typeof document === 'undefined') {
        return;
    }

    // The buttons.js library only scans the DOM for `.github-button`
    // anchors once, when its script executes. Header re-mounts fresh
    // anchors on every client-side navigation (it lives in each page,
    // not app.vue), so the old script must be removed and re-injected
    // each time to force a re-scan — otherwise the new anchors are
    // left untransformed.
    const scriptId = 'github-buttons-inline';
    const existingScript = document.getElementById(scriptId);

    if (existingScript) {
        existingScript.remove();
    }

    const script = document.createElement('script');
    script.id = scriptId;
    script.type = 'text/javascript';
    script.text = githubButtonsScript;
    document.body.appendChild(script);
}

onMounted(() => {
    mountGithubButtons();
});
</script>

<style lang="scss" scoped>
@use './Header.scss';
</style>

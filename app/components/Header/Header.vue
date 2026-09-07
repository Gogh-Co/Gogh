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

            <button
                type="button"
                class="gogh-header__toggle"
                :aria-expanded="mobileNavOpen"
                aria-controls="gogh-header-nav"
                :aria-label="mobileNavOpen ? 'Close menu' : 'Open menu'"
                @click="mobileNavOpen = !mobileNavOpen"
            >
                <svg v-if="!mobileNavOpen" xmlns="http://www.w3.org/2000/svg" width="22" height="22" viewBox="0 0 24 24"><path fill="currentColor" d="M3 6h18v2H3zm0 5h18v2H3zm0 5h18v2H3z"/></svg>
                <svg v-else xmlns="http://www.w3.org/2000/svg" width="22" height="22" viewBox="0 0 24 24"><path fill="currentColor" d="M18.3 5.71L12 12l6.3 6.29l-1.41 1.42L10.59 13.4L4.29 19.71L2.88 18.3L9.17 12L2.88 5.71L4.29 4.29l6.3 6.3l6.29-6.3z"/></svg>
            </button>

            <nav id="gogh-header-nav" class="gogh-header__nav" :class="{ 'is-open': mobileNavOpen }" aria-label="Primary">
                <NuxtLink to="/" class="gogh-header__nav-link" @click="mobileNavOpen = false">
                    Home
                </NuxtLink>
                <NuxtLink to="/generator" class="gogh-header__nav-link" @click="mobileNavOpen = false">
                    Generator
                </NuxtLink>
                <NuxtLink to="/wcsg" class="gogh-header__nav-link" @click="mobileNavOpen = false">
                    WCSG
                </NuxtLink>
                <NuxtLink to="/stats" class="gogh-header__nav-link" @click="mobileNavOpen = false">
                    Stats
                </NuxtLink>
                <NuxtLink to="/wallpapers" class="gogh-header__nav-link" @click="mobileNavOpen = false">
                    Wallpapers
                </NuxtLink>
                <NuxtLink to="/terminals" class="gogh-header__nav-link" @click="mobileNavOpen = false">
                    Terminals
                </NuxtLink>

                <button
                    type="button"
                    class="gogh-header__theme-toggle"
                    :aria-label="pageTheme === 'dark' ? 'Switch page to light background' : 'Switch page to dark background'"
                    :aria-pressed="pageTheme === 'dark'"
                    @click="togglePageTheme"
                >
                    <svg v-if="pageTheme === 'dark'" xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24"><path fill="currentColor" d="M12 7a5 5 0 1 0 0 10a5 5 0 0 0 0-10m0-5a1 1 0 0 1 1 1v1a1 1 0 1 1-2 0V3a1 1 0 0 1 1-1m0 18a1 1 0 0 1 1 1v1a1 1 0 1 1-2 0v-1a1 1 0 0 1 1-1M3 11a1 1 0 0 1 0 2H2a1 1 0 1 1 0-2zm19 0a1 1 0 0 1 0 2h-1a1 1 0 1 1 0-2zM4.929 4.929a1 1 0 0 1 1.414 0l.707.707A1 1 0 1 1 5.636 7.05l-.707-.707a1 1 0 0 1 0-1.414m12.02 12.02a1 1 0 0 1 1.415 0l.707.707a1 1 0 1 1-1.414 1.414l-.707-.707a1 1 0 0 1 0-1.414M19.071 4.929a1 1 0 0 1 0 1.414l-.707.707a1 1 0 1 1-1.414-1.414l.707-.707a1 1 0 0 1 1.414 0M7.05 16.95a1 1 0 0 1 0 1.414l-.707.707a1 1 0 0 1-1.414-1.414l.707-.707a1 1 0 0 1 1.414 0"/></svg>
                    <svg v-else xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24"><path fill="currentColor" d="M9.822 2.238a.75.75 0 0 1 .174.808a7.5 7.5 0 0 0 9.958 9.958a.75.75 0 0 1 .982.982A9.001 9.001 0 0 1 12 21a9 9 0 0 1-2.834-17.539a.75.75 0 0 1 .656.777"/></svg>
                    <span class="gogh-header__theme-toggle-label">{{ pageTheme === 'dark' ? 'Light background' : 'Dark background' }}</span>
                </button>

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

const mobileNavOpen = ref(false);
const { pageTheme, togglePageTheme, initPageTheme } = usePageTheme();

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
    initPageTheme();
});
</script>

<style lang="scss" scoped>
@use './Header.scss';
</style>

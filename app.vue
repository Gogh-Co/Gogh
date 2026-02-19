<template>
    <NuxtLayout>
        <NuxtPage />
    </NuxtLayout>
</template>

<script setup>
const { app } = useRuntimeConfig();

function withBase(path) {
    const base = (app?.baseURL || '/').replace(/\/?$/, '/');
    const cleanPath = String(path || '').replace(/^\/+/, '');
    return `${base}${cleanPath}`;
}

useHead({
    link: [
        { rel: 'apple-touch-icon', sizes: '57x57', href: withBase('favicons/apple-icon-57x57.png') },
        { rel: 'apple-touch-icon', sizes: '60x60', href: withBase('favicons/apple-icon-60x60.png') },
        { rel: 'apple-touch-icon', sizes: '72x72', href: withBase('favicons/apple-icon-72x72.png') },
        { rel: 'apple-touch-icon', sizes: '76x76', href: withBase('favicons/apple-icon-76x76.png') },
        { rel: 'apple-touch-icon', sizes: '114x114', href: withBase('favicons/apple-icon-114x114.png') },
        { rel: 'apple-touch-icon', sizes: '120x120', href: withBase('favicons/apple-icon-120x120.png') },
        { rel: 'apple-touch-icon', sizes: '144x144', href: withBase('favicons/apple-icon-144x144.png') },
        { rel: 'apple-touch-icon', sizes: '152x152', href: withBase('favicons/apple-icon-152x152.png') },
        { rel: 'apple-touch-icon', sizes: '180x180', href: withBase('favicons/apple-icon-180x180.png') },
        { rel: 'icon', type: 'image/png', sizes: '192x192', href: withBase('favicons/android-icon-192x192.png') },
        { rel: 'icon', type: 'image/png', sizes: '32x32', href: withBase('favicons/favicon-32x32.png') },
        { rel: 'icon', type: 'image/png', sizes: '96x96', href: withBase('favicons/favicon-96x96.png') },
        { rel: 'icon', type: 'image/png', sizes: '16x16', href: withBase('favicons/favicon-16x16.png') },
        { rel: 'manifest', href: withBase('favicons/manifest.json') },
    ],
    meta: [
        { name: 'msapplication-TileColor', content: '#ffffff' },
        { name: 'msapplication-TileImage', content: withBase('favicons/ms-icon-144x144.png') },
        { name: 'theme-color', content: '#ffffff' },
    ],
});
</script>

<style lang="scss">
@use '@/app.scss';
</style>

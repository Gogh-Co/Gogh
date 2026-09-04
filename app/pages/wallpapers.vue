<template>
    <Header />

    <div class="gogh-content wallpapers-page">
        <div class="container-fluid wallpapers-container">
            <div class="row">
                <div class="col-12">
                    <h2>Wallpapers</h2>
                </div>
            </div>

            <div class="row wallpapers-grid">
                <div v-for="(wallpaper, index) in wallpapers" :key="wallpaper.file" class="col-12 col-md-6 col-lg-4">
                    <div class="wallpaper-card">
                        <img
                            :src="`/wallpapers/thumbs/${wallpaper.thumb}`"
                            :alt="`${wallpaper.name} wallpaper preview`"
                            loading="lazy"
                            class="wallpaper-card__image"
                            role="button"
                            tabindex="0"
                            :aria-label="`View ${wallpaper.name} wallpaper fullscreen`"
                            @click="openWallpaperLightbox(index)"
                            @keydown.enter.prevent="openWallpaperLightbox(index)"
                            @keydown.space.prevent="openWallpaperLightbox(index)"
                        >

                        <div class="wallpaper-card__footer">
                            <div class="wallpaper-card__meta">
                                <span class="wallpaper-card__name">{{ wallpaper.name }}</span>
                                <span class="wallpaper-card__info">{{ wallpaper.width }}&times;{{ wallpaper.height }} &middot; {{ wallpaper.sizeLabel }}</span>
                            </div>

                            <a
                                class="btn wallpaper-card__download"
                                :href="`/wallpapers/${wallpaper.file}`"
                                :download="wallpaper.file"
                                :aria-label="`Download ${wallpaper.name} wallpaper`"
                                @click.stop
                            >
                                Download
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div
            v-if="lightboxWallpaper"
            class="wallpaper-lightbox"
            @click.self="closeWallpaperLightbox"
        >
            <button
                type="button"
                class="wallpaper-lightbox__close"
                aria-label="Close wallpaper preview"
                @click="closeWallpaperLightbox"
            >
                &times;
            </button>

            <button
                type="button"
                class="wallpaper-lightbox__arrow wallpaper-lightbox__arrow--prev"
                aria-label="Previous wallpaper"
                @click="showPrevWallpaper"
            >
                &#8249;
            </button>

            <button
                type="button"
                class="wallpaper-lightbox__arrow wallpaper-lightbox__arrow--next"
                aria-label="Next wallpaper"
                @click="showNextWallpaper"
            >
                &#8250;
            </button>

            <div class="wallpaper-lightbox__content" :key="lightboxWallpaper.file">
                <img
                    :src="`/wallpapers/${lightboxWallpaper.file}`"
                    :alt="`${lightboxWallpaper.name} wallpaper`"
                    class="wallpaper-lightbox__image"
                >

                <div class="wallpaper-lightbox__footer">
                    <div class="wallpaper-card__meta">
                        <span class="wallpaper-card__name">{{ lightboxWallpaper.name }}</span>
                        <span class="wallpaper-card__info">{{ lightboxWallpaper.width }}&times;{{ lightboxWallpaper.height }} &middot; {{ lightboxWallpaper.sizeLabel }}</span>
                    </div>

                    <a
                        class="btn wallpaper-card__download"
                        :href="`/wallpapers/${lightboxWallpaper.file}`"
                        :download="lightboxWallpaper.file"
                        :aria-label="`Download ${lightboxWallpaper.name} wallpaper`"
                    >
                        Download
                    </a>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup>
import Header from '@/components/Header/Header.vue';

const title = 'Wallpapers - Gogh';
const description = "Download desktop wallpapers featuring Gogh's terminal color palette.";

useSeoMeta({
    title,
    description,
    ogTitle: title,
    ogDescription: description,
    ogUrl: canonicalUrl('/wallpapers/'),
    twitterTitle: title,
    twitterDescription: description,
});
useHead({
    link: [{ rel: 'canonical', href: canonicalUrl('/wallpapers/') }],
});

const wallpapers = [
    { file: 'backdrop.png', name: 'Backdrop', width: 1672, height: 941, sizeLabel: '1.1 MB' },
    { file: 'gogh-03.png', name: 'Gogh 03', width: 1672, height: 941, sizeLabel: '1.4 MB' },
    { file: 'gogh-08.png', name: 'Gogh 08', width: 1672, height: 941, sizeLabel: '1.3 MB' },
    { file: 'gogh-09.png', name: 'Gogh 09', width: 1672, height: 941, sizeLabel: '1.6 MB' },
    { file: 'gogh-10.png', name: 'Gogh 10', width: 1672, height: 941, sizeLabel: '1.8 MB' },
    { file: 'gogh-11.png', name: 'Gogh 11', width: 1672, height: 941, sizeLabel: '2.2 MB' },
    { file: 'gogh-12.png', name: 'Gogh 12', width: 1672, height: 941, sizeLabel: '2.4 MB' },
    { file: 'gogh-14.png', name: 'Gogh 14', width: 1672, height: 941, sizeLabel: '1.2 MB' },
    { file: 'gogh-15.png', name: 'Gogh 15', width: 1672, height: 941, sizeLabel: '1.4 MB' },
].map((wallpaper) => ({
    ...wallpaper,
    thumb: wallpaper.file.replace('.png', '.jpg'),
}));

const lightboxIndex = ref(null);
const lightboxWallpaper = computed(() => (
    lightboxIndex.value !== null ? wallpapers[lightboxIndex.value] : null
));

function openWallpaperLightbox(index) {
    lightboxIndex.value = index;
}

function closeWallpaperLightbox() {
    lightboxIndex.value = null;
}

function showPrevWallpaper() {
    if (lightboxIndex.value === null) {
        return;
    }
    lightboxIndex.value = (lightboxIndex.value - 1 + wallpapers.length) % wallpapers.length;
}

function showNextWallpaper() {
    if (lightboxIndex.value === null) {
        return;
    }
    lightboxIndex.value = (lightboxIndex.value + 1) % wallpapers.length;
}

function onWindowKeydown(event) {
    if (lightboxIndex.value === null) {
        return;
    }

    if (event.key === 'Escape') {
        closeWallpaperLightbox();
    } else if (event.key === 'ArrowLeft') {
        showPrevWallpaper();
    } else if (event.key === 'ArrowRight') {
        showNextWallpaper();
    }
}

onMounted(() => {
    window.addEventListener('keydown', onWindowKeydown);
});

onUnmounted(() => {
    window.removeEventListener('keydown', onWindowKeydown);
});
</script>

<style lang="scss" scoped>
@use '@/pages/wallpapers.scss';
</style>

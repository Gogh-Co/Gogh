<template>
    <Header />

    <div class="gogh-content terminals-page">
        <div class="container-fluid terminals-container">
            <div class="row">
                <div class="col-12">
                    <h2>Terminal Support</h2>
                </div>
            </div>

            <div class="row terminals-grid">
                <div v-for="terminal in terminals" :key="terminal.name" class="col-12 col-md-6 col-lg-4">
                    <div class="terminal-card">
                        <div class="terminal-card__frame">
                            <img
                                v-if="terminal.image"
                                :src="`/terminals/${terminal.image}`"
                                :alt="`${terminal.name} website screenshot`"
                                loading="lazy"
                                class="terminal-card__image"
                            >
                            <div v-else class="terminal-card__placeholder" aria-hidden="true">
                                <span>{{ terminal.name }}</span>
                            </div>
                        </div>

                        <div class="terminal-card__footer">
                            <span class="terminal-card__name">{{ terminal.name }}</span>

                            <a
                                class="btn terminal-card__link"
                                :href="terminal.url"
                                target="_blank"
                                rel="noopener noreferrer"
                                :aria-label="`Visit ${terminal.name} website`"
                            >
                                Visit site
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup>
import Header from '@/components/Header/Header.vue';

const title = 'Terminal Support - Gogh';
const description = 'Terminal emulators supported by Gogh, with links to each project.';

useSeoMeta({
    title,
    description,
    ogTitle: title,
    ogDescription: description,
    ogUrl: canonicalUrl('/terminals/'),
    twitterTitle: title,
    twitterDescription: description,
});
useHead({
    link: [{ rel: 'canonical', href: canonicalUrl('/terminals/') }],
});

const terminals = [
    { name: 'Alacritty', url: 'https://github.com/alacritty/alacritty', image: 'alacritty.jpg' },
    { name: 'Cygwin', url: 'https://www.cygwin.com/', image: 'cygwin.jpg' },
    { name: 'Foot', url: 'https://codeberg.org/dnkl/foot', image: null },
    { name: 'Ghostty', url: 'https://ghostty.org/', image: 'ghostty.jpg' },
    { name: 'Gnome Terminal', url: 'https://help.gnome.org/users/gnome-terminal/stable/', image: 'gnome-terminal.jpg' },
    { name: 'Guake', url: 'http://guake-project.org/', image: null },
    { name: 'iTerm2', url: 'https://iterm2.com/', image: 'iterm2.jpg' },
    { name: 'Kitty', url: 'https://sw.kovidgoyal.net/kitty/', image: 'kitty.jpg' },
    { name: 'Konsole', url: 'https://konsole.kde.org/', image: 'konsole.jpg' },
    { name: 'Mate Terminal', url: 'https://github.com/mate-desktop/mate-terminal', image: 'mate-terminal.jpg' },
    { name: 'Mintty', url: 'https://mintty.github.io/', image: 'mintty.jpg' },
    { name: 'Pantheon / Elementary', url: 'https://github.com/elementary/terminal', image: 'pantheon.jpg' },
    { name: 'st+', url: 'https://github.com/vishnu350/st', image: 'st-plus.jpg' },
    { name: 'Tilix', url: 'https://gnunn1.github.io/tilix-web/', image: 'tilix.jpg' },
    { name: 'Wezterm', url: 'https://wezterm.org/', image: 'wezterm.jpg' },
    { name: 'XFCE4 Terminal', url: 'https://docs.xfce.org/apps/terminal/start', image: 'xfce4-terminal.jpg' },
    { name: 'Terminator', url: 'https://github.com/gnome-terminator/terminator', image: 'terminator.jpg' },
];
</script>

<style lang="scss" scoped>
@use '@/pages/terminals.scss';
</style>

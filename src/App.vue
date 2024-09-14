<script setup>
import { ref, onMounted } from 'vue';
import chroma from 'chroma-js';
import Terminal from './components/Terminal/Terminal.vue';

const getUrl = 'https://raw.githubusercontent.com/Gogh-Co/Gogh/master/data/themes.json';

const themes = ref([]);
const filter = ref('all');
const themeBackgrounds = ref(null);
const selected = ref(null);

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

async function fetchData() {
    const data = await fetch(getUrl);
    const themesData = await data.json();
    return themesData;
}

function setFilter(f) {
    filter.value = '';
    setTimeout(() => {
        filter.value = f;
    }, 100);
}

function setBackground() {
    filter.value = 'background';
}

function getBackgrounds() {
    const bgs = themes.value.map(e => e.background);
    const bgsLowerCase = bgs.map(ele => ele.toLowerCase());
    const bgsUnique = [...new Set(bgsLowerCase)];
    const bgsRGB = bgsUnique.map(ele => chroma(ele).rgb());
    const bgsSort = sortColors(bgsRGB);
    const bgsHEX = bgsSort.map(ele => chroma(ele).hex());
    themeBackgrounds.value = bgsHEX.reverse();
    selected.value = 'background';
    filter.value = 'background';
}

function resetMenuSelected() {
    selected.value = '';
}

onMounted(async () => {
    const themesData = await fetchData();
    themes.value = themesData;
    themes.value.forEach((v) => {
        v.category = lightOrDark(v.background);
    });
});
</script>

<template>

    <a href=https://github.com/Gogh-Co/Gogh>
        <img
            loading="lazy"
            width="149"
            height="149"
            style="position: absolute; top: 0; right: 0; border: 0;"
            src="https://github.blog/wp-content/uploads/2008/12/forkme_right_darkblue_121621.png"
            class="attachment-full size-full"
            alt="Fork me on GitHub"
            data-recalc-dims="1">
    </a>

    <header class="gogh-header">
        <h1>
            <span> Gogh </span>
            <img src="https://raw.githubusercontent.com/Gogh-Co/Gogh/master/images/gogh/Gogh-logo-dark.png" alt="">
        </h1>
    </header>


    <div class="gogh-content">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h2>
                        Color Scheme for Gnome Terminal, Pantheon Terminal, Tilix, and XFCE4&nbsp;Terminal
                    </h2>

                    <p>
                        Color Schemes For Ubuntu, Linux Mint, Elementary OS and all distributions that use Gnome Terminal, Pantheon Terminal, Tilix, or XFCE4 Terminal; initially inspired by Elementary OS Luna. Also works on iTerm for macOS.
                    </p>

                    <div class=github-int>
                        <a class="github-button"
                            href=https://github.com/Gogh-Co/Gogh
                            data-color-scheme="no-preference: dark; light: light; dark: dark;"
                            data-size=large
                            aria-label="Star ntkme/github-buttons on GitHub">
                            View
                        </a>
                        <!-- Place this tag where you want the button to render. -->
                        <a class="github-button"
                            href="https://github.com/Gogh-Co/Gogh"
                            data-color-scheme="no-preference: dark; light: light; dark: dark;"
                            data-icon="octicon-star"
                            data-size="large"
                            data-show-count="true"
                            aria-label="Star ntkme/github-buttons on GitHub">
                            Star
                        </a>
                    </div>

                    <h3> Install </h3>
                    <p>
                        Just copy and paste One line command.
                    </p>

                    <div class="code-wrap">
                        <h4>Linux <span>(wget)</span></h4>
                        <div class="code-holder">
                            <pre><code class="language-bash" id="code-linux">bash -c  "$(wget -qO- https://git.io/vQgMr)" </code></pre>
                            <span class="btn-copy" data-clipboard-target="#code-linux">
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" fill="#000" width="48" height="48"> <path d="M27.4,14.7l-6.1-6.1C21,8.2,20.5,8,20,8h-8c-1.1,0-2,0.9-2,2v18c0,1.1,0.9,2,2,2h14c1.1,0,2-0.9,2-2V16.1C28,15.6,27.8,15.1,27.4,14.7z M20,10l5.9,6H20V10z M12,28V10h6v6c0,1.1,0.9,2,2,2h6l0,10H12z"/> <path d="M6,18H4V4c0-1.1,0.9-2,2-2h14v2H6V18z"/> <rect width="32" height="32" fill="none"/> </svg>
                            </span>
                        </div>
                    </div>

                    <div class="code-wrap">
                        <h4>Mac <span>(curl)</span></h4>
                        <div class="code-holder">
                            <pre><code class="language-bash" id="code-mac">bash -c  "$(curl -sLo- https://git.io/vQgMr)" </code></pre>
                            <span class="btn-copy" data-clipboard-target="#code-mac">
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" fill="#000" width="48" height="48"> <path d="M27.4,14.7l-6.1-6.1C21,8.2,20.5,8,20,8h-8c-1.1,0-2,0.9-2,2v18c0,1.1,0.9,2,2,2h14c1.1,0,2-0.9,2-2V16.1C28,15.6,27.8,15.1,27.4,14.7z M20,10l5.9,6H20V10z M12,28V10h6v6c0,1.1,0.9,2,2,2h6l0,10H12z"/> <path d="M6,18H4V4c0-1.1,0.9-2,2-2h14v2H6V18z"/> <rect width="32" height="32" fill="none"/> </svg>
                            </span>
                        </div>
                    </div>

                </div>
            </div>
        </div>

        <div class="gogh-content">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="filters">
                        <button class="btn js-btn--filter" :class="{ active: filter === 'all' }"
                            @click="setFilter('all'); resetMenuSelected()">
                            All
                        </button>
                        <button class="btn js-btn--filter" :class="{ active: filter === 'light' }"
                            @click="setFilter('light'); resetMenuSelected()">
                            Light Themes
                        </button>
                        <button class="btn js-btn--filter" :class="{ active: filter === 'dark' }"
                            @click="setFilter('dark'); resetMenuSelected()">
                            Dark Themes
                        </button>
                        <button class="btn js-btn--filter-bg" :class="{ active: selected === 'background' }"
                            @click="getBackgrounds()">
                            by Background
                        </button>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <div class="filter-background js-filter-background" style="display: none;">
                        <template v-for="item in themeBackgrounds">
                            <button class="btn btn--filter-bg" :class="{ active: filter === item.toLowerCase() }"
                                :style="'background-color:' + item" @click="setFilter(item)">
                                <span>{{ item.toLowerCase() }}</span>
                            </button>
                        </template>
                    </div>
                </div>
            </div>
        </div>

        <div class="container-fluid">
            <div class="row justify-content-center">
                <template v-for="theme in themes">
                    <div class="col-md-6 col-lg-6 col-xl-4"
                        v-show="filter === theme.category || filter === 'all' || filter === 'background' || filter === theme.background.toLowerCase()">
                        <Terminal :theme="theme"></Terminal>
                    </div>
                </template>
            </div>
        </div>
    </div>
    </div>

</template>


<style lang="scss" scoped>
@import './sass/main.scss';
</style>

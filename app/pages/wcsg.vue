<template>

    <Header />

    <div class="gogh-content wcsg-page">
        <div class="container-fluid">
            <div class="row">
                <div class="col">
                    <div class="wcsg-title-row d-flex align-items-center justify-content-center">
                        <h2>
                            WCAG Color Data
                        </h2>
                        <a
                            class="wcsg-download-link"
                            href="https://raw.githubusercontent.com/Gogh-Co/Gogh/master/data/wcag-min.json"
                            target="_blank"
                            rel="noopener noreferrer"
                        >
                            download data
                        </a>
                    </div>

                    <div class="filters">
                        <ButtonFilter :active="filter === 'all'" @click="setFilter('all'); resetMenuSelected()">
                            All
                        </ButtonFilter>

                        <ButtonFilter :active="filter === 'light'" @click="setFilter('light'); resetMenuSelected()">
                            Light Themes
                        </ButtonFilter>

                        <ButtonFilter :active="filter === 'dark'" @click="setFilter('dark'); resetMenuSelected()">
                            Dark Themes
                        </ButtonFilter>

                        <ButtonFilter :active="selected === 'background' || filter === 'background'"
                            @click="setBackground(); toggleFilterBackground();">
                            by Background
                        </ButtonFilter>

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
                                <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" viewBox="0 0 24 24"><path fill="currentColor" d="m19.6 21l-6.3-6.3q-.75.6-1.725.95T9.5 16q-2.725 0-4.612-1.888T3 9.5t1.888-4.612T9.5 3t4.613 1.888T16 9.5q0 1.1-.35 2.075T14.7 13.3l6.3 6.3zM9.5 14q1.875 0 3.188-1.312T14 9.5t-1.312-3.187T9.5 5T6.313 6.313T5 9.5t1.313 3.188T9.5 14"/></svg>
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

                    <Transition name="bg-filter">
                        <div v-if="filterBackgroundVisible" class="filter-background-wrap">
                            <div class="filter-background">
                                <template v-for="item in themeBackgrounds" :key="item">
                                    <button class="btn btn--filter-bg" :class="{ active: filter === item.toLowerCase() }"
                                        :style="'background-color:' + item"
                                        @click="setFilter(item); toggleFilterBackground(false);">
                                        <span>{{ item.toLowerCase() }}</span>
                                    </button>
                                </template>
                            </div>
                        </div>
                    </Transition>

                    <div v-if="loading">
                        Loading data...
                    </div>

                    <div v-else-if="errorMessage" class="wcsg-error">
                        {{ errorMessage }}
                    </div>
                </div>
            </div>

            <div class="row">
                <template v-for="(theme, index) in filteredThemes" :key="index">
                        <div class="col-sm-6 col-md-6 col-lg-4 col-xl-3">
                            <WcsgThemeCard :theme="theme" />
                        </div>
                </template>
            </div>
        </div>
    </div>
</template>

<script setup>
import { ref, computed, onMounted } from 'vue'
import axios from 'axios'
import Header from '@/components/Header/Header.vue'
import WcsgThemeCard from '@/components/Wcsg/WcsgThemeCard.vue'
import ButtonFilter from '@/components/Buttons/ButtonFilter.vue'

const data = ref([])
const loading = ref(true)
const errorMessage = ref('')
const filter = ref('all')
const selected = ref('')
const filterBackgroundVisible = ref(false)
const searchQuery = ref('')

function normalizeHexColor(value) {
    if (typeof value !== 'string') {
        return ''
    }

    const trimmed = value.trim()
    const withHash = trimmed.startsWith('#') ? trimmed : `#${trimmed}`

    if (/^#[0-9a-fA-F]{6}$/.test(withHash)) {
        return withHash.toUpperCase()
    }

    if (/^#[0-9a-fA-F]{3}$/.test(withHash)) {
        const [r, g, b] = withHash.slice(1)
        return `#${r}${r}${g}${g}${b}${b}`.toUpperCase()
    }

    return ''
}

function channelToLinear(channelValue) {
    const normalized = channelValue / 255
    if (normalized <= 0.04045) {
        return normalized / 12.92
    }

    return ((normalized + 0.055) / 1.055) ** 2.4
}

function relativeLuminance(hex) {
    const normalized = normalizeHexColor(hex)
    if (!normalized) {
        return 0
    }

    const rgbHex = normalized.slice(1)
    const red = Number.parseInt(rgbHex.slice(0, 2), 16)
    const green = Number.parseInt(rgbHex.slice(2, 4), 16)
    const blue = Number.parseInt(rgbHex.slice(4, 6), 16)

    const linearRed = channelToLinear(red)
    const linearGreen = channelToLinear(green)
    const linearBlue = channelToLinear(blue)

    return (0.2126 * linearRed) + (0.7152 * linearGreen) + (0.0722 * linearBlue)
}

function classifyBackground(backgroundHex) {
    return relativeLuminance(backgroundHex) >= 0.5 ? 'light' : 'dark'
}

function setFilter(value) {
    filter.value = value.toLowerCase()
}

function setBackground() {
    selected.value = 'background'
    filter.value = 'background'
}

function resetMenuSelected() {
    selected.value = ''
    filterBackgroundVisible.value = false
}

function toggleFilterBackground(force) {
    if (typeof force === 'boolean') {
        filterBackgroundVisible.value = force
        return
    }

    filterBackgroundVisible.value = !filterBackgroundVisible.value
}

function clearSearchQuery() {
    searchQuery.value = ''
}

const themedData = computed(() => data.value.map((theme) => ({
    ...theme,
    background: normalizeHexColor(theme.background),
    category: classifyBackground(theme.background),
})))

const themeBackgrounds = computed(() => {
    const values = themedData.value
        .map((theme) => normalizeHexColor(theme.background))
        .filter(Boolean)

    return [...new Set(values)]
})

const filteredThemes = computed(() => {
    const query = searchQuery.value.trim().toLowerCase()

    return themedData.value.filter((theme) => {
        if (query && !(theme.theme || '').toLowerCase().includes(query)) {
            return false
        }

        if (filter.value === 'all' || filter.value === 'background') {
            return true
        }

        if (filter.value === 'light' || filter.value === 'dark') {
            return theme.category === filter.value
        }

        return (theme.background || '').toLowerCase() === filter.value
    })
})

onMounted(() => {
  axios
    .get(
      'https://raw.githubusercontent.com/Gogh-Co/Gogh/refs/heads/master/data/wcag-min.json'
    )
    .then((response) => {
      data.value = response.data
    })
    .catch((error) => {
            console.error('Error fetching data:', error)
            errorMessage.value = 'Could not fetch WCAG data.'
    })
        .finally(() => {
            loading.value = false
        })
})

</script>

<style lang="scss" scoped>
@use '@/pages/wcsg.scss';
</style>

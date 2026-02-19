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

                    <div v-if="data.length === 0">
                        Loading data...
                    </div>
                </div>
            </div>

            <div class="row">
                <template v-for="(theme, index) in data" :key="index">
                        <div class="col-sm-6 col-md-6 col-lg-4 col-xl-3">
                            <WcsgThemeCard :theme="theme" />
                        </div>
                </template>
            </div>
        </div>
    </div>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import axios from 'axios'
import Header from '@/components/Header/Header.vue'
import WcsgThemeCard from '@/components/Wcsg/WcsgThemeCard.vue'

const data = ref([])

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
    })
})

</script>

<style lang="scss" scoped>
@use '@/pages/wcsg.scss';
</style>

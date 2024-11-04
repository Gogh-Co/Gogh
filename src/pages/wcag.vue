<script setup>
import { ref, onMounted } from 'vue'
import axios from 'axios'

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

function sortedScoreCounts(scoreCounts) {
  const order = ['AAA', 'AA', 'AA Large', 'Fail']
  return order.map((label) => ({
    label,
    count: scoreCounts[label] || 0
  }))
}

function formatColorName(colorName) {
  if (colorName.startsWith('color_')) {
    return `Color ${colorName.split('_')[1].replace(/^0/, '')}`
  }
  return colorName
}
</script>

<template>

  <header class="gogh-header">
    <h1>
      <span> Gogh </span>
      <img src="https://raw.githubusercontent.com/Gogh-Co/Gogh/master/images/gogh/Gogh-logo-dark.png" alt="">
    </h1>
  </header>

  <div class="container">
    <div class="row">
      <div class="col">
        <h2>WCAG Color Data</h2>
        <div v-if="data.length === 0">Loading data...</div>
      </div>
    </div>
    <div class="row">
      <template v-for="(theme, index) in data" :key="index">
        <div class="col-sm-6 col-xl-4">
          <div class="theme-wrap">
            <div class="theme-header">{{ theme.theme }}</div>
            <div class="theme-background">
              Background: {{ theme.background }}
              <div class="dot" :style="{ backgroundColor: theme.background }"></div>
            </div>

            <table>
              <thead>
                <tr>
                  <th>Color</th>
                  <th>Hex</th>
                  <th>Score</th>
                  <th>Ratio</th>
                  <th></th>
                </tr>
              </thead>
              <tbody>
                <tr v-for="(result, idx) in theme.results" :key="idx">
                  <td class="data-color">{{ formatColorName(result.Color) }}</td>
                  <td class="data-hex">{{ result.Hex }}</td>
                  <td class="data-score" :class="{ 'fail': result.Score === 'Fail' }">
                    {{ result.Score }}
                  </td>
                  <td class="data-ratio">{{ result.Ratio }}</td>
                  <td :style="{ backgroundColor: theme.background }">
                    <div class="dot" :style="{ backgroundColor: result.Hex }"></div>
                  </td>
                </tr>
              </tbody>
            </table>

            <div class="score-counts">
              <h3>
                Score Counts:
              </h3>
              <ul>
                  <li v-for="(score, index) in sortedScoreCounts(theme.scoreCounts)" :key="index">
                    {{ score.label }}: <span>{{ score.count }}</span>
                  </li>
              </ul>
            </div>
          </div>
        </div>
      </template>
    </div>
  </div>
</template>

<style lang="scss" scoped>
@use '@/pages/wcsg.scss';
</style>

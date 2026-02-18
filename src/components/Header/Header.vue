<script setup>
const props = defineProps({
  backgroundColor: {
    type: String,
    default: '#121f2a',
  },
});
</script>

<template>
  <header class="gogh-header" :style="{ '--gogh-header-background': props.backgroundColor }">
    <h1>
      <span> Gogh </span>
      <img src="https://raw.githubusercontent.com/Gogh-Co/Gogh/master/.images/gogh/Gogh-logo-dark.png" alt="">
    </h1>
  </header>
</template>

<style lang="scss" scoped>
@use './Header.scss';
</style>

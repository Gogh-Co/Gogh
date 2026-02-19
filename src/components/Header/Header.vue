<template>
  <header class="gogh-header" :style="{ '--gogh-header-background': props.backgroundColor }">
    <NuxtLink to="/" class="gogh-header__link" aria-label="Gogh">
      <h1>
        <span> Gogh </span>
        <img src="https://raw.githubusercontent.com/Gogh-Co/Gogh/master/.images/gogh/Gogh-logo-dark.png" alt="">
      </h1>
    </NuxtLink>
  </header>
</template>

<script setup>
const props = defineProps({
  backgroundColor: {
    type: String,
    default: '#121f2a',
  },
});
</script>

<style lang="scss" scoped>
@use './Header.scss';
</style>

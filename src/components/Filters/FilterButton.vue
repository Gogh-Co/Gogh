<script setup>
const props = defineProps({
  active: {
    type: Boolean,
    default: false,
  },
  extraClass: {
    type: String,
    default: '',
  },
});

const emit = defineEmits(['click']);

function onClick(event) {
  emit('click', event);
}
</script>

<template>
  <button
    class="btn filter-btn"
    :class="[{ active }, extraClass]"
    type="button"
    @click="onClick"
  >
    <slot />
  </button>
</template>

<style lang="scss" scoped>
@use './FilterButton.scss';
</style>

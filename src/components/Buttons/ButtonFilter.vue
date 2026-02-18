<template>
    <Button
        class="filter-btn"
        :active="active"
        :extra-class="extraClass"
        @click="onClick"
    >
        <slot />
    </Button>
</template>

<script setup>
import Button from './Button.vue';

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

<style lang="scss" scoped>
@use './ButtonFilter.scss';
</style>

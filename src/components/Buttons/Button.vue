<template>
    <a
        class="btn gogh-btn"
        :class="[{ active }, extraClass]"
        :href="href || undefined"
    >
        <slot />
    </a>
</template>

<script setup>
defineProps({
    active: {
        type: Boolean,
        default: false,
    },
    extraClass: {
        type: String,
        default: '',
    },
    href: {
        type: String,
        default: '',
    },
});
</script>

<style lang="scss" scoped>
@use './Button.scss';
</style>

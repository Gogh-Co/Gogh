<template>
    <NuxtLink
        v-if="to"
        class="btn"
        :class="[{ active }, extraClass]"
        :to="to"
    >
        <slot />
    </NuxtLink>

    <a
        v-else
        class="btn"
        :class="[{ active }, extraClass]"
        :href="href || undefined"
        target="_blank"
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
    to: {
        type: [String, Object],
        default: '',
    },
});
</script>

<style lang="scss" scoped>
@use './Button.scss';
</style>

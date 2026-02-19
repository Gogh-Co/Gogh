<template>
    <NuxtLink
        v-if="to"
        class="btn"
        :class="[{ active }, extraClass]"
        :to="to"
        :target="target || undefined"
    >
        <slot />
    </NuxtLink>

    <a
        v-else-if="href"
        class="btn"
        :class="[{ active }, extraClass]"
        :href="href"
        :target="target || undefined"
        :rel="target === '_blank' ? 'noopener noreferrer' : undefined"
    >
        <slot />
    </a>

    <button
        v-else
        type="button"
        class="btn"
        :class="[{ active }, extraClass]"
    >
        <slot />
    </button>
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
    target: {
        type: String,
        default: '',
    },
});
</script>

<style lang="scss" scoped>
@use './Button.scss';
</style>

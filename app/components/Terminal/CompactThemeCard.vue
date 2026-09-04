<template>
    <div
        class="compact-card"
        :style="{ backgroundColor: theme.background, color: theme.foreground }"
    >
        <div class="compact-card__header">
            <span class="compact-card__name">{{ displayName }}</span>
        </div>

        <div class="compact-card__swatches">
            <span
                v-for="key in normalColorKeys"
                :key="key"
                class="compact-card__swatch"
                :style="{ backgroundColor: theme[key] }"
            ></span>
        </div>
        <div class="compact-card__swatches">
            <span
                v-for="key in brightColorKeys"
                :key="key"
                class="compact-card__swatch"
                :style="{ backgroundColor: theme[key] }"
            ></span>
        </div>
    </div>
</template>

<script setup>
const normalColorKeys = Array.from({ length: 8 }, (_, index) => `color_${String(index + 1).padStart(2, '0')}`);
const brightColorKeys = Array.from({ length: 8 }, (_, index) => `color_${String(index + 9).padStart(2, '0')}`);

const props = defineProps({
    theme: {
        type: Object,
        required: true,
    },
});

const displayName = computed(() => (props.theme?.name || props.theme?.theme || '').toString());
</script>

<style lang="scss" scoped>
@use './CompactThemeCard.scss';
</style>

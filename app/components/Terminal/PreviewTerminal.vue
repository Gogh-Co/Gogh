<template>
    <div class="preview-terminal">
        <Terminal :theme="theme" />
    </div>
</template>

<script setup>
import Terminal from './Terminal.vue';

defineProps({
    theme: {
        type: Object,
        required: true,
    },
});
</script>

<style lang="scss" scoped>
.preview-terminal {
    :deep(.terminal .body .body__bar--bottom) {
        margin-bottom: 30px;
    }
}
</style>

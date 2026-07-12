<template>
    <Terminal
        :theme="theme"
        :enable-color-picker="true"
        :flat="flat"
        @update-color="emit('update-color', $event)"
    />
</template>

<script setup>
import Terminal from './Terminal.vue';

defineProps({
    theme: {
        type: Object,
        required: true,
    },
    flat: {
        type: Boolean,
        default: false,
    },
});

const emit = defineEmits(['update-color']);
</script>

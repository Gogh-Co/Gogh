<template>
    <input
        v-if="editing"
        ref="inputElement"
        v-model="draft"
        class="terminal-color-value__input"
        type="text"
        inputmode="text"
        maxlength="7"
        spellcheck="false"
        :aria-label="`Edit ${colorKey}`"
        @input="normalizeDraft"
        @blur="commit"
        @keydown.enter.prevent="commit"
        @keydown.esc.prevent="cancel"
    >
    <button
        v-else
        type="button"
        class="terminal-color-value__button"
        :aria-label="`Edit ${colorKey}, current value ${value}`"
        @click="startEditing"
    >
        {{ value }}
    </button>
</template>

<script setup>
const props = defineProps({
    colorKey: {
        type: String,
        required: true,
    },
    value: {
        type: String,
        required: true,
    },
});

const emit = defineEmits(['update']);
const editing = ref(false);
const draft = ref(props.value.toUpperCase());
const inputElement = ref(null);

async function startEditing() {
    draft.value = props.value.toUpperCase();
    editing.value = true;
    await nextTick();
    inputElement.value?.focus();
    inputElement.value?.select();
}

function normalizeDraft(event) {
    const hexadecimal = event.target.value
        .replace('#', '')
        .toUpperCase()
        .replace(/[^0-9A-F]/g, '')
        .slice(0, 6);
    draft.value = `#${hexadecimal}`;
}

function commit() {
    if (/^#[0-9A-F]{6}$/.test(draft.value)) {
        emit('update', draft.value);
    }
    editing.value = false;
}

function cancel() {
    draft.value = props.value.toUpperCase();
    editing.value = false;
}
</script>

<style lang="scss" scoped>
.terminal-color-value__button,
.terminal-color-value__input {
    display: inline-block;
    width: 7.4ch;
    min-width: 7.4ch;
    margin: 0;
    padding: 0;
    border: 0;
    border-radius: 0;
    outline: none;
    background: transparent;
    color: inherit;
    font: inherit;
    letter-spacing: inherit;
    line-height: inherit;
    text-align: left;
    text-transform: uppercase;
}

.terminal-color-value__button {
    cursor: text;
}

</style>

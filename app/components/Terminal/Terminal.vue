<template>
    <div
        class="terminal"
        :class="{
            'terminal--picker': enableColorPicker,
            'terminal--flat': flat,
        }"
        :style="{ '--terminal-picker-border': getContrastingBorderColor(theme.background) }"
    >
        <div class="bar">
            <div class="bar__title">
                {{ theme.name }}
            </div>
            <div class="bar__btns">
                <span class="btn--terminal btn--min"></span>
                <span class="btn--terminal btn--max"></span>
                <span class="btn--terminal btn--close"></span>
            </div>
        </div>
        <div
            class="body"
            :style="{
                backgroundColor: theme.background,
            }"
        >
            <div class="body__bar body__bar--top">
                <color-picker
                    v-if="enableColorPicker"
                    :model-value="theme.color_01"
                    with-hex-input
                    :with-colors-history="6"
                    storage-key="terminal-color-01"
                    @update:modelValue="emitColor('color_01', $event)"
                    v-slot="{ show }"
                >
                    <span :style="'background-color: ' + theme.color_01" @click.stop.prevent="show($event)"></span>
                </color-picker>
                <span v-else :style="'background-color: ' + theme.color_01"></span>

                <color-picker
                    v-if="enableColorPicker"
                    :model-value="theme.color_02"
                    with-hex-input
                    :with-colors-history="6"
                    storage-key="terminal-color-02"
                    @update:modelValue="emitColor('color_02', $event)"
                    v-slot="{ show }"
                >
                    <span :style="'background-color: ' + theme.color_02" @click.stop.prevent="show($event)"></span>
                </color-picker>
                <span v-else :style="'background-color: ' + theme.color_02"></span>

                <color-picker
                    v-if="enableColorPicker"
                    :model-value="theme.color_03"
                    with-hex-input
                    :with-colors-history="6"
                    storage-key="terminal-color-03"
                    @update:modelValue="emitColor('color_03', $event)"
                    v-slot="{ show }"
                >
                    <span :style="'background-color: ' + theme.color_03" @click.stop.prevent="show($event)"></span>
                </color-picker>
                <span v-else :style="'background-color: ' + theme.color_03"></span>

                <color-picker
                    v-if="enableColorPicker"
                    :model-value="theme.color_04"
                    with-hex-input
                    :with-colors-history="6"
                    storage-key="terminal-color-04"
                    @update:modelValue="emitColor('color_04', $event)"
                    v-slot="{ show }"
                >
                    <span :style="'background-color: ' + theme.color_04" @click.stop.prevent="show($event)"></span>
                </color-picker>
                <span v-else :style="'background-color: ' + theme.color_04"></span>

                <color-picker
                    v-if="enableColorPicker"
                    :model-value="theme.color_05"
                    with-hex-input
                    :with-colors-history="6"
                    storage-key="terminal-color-05"
                    @update:modelValue="emitColor('color_05', $event)"
                    v-slot="{ show }"
                >
                    <span :style="'background-color: ' + theme.color_05" @click.stop.prevent="show($event)"></span>
                </color-picker>
                <span v-else :style="'background-color: ' + theme.color_05"></span>

                <color-picker
                    v-if="enableColorPicker"
                    :model-value="theme.color_06"
                    with-hex-input
                    :with-colors-history="6"
                    storage-key="terminal-color-06"
                    @update:modelValue="emitColor('color_06', $event)"
                    v-slot="{ show }"
                >
                    <span :style="'background-color: ' + theme.color_06" @click.stop.prevent="show($event)"></span>
                </color-picker>
                <span v-else :style="'background-color: ' + theme.color_06"></span>

                <color-picker
                    v-if="enableColorPicker"
                    :model-value="theme.color_07"
                    with-hex-input
                    :with-colors-history="6"
                    storage-key="terminal-color-07"
                    @update:modelValue="emitColor('color_07', $event)"
                    v-slot="{ show }"
                >
                    <span :style="'background-color: ' + theme.color_07" @click.stop.prevent="show($event)"></span>
                </color-picker>
                <span v-else :style="'background-color: ' + theme.color_07"></span>

                <color-picker
                    v-if="enableColorPicker"
                    :model-value="theme.color_08"
                    with-hex-input
                    :with-colors-history="6"
                    storage-key="terminal-color-08"
                    @update:modelValue="emitColor('color_08', $event)"
                    v-slot="{ show }"
                >
                    <span :style="'background-color: ' + theme.color_08" @click.stop.prevent="show($event)"></span>
                </color-picker>
                <span v-else :style="'background-color: ' + theme.color_08"></span>
            </div>
            <div class="body__bar body__bar--bottom">
                <color-picker
                    v-if="enableColorPicker"
                    :model-value="theme.color_09"
                    with-hex-input
                    :with-colors-history="6"
                    storage-key="terminal-color-09"
                    @update:modelValue="emitColor('color_09', $event)"
                    v-slot="{ show }"
                >
                    <span :style="'background-color: ' + theme.color_09" @click.stop.prevent="show($event)"></span>
                </color-picker>
                <span v-else :style="'background-color: ' + theme.color_09"></span>

                <color-picker
                    v-if="enableColorPicker"
                    :model-value="theme.color_10"
                    with-hex-input
                    :with-colors-history="6"
                    storage-key="terminal-color-10"
                    @update:modelValue="emitColor('color_10', $event)"
                    v-slot="{ show }"
                >
                    <span :style="'background-color: ' + theme.color_10" @click.stop.prevent="show($event)"></span>
                </color-picker>
                <span v-else :style="'background-color: ' + theme.color_10"></span>

                <color-picker
                    v-if="enableColorPicker"
                    :model-value="theme.color_11"
                    with-hex-input
                    :with-colors-history="6"
                    storage-key="terminal-color-11"
                    @update:modelValue="emitColor('color_11', $event)"
                    v-slot="{ show }"
                >
                    <span :style="'background-color: ' + theme.color_11" @click.stop.prevent="show($event)"></span>
                </color-picker>
                <span v-else :style="'background-color: ' + theme.color_11"></span>

                <color-picker
                    v-if="enableColorPicker"
                    :model-value="theme.color_12"
                    with-hex-input
                    :with-colors-history="6"
                    storage-key="terminal-color-12"
                    @update:modelValue="emitColor('color_12', $event)"
                    v-slot="{ show }"
                >
                    <span :style="'background-color: ' + theme.color_12" @click.stop.prevent="show($event)"></span>
                </color-picker>
                <span v-else :style="'background-color: ' + theme.color_12"></span>

                <color-picker
                    v-if="enableColorPicker"
                    :model-value="theme.color_13"
                    with-hex-input
                    :with-colors-history="6"
                    storage-key="terminal-color-13"
                    @update:modelValue="emitColor('color_13', $event)"
                    v-slot="{ show }"
                >
                    <span :style="'background-color: ' + theme.color_13" @click.stop.prevent="show($event)"></span>
                </color-picker>
                <span v-else :style="'background-color: ' + theme.color_13"></span>

                <color-picker
                    v-if="enableColorPicker"
                    :model-value="theme.color_14"
                    with-hex-input
                    :with-colors-history="6"
                    storage-key="terminal-color-14"
                    @update:modelValue="emitColor('color_14', $event)"
                    v-slot="{ show }"
                >
                    <span :style="'background-color: ' + theme.color_14" @click.stop.prevent="show($event)"></span>
                </color-picker>
                <span v-else :style="'background-color: ' + theme.color_14"></span>

                <color-picker
                    v-if="enableColorPicker"
                    :model-value="theme.color_15"
                    with-hex-input
                    :with-colors-history="6"
                    storage-key="terminal-color-15"
                    @update:modelValue="emitColor('color_15', $event)"
                    v-slot="{ show }"
                >
                    <span :style="'background-color: ' + theme.color_15" @click.stop.prevent="show($event)"></span>
                </color-picker>
                <span v-else :style="'background-color: ' + theme.color_15"></span>

                <color-picker
                    v-if="enableColorPicker"
                    :model-value="theme.color_16"
                    with-hex-input
                    :with-colors-history="6"
                    storage-key="terminal-color-16"
                    @update:modelValue="emitColor('color_16', $event)"
                    v-slot="{ show }"
                >
                    <span :style="'background-color: ' + theme.color_16" @click.stop.prevent="show($event)"></span>
                </color-picker>
                <span v-else :style="'background-color: ' + theme.color_16"></span>
            </div>

            <div v-if="enableColorPicker" class="body__bar body__bar--theme">
                <color-picker
                    :model-value="theme.background"
                    with-hex-input
                    :with-colors-history="6"
                    storage-key="terminal-background"
                    @update:modelValue="emitColor('background', $event)"
                    v-slot="{ show }"
                >
                    <button
                        type="button"
                        aria-label="Pick background color"
                        data-tooltip="background"
                        :style="'background-color: ' + theme.background"
                        @click.stop.prevent="show($event)"
                    ></button>
                </color-picker>

                <color-picker
                    :model-value="theme.foreground"
                    with-hex-input
                    :with-colors-history="6"
                    storage-key="terminal-foreground"
                    @update:modelValue="emitColor('foreground', $event)"
                    v-slot="{ show }"
                >
                    <button
                        type="button"
                        aria-label="Pick foreground color"
                        data-tooltip="foreground"
                        :style="'background-color: ' + theme.foreground"
                        @click.stop.prevent="show($event)"
                    ></button>
                </color-picker>

                <color-picker
                    :model-value="theme.cursor"
                    with-hex-input
                    :with-colors-history="6"
                    storage-key="terminal-cursor"
                    @update:modelValue="emitColor('cursor', $event)"
                    v-slot="{ show }"
                >
                    <button
                        type="button"
                        aria-label="Pick cursor color"
                        data-tooltip="cursor"
                        :style="'background-color: ' + theme.cursor"
                        @click.stop.prevent="show($event)"
                    ></button>
                </color-picker>
            </div>

            <div class="row">
                <div
                    v-for="column in colorKeyColumns"
                    :key="column[0]"
                    class="col-sm-6 col-md-12 col-lg-6 col-xl-6"
                >
                    <div class="body__txt">
                        <p
                            v-for="key in column"
                            :key="key"
                            :style="'color: ' + theme[key]"
                        >
                            <span>
                                AaBbMmYyZz -
                                <TerminalColorValue
                                    v-if="enableColorPicker"
                                    :color-key="key"
                                    :value="theme[key]"
                                    @update="emitColor(key, $event)"
                                />
                                <template v-else>{{ theme[key] }}</template>
                            </span>
                        </p>
                    </div>
                </div>
            </div>


            <div class="cmd">
                <span class="cmd__ini" :style="'color: ' + theme.foreground">$ </span>
                <span class="cmd__sudo" :style="'color: ' + theme.color_02">sudo </span>
                <span class="cmd__apt" :style="'color: ' + theme.color_03">apt </span>
                <span class="cmd__install" :style="'color: ' + theme.foreground">install </span>
                <span class="cmd__linux" :style="'color: ' + theme.foreground">linux </span>
                <span class="cmd__cursor" :style="'color: ' + theme.cursor">|</span>
            </div>

        </div>
    </div>
</template>

<script setup>
import TerminalColorValue from './TerminalColorValue.vue';

const colorKeys = Array.from({ length: 16 }, (_, index) =>
    `color_${String(index + 1).padStart(2, '0')}`
);
const colorKeyColumns = [colorKeys.slice(0, 8), colorKeys.slice(8)];

const props = defineProps({
    theme: {
        type: Object,
        required: true,
        default: () => ({
            name: 'Default Theme',
            background: '#000000',
            foreground: '#FFFFFF',
            cursor: '#FFFFFF',
            color_01: '#FF0000',
            color_02: '#00FF00',
            color_03: '#0000FF',
            color_04: '#FFFF00',
            color_05: '#FF00FF',
            color_06: '#00FFFF',
            color_07: '#FFFFFF',
            color_08: '#000000',
            color_09: '#FF0000',
            color_10: '#00FF00',
            color_11: '#0000FF',
            color_12: '#FFFF00',
            color_13: '#FF00FF',
            color_14: '#00FFFF',
            color_15: '#FFFFFF',
            color_16: '#000000',
        }),
    },
    enableColorPicker: {
        type: Boolean,
        default: false,
    },
    flat: {
        type: Boolean,
        default: false,
    },
});

const emit = defineEmits(['update-color']);

function getContrastingBorderColor(background) {
    const hex = String(background || '').replace('#', '');
    if (!/^[0-9a-fA-F]{6}$/.test(hex)) {
        return '#ffffff';
    }

    const red = Number.parseInt(hex.slice(0, 2), 16);
    const green = Number.parseInt(hex.slice(2, 4), 16);
    const blue = Number.parseInt(hex.slice(4, 6), 16);
    const perceivedBrightness = (red * 299 + green * 587 + blue * 114) / 1000;

    return perceivedBrightness < 150 ? '#ffffff' : '#0d1926';
}

function emitColor(key, value) {
    emit('update-color', { key, value });
}
</script>

<style lang="scss" scoped>
@use './Terminal.scss';
</style>

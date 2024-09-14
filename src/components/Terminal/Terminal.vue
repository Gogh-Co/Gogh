<script setup>
import { defineProps } from 'vue';

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
});
</script>

<template>
    <div class="terminal">
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
        <div class="body" :style="'background-color: ' + theme.background">
            <div class="body__bar body__bar--top">
                <span :style="'background-color: ' + theme.color_01"></span>
                <span :style="'background-color: ' + theme.color_02"></span>
                <span :style="'background-color: ' + theme.color_03"></span>
                <span :style="'background-color: ' + theme.color_04"></span>
                <span :style="'background-color: ' + theme.color_05"></span>
                <span :style="'background-color: ' + theme.color_06"></span>
                <span :style="'background-color: ' + theme.color_07"></span>
                <span :style="'background-color: ' + theme.color_08"></span>
            </div>
            <div class="body__bar body__bar--bottom">
                <span :style="'background-color: ' + theme.color_09"></span>
                <span :style="'background-color: ' + theme.color_10"></span>
                <span :style="'background-color: ' + theme.color_11"></span>
                <span :style="'background-color: ' + theme.color_12"></span>
                <span :style="'background-color: ' + theme.color_13"></span>
                <span :style="'background-color: ' + theme.color_14"></span>
                <span :style="'background-color: ' + theme.color_15"></span>
                <span :style="'background-color: ' + theme.color_16"></span>
            </div>

            <div class="row">
                <div class="col-sm-6 col-md-12 col-lg-6 col-xl-6">
                    <div class="body__txt">
                        <p :style="'color: ' + theme.color_01">
                            <span> AaBbMmYyZz - {{ theme.color_01 }}</span>
                        </p>
                        <p :style="'color: ' + theme.color_02">
                            <span> AaBbMmYyZz - {{ theme.color_02 }}</span>
                        </p>
                        <p :style="'color: ' + theme.color_03">
                            <span> AaBbMmYyZz - {{ theme.color_03 }}</span>
                        </p>
                        <p :style="'color: ' + theme.color_04">
                            <span> AaBbMmYyZz - {{ theme.color_04 }}</span>
                        </p>
                        <p :style="'color: ' + theme.color_05">
                            <span> AaBbMmYyZz - {{ theme.color_05 }}</span>
                        </p>
                        <p :style="'color: ' + theme.color_06">
                            <span> AaBbMmYyZz - {{ theme.color_06 }}</span>
                        </p>
                        <p :style="'color: ' + theme.color_07">
                            <span> AaBbMmYyZz - {{ theme.color_07 }}</span>
                        </p>
                        <p :style="'color: ' + theme.color_08">
                            <span> AaBbMmYyZz - {{ theme.color_08 }}</span>
                        </p>
                    </div>
                </div>
                <div class="col-sm-6 col-md-12 col-lg-6 col-xl-6">
                    <div class="body__txt">
                        <p :style="'color: ' + theme.color_09">
                            <span> AaBbMmYyZz - {{ theme.color_09 }}</span>
                        </p>
                        <p :style="'color: ' + theme.color_10">
                            <span> AaBbMmYyZz - {{ theme.color_10 }}</span>
                        </p>
                        <p :style="'color: ' + theme.color_11">
                            <span> AaBbMmYyZz - {{ theme.color_11 }}</span>
                        </p>
                        <p :style="'color: ' + theme.color_12">
                            <span> AaBbMmYyZz - {{ theme.color_12 }}</span>
                        </p>
                        <p :style="'color: ' + theme.color_13">
                            <span> AaBbMmYyZz - {{ theme.color_13 }}</span>
                        </p>
                        <p :style="'color: ' + theme.color_14">
                            <span> AaBbMmYyZz - {{ theme.color_14 }}</span>
                        </p>
                        <p :style="'color: ' + theme.color_15">
                            <span> AaBbMmYyZz - {{ theme.color_15 }}</span>
                        </p>
                        <p :style="'color: ' + theme.color_16">
                            <span> AaBbMmYyZz - {{ theme.color_16 }}</span>
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

<style lang="scss">
@import './Terminal.scss';
</style>

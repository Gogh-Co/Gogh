<template>
    <div class="theme-wrap">
        <div class="theme-header">{{ theme.theme }}</div>
        <div class="theme-background">
            Background: {{ theme.background }}
            <div class="dot" :style="{ backgroundColor: theme.background }"></div>
        </div>

        <table>
            <thead>
                <tr>
                    <th>Color</th>
                    <th>Hex</th>
                    <th>Score</th>
                    <th>Ratio</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="(result, idx) in theme.results" :key="idx">
                    <td class="data-color">{{ formatColorName(result.Color) }}</td>
                    <td class="data-hex">{{ result.Hex }}</td>
                    <td class="data-score" :class="{ fail: result.Score === 'Fail' }">
                        {{ result.Score }}
                    </td>
                    <td class="data-ratio">{{ result.Ratio }}</td>
                    <td :style="{ backgroundColor: theme.background }">
                        <div class="dot" :style="{ backgroundColor: result.Hex }"></div>
                    </td>
                </tr>
            </tbody>
        </table>

        <div class="score-counts">
            <h3>Score Counts:</h3>
            <ul>
                <li v-for="(score, index) in sortedScoreCounts(theme.scoreCounts)" :key="index">
                    {{ score.label }}: <span>{{ score.count }}</span>
                </li>
            </ul>
        </div>
    </div>
</template>

<script setup>
defineProps({
    theme: {
        type: Object,
        required: true,
    },
});

function sortedScoreCounts(scoreCounts) {
    const order = ['AAA', 'AA', 'AA Large', 'Fail'];

    return order.map((label) => ({
        label,
        count: scoreCounts?.[label] || 0,
    }));
}

function formatColorName(colorName) {
    if (colorName.startsWith('color_')) {
        return `Color ${colorName.split('_')[1].replace(/^0/, '')}`;
    }

    return colorName;
}
</script>

<style lang="scss" scoped>
@use './WcsgThemeCard.scss';
</style>

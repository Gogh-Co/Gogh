import { ratio, score } from 'npm:wcag-color';
import fs from 'node:fs';

async function generateReport() {
  const themes = JSON.parse(fs.readFileSync('data/themes.json', 'utf-8'));

  const report = themes.map(theme => {
    const background = theme.background;
    const foreground = theme.foreground;
    const cursor = theme.cursor;

    const colorResults = [];

    // Add foreground to the table
    const fgContrastRatio = ratio(foreground, background);
    const fgResultScore = score(foreground, background);
    colorResults.push({
      Color: 'Foreground',
      Hex: foreground,
      Score: fgResultScore,
      Ratio: fgContrastRatio.toFixed(1)
    });

    for (let key in theme) {
      if (key.startsWith('color_')) {
        const color = theme[key];
        const contrastRatio = ratio(color, background);
        const resultScore = score(color, background);
        colorResults.push({
          Color: key,
          Hex: color,
          Score: resultScore,
          Ratio: contrastRatio.toFixed(1)
        });
      }
    }

    // Add cursor to the table
    const cursorContrastRatio = ratio(cursor, background);
    const cursorResultScore = score(cursor, background);
    colorResults.push({
      Color: 'cursor',
      Hex: cursor,
      Score: cursorResultScore,
      Ratio: cursorContrastRatio.toFixed(1)
    });

    // Count the scores
    const scoreCounts = colorResults.reduce((acc, result) => {
      acc[result.Score] = (acc[result.Score] || 0) + 1;
      return acc;
    }, {});

    return {
      theme: theme.name,
      background: background, // Add background color reference
      results: colorResults,
      scoreCounts: scoreCounts
    };
  });

  fs.writeFileSync('data/wcag.json', JSON.stringify(report, null, 2));
  fs.writeFileSync('data/wcag-min.json', JSON.stringify(report));
  console.log('Report generated: wcag.json and wcag-min.json');
}

generateReport();
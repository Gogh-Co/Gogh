/* global $, Vue, axios, chroma, vm */
/* eslint no-undef: "error", semi: 2 */

/**
 * ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
 * ·······  Copy
 * ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
 */

new ClipboardJS('.btn-copy');

/**
 * ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
 * ·······  Functions
 * ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
 */

function lightOrDark (color) {
  // Variables for red, green, blue values
  var r,
    g,
    b,
    hsp;
  // Check the format of the color, HEX or RGB?
  if (color.match(/^rgb/)) {
    // If RGB --> store the red, green, blue values in separate variables
    color = color.match(/^rgba?\((\d+),\s*(\d+),\s*(\d+)(?:,\s*(\d+(?:\.\d+)?))?\)$/);
    r = color[1];
    g = color[2];
    b = color[3];
  } else {
    // If hex --> Convert it to RGB: http://gist.github.com/983661
    color = +('0x' + color.slice(1).replace(color.length < 5 && /./g, '$&$&'));
    r = color >> 16;
    g = color >> 8 & 255;
    b = color & 255;
  }
  // HSP (Highly Sensitive Poo) equation from http://alienryderflex.com/hsp.html
  hsp = Math.sqrt(0.299 * (r * r) + 0.587 * (g * g) + 0.114 * (b * b));
  // Using the HSP value, determine whether the color is light or dark
  if (hsp > 127.5) {
    return 'light';
  } else {
    return 'dark';
  }
}

/**
 * ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
 * ·······  Color Functions
 * ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
 */

function colorDistance (color1, color2) {
  // This is actually the square of the distance but
  // this doesn't matter for sorting.
  var result = 0;
  for (var i = 0; i < color1.length; i++)
    result += (color1[i] - color2[i]) * (color1[i] - color2[i]);
  return result;
}

function sortColors (colors) {
  // Calculate distance between each color
  var distances = [];
  for (var i = 0; i < colors.length; i++) {
    distances[i] = [];
    for (var j = 0; j < i; j++)
      distances.push([
        colors[i],
        colors[j],
        colorDistance(colors[i], colors[j]),
      ]);
  }
  distances.sort(function (a, b) {
    return a[2] - b[2];
  });

  // Put each color into separate cluster initially
  var colorToCluster = {};
  for (var y = 0; y < colors.length; y++)
    colorToCluster[colors[y]] = [colors[y]];

  // Merge clusters, starting with lowest distances
  var lastCluster;
  for (var e = 0; e < distances.length; e++) {
    var color1 = distances[e][0];
    var color2 = distances[e][1];
    var cluster1 = colorToCluster[color1];
    var cluster2 = colorToCluster[color2];
    if (!cluster1 || !cluster2 || cluster1 == cluster2)
      continue;

    // Make sure color1 is at the end of its cluster and
    // color2 at the beginning.
    if (color1 !== cluster1[cluster1.length - 1])
      cluster1.reverse();
    if (color2 !== cluster2[0])
      cluster2.reverse();

    // Merge cluster2 into cluster1
    cluster1.push.apply(cluster1, cluster2);
    delete colorToCluster[color1];
    delete colorToCluster[color2];
    colorToCluster[cluster1[0]] = cluster1;
    colorToCluster[cluster1[cluster1.length - 1]] = cluster1;
    lastCluster = cluster1;
  }

  // By now all colors should be in one cluster
  return lastCluster;
}

/**
 * ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
 * ·······  Vue App
 * ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
 */

var $getUrl = 'https://raw.githubusercontent.com/Mayccoll/Gogh/master/data/themes.json';

const $app = {
  data () {
    return {
      themes: [],
      filter: 'all',
      themeBackgrounds: null,
      selected: null
    };
  },

  created () {
    axios.get($getUrl).then((response) => {
      this.themes = response.data.themes;
      this.themes.forEach((v) => {
        v.category = lightOrDark(v.background);
      });
    });
  },

  methods: {
    setFilter (f) {
      this.filter = '';
      setTimeout(() => {
        this.filter = f;
      }, 100);
    },

    setBackground () {
      this.filter = 'background';
    },

    getBackgrounds () {
      const $bgs = this.themes.map(e => e.background);
      const $bgsLowerCase = $bgs.map((ele) => ele.toLowerCase());
      const $bgsUnique = [...new Set($bgsLowerCase)];
      const $bgsRGB = $bgsUnique.map((ele) => chroma(ele).rgb());
      const $bgsSort = sortColors($bgsRGB);
      const $bgsHEX = $bgsSort.map(ele => chroma(ele).hex());
      this.themeBackgrounds = $bgsHEX.reverse();
      this.selected = 'background';
      this.filter = 'background';
    },

    resetMenuSelected () {
      this.selected = '';
    }
  }
};

Vue.createApp($app).mount('#js-vue-app');

/**
 * ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
 * ·······  Menu
 * ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
*/

$('.js-btn--filter-bg').on('click', function () {
  $('.js-filter-background').slideToggle();
});

$('.js-btn--filter').on('click', function () {
  $('.js-filter-background').slideUp(400);
});

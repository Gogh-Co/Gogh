/* global $, fetch, console */
/* eslint no-undef: "error", semi: 2 */
/* jshint esversion: 6 */

// var $themes = './data/themes.json';

Vue.component('component', {
  template: '#wrap_themes',
  props: {
    data: {
      type: null
    }
  }
});

var $app = new Vue({
  el: '#js-vue-app',
  data: function () {
    return {
      theme_data: $themes
    }
  }
});

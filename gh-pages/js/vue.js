/* global $, fetch, console, Vue, $users */
/* eslint no-undef: "error", semi: 2 */
/* jshint esversion: 6 */

Vue.component('terminal', {
  template: '#template-terminal',
  props: {
    data: {
      type: Object
    }
  }
});

var $app = new Vue({
  el: '#js-vue-app',
  data: function () {
    return {
      schemes_data: $schemes
    }
  }
});

import {
    createApp
} from 'vue'
import App from '../App.vue'

new ClipboardJS('.btn-copy')

createApp(App).mount('#app')

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

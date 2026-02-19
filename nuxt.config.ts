// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  app: {
    baseURL: '/Gogh/',
    head: {
      charset: 'utf-8',
      viewport: 'width=device-width, initial-scale=1',
      title: 'Gogh - Color Schemes',
      meta: [
        { 'http-equiv': 'X-UA-Compatible', content: 'IE=edge' },
        { name: 'description', content: 'Color Schemes for Terminals' },
        { name: 'author', content: 'Miguel D. Quintero' },
      ],
      link: [
        { rel: 'author', href: 'humans.txt' },
        { rel: 'icon', type: 'image/png', sizes: '16x16', href: 'favicons/favicon.png' },
        { rel: 'icon', href: 'favicons/favicon.ico' },
      ],
    },
  },
  srcDir: 'src/',
  css: [
    '@fontsource/roboto/300.css',
    '@fontsource/roboto/400.css',
    '@fontsource/roboto/700.css',
    '@fontsource/roboto/900.css',
    'bootstrap/dist/css/bootstrap.min.css',
    'prismjs/themes/prism.css',
  ],
  vite: {
    css: {
      preprocessorOptions: {
        scss: {
          silenceDeprecations: ["legacy-js-api"]
        }
      }
    }
  },
  modules: [
    '@morev/vue-transitions/nuxt',
    'nuxt-color-picker',
  ],
  plugins: [
    '~/vendors/prism.client',
  ],

  devtools: { enabled: true },
  compatibilityDate: '2024-04-03'
})

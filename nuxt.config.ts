// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  app: {
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
        { rel: 'preconnect', href: 'https://fonts.gstatic.com' },
        {
          rel: 'stylesheet',
          href: 'https://fonts.googleapis.com/css2?family=Roboto&display=swap',
        },
        {
          rel: 'stylesheet',
          href: 'https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css',
        },
        {
          rel: 'stylesheet',
          href: 'https://cdn.jsdelivr.net/npm/prismjs@1.29.0/themes/prism.css',
        },
      ],
      script: [
        { src: 'https://cdn.jsdelivr.net/npm/prismjs@1.29.0/prism.min.js', body: true },
        { src: 'https://cdn.jsdelivr.net/npm/prismjs@1.29.0/plugins/autoloader/prism-autoloader.min.js', body: true },
        { src: 'ttps://buttons.github.io/buttons.js', body: true },
      ],
    },
  },
  srcDir: 'src/',
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
  ],
  target: 'static',
  router: {
    base: '/Gogh/'
  }
  devtools: { enabled: true },
  compatibilityDate: '2024-04-03'
})

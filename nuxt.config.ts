// https://nuxt.com/docs/api/configuration/nuxt-config
const devPort = Number(import.meta.env.NUXT_PORT || import.meta.env.PORT || 3000)

export default defineNuxtConfig({
  devServer: {
    host: 'localhost',
    port: devPort,
  },
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
  vite: {
    server: {
      hmr: {
        host: 'localhost',
        clientPort: devPort,
        protocol: 'ws',
      },
    },
    css: {
      preprocessorOptions: {
        scss: {
          silenceDeprecations: ["legacy-js-api"]
        }
      }
    }
  },
  modules: [
    'nuxt-color-picker',
  ],
  plugins: [
    '~/vendors/prism.client',
  ],

  devtools: { enabled: true },
  compatibilityDate: '2024-04-03'
})

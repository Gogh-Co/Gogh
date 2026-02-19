import Prism from 'prismjs'
import 'prismjs/components/prism-bash'

export default defineNuxtPlugin((nuxtApp) => {
  nuxtApp.hook('page:finish', () => {
    requestAnimationFrame(() => {
      Prism.highlightAll()
    })
  })
})

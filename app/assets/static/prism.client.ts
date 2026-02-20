import Prism from 'prismjs'
import 'prismjs/components/prism-bash'
import 'prismjs/themes/prism.css'

export default defineNuxtPlugin((nuxtApp) => {
  nuxtApp.hook('page:finish', () => {
    requestAnimationFrame(() => {
      Prism.highlightAll()
    })
  })
})

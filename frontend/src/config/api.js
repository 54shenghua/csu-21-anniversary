import * as api from '../api'

export default {
  install (Vue) {
    Object.defineProperty(Vue.prototype, '$api', { value: api })
  }
}

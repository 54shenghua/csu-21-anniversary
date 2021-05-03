import store from '../store'

export default {
  install (Vue) {
    Object.defineProperty(Vue.prototype, '$store', { value: store })
  }
}

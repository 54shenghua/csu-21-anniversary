import Vue from 'vue'
import App from './App.vue'
import router from './router'
import { DatetimePicker, Popup, Toast, Loading } from 'vant'
import apiConfig from './config/api'
import storeConfig from './config/store'

Vue.config.productionTip = false
Vue.use(DatetimePicker).use(Popup).use(Toast).use(Loading)
Vue.use(apiConfig).use(storeConfig)

new Vue({
  router,
  render: h => h(App)
}).$mount('#app')

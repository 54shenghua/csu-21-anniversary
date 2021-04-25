<template>
  <div id="app">
    <transition :name="`${['forbidden', 'loading', 'home'].includes($route.name) ? '' : 'fade'}`">
      <router-view />
    </transition>
  </div>
</template>

<script>
import { login } from './api'

export default {
  name: 'App',
  mounted () {
    if (process.env.NODE_ENV === 'production') {
      const res = window.location.search.substr(1).match(/(^|&|\?)code=([^&]*)(&|$)/)
      let code = ''
      if (res) {
        code = unescape(res[2])
      }
      if (!code) {
        window.location.href = 'https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx2fdfc27744ffa252&redirect_uri=https%3A%2F%2Fcsu21.54sher.com&response_type=code&scope=snsapi_userinfo#wechat_redirect'
      } else {
        this.$router.replace({ name: 'home', params: { router: true } })
        login(code)
          .then((res) => {
            console.log(res.data)
            this.$store.openid = res.data.data.openid
            this.$store.avatar = res.data.data.avatar
          })
          .catch(() => {})
      }
    } else {
      login('')
        .then((res) => {
          this.$store.openid = res.data.data.openid
          this.$store.avatar = res.data.data.avatar
        })
        .catch(() => {})
    }
  }
}
</script>

<style lang="scss" scoped>
  #app {
    position: absolute;
    top: 0;
    left: 0;
    height: 100%;
    width: 100%;
    overflow: hidden;
    background-image: url('https://csu21-h5.oss-cn-guangzhou.aliyuncs.com/assets/bg2.jpg');
    background-position: center center;
    background-size: cover;
  }

  .fade-enter-active {
    transition: opacity .8s .7s;
  }

  .fade-leave-active {
    transition: opacity .8s;
  }

  .fade-enter, .fade-leave-to {
    opacity: 0;
  }

  .container {
    height: 100%;
    width: 100%;
  }
</style>

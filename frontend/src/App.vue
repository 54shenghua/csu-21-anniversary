<template>
  <div id="app">
    <transition :name="`${['forbidden', 'loading', 'home'].includes($route.name) ? '' : 'slide'}`">
      <router-view />
    </transition>
    <div :class="['bgm', bgmActive ? 'bgm-active' : '']" @click="bgmHdl" />
    <audio ref="bgm" loop autoplay preload="auto">
      <source src="https://csu21-h5.oss-cn-guangzhou.aliyuncs.com/assets/bgm.mp3">
    </audio>
  </div>
</template>

<script>
import { login } from './api'

export default {
  name: 'App',
  data () {
    return {
      bgmActive: true
    }
  },
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
            this.$store.openid = res.data.data.openid
            this.$store.avatar = res.data.data.avatar
          })
          .catch(() => {})
      }
    }
  },
  methods: {
    bgmHdl () {
      this.bgmActive = !this.bgmActive
      if (this.bgmActive) {
        this.$refs.bgm.play()
      } else {
        this.$refs.bgm.pause()
      }
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

    .bgm {
      height: 2rem;
      width: 2rem;
      position: absolute;
      top: 1rem;
      right: 1rem;
      z-index: 999;
      background-image: url('https://csu21-h5.oss-cn-guangzhou.aliyuncs.com/assets/bgm.png');
      background-size: contain;
      background-repeat: no-repeat;
    }
  }

  .bgm-active {
    animation: rotate 2s linear infinite;
  }

  @keyframes rotate {
    from {
      transform: rotate(0);
    }

    to {
      transform: rotate(360deg);
    }
  }

  .fade-enter-active {
    transition: opacity .8s;
  }

  .fade-leave-active {
    transition: opacity .8s;
  }

  .fade-enter, .fade-leave-to {
    opacity: 0;
  }

  .slide-enter-active {
    transition: opacity .8s .7s;
  }

  .slide-leave-active {
    transition: transform .8s;
  }

  .slide-enter {
    opacity: 0;
  }

  .slide-leave-to {
    transform: translateY(-100%);
  }

  .container {
    height: 100%;
    width: 100%;
  }
</style>

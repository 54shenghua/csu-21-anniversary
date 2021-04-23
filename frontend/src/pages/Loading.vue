<template>
  <div class="container">
      <van-loading size="24px" color="#fff" vertical>加载中</van-loading>
  </div>
</template>

<script>
import { imgPreloader } from '../img-preloader'

export default {
  name: 'Loading',
  mounted () {
    (async () => {
      await imgPreloader()
      this.$router.replace({ name: 'home', params: { router: true } })
    })()
  }
}
</script>

<style lang="scss" scoped>
  .container {
    background-image: url('../assets/bg.jpg');
    background-position: bottom center;
    background-size: cover;
    display: flex;
    justify-content: center;
    align-items: center;
  }
</style>

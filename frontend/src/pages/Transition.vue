<template>
  <div class="container">
    <div class="logo" />
    <div class="content-box">
      <div class="text-box">
        <span>岳麓山下，湘江之滨</span>
        <span>我们与中南相遇于此</span>
        <span>那就在这儿</span>
        <span>开启你的拾光之旅吧！</span>
      </div>
      <button @click="next">下一步</button>
    </div>
  </div>
</template>

<script>
export default {
  name: 'Transition',
  methods: {
    next () {
      this.$router.replace({ name: 'profile', params: { router: true } })
    }
  }
}
</script>

<style lang="scss" scoped>
  @import '../styles/global.scss';

  .container {
    background-image: url('../assets/2bg.png');
    background-position: center center;
    background-size: cover;
    position: relative;
    display: flex;
    justify-content: center;
    align-items: center;

    .logo {
      $logo-size: 15vh;
      height: $logo-size;
      width: $logo-size;
      background-image: url('../assets/trans-logo.png');
      background-size: cover;
      position: absolute;
      top: 3%;
    }

    .content-box {
      height: 75%;
      width: 80%;
      background-image: url('../assets/content-box.png');
      background-position: center center;
      background-size: cover;
      margin-top: 15%;
      display: flex;
      justify-content: center;
      align-items: center;
      flex-direction: column;

      .text-box {
        margin-bottom: 15%;
        display: flex;
        justify-content: center;
        align-items: center;
        flex-direction: column;

        span {
          display: block;
          color: $font-color;
          font-family: transition;

          &:nth-child(1), &:nth-child(2) {
            margin-bottom: 1.8rem;
          }

          &:nth-child(3), &:nth-child(4) {
            font-size: 1.4rem;
          }

          &:nth-child(3) {
            margin-bottom: 1.2rem;
          }
        }
      }
    }
  }
</style>

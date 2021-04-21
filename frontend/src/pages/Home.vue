<template>
  <div class="container">
    <div class="logo" />
    <div class="text-box birthday-box">
      <span class="birthday">亲爱的中南，祝你生日快乐！</span>
    </div>
    <div class="text-box title-box">
      <span class="title">拾光中南</span>
      <span class="subtitle">中南大学合并组建21周年</span>
    </div>
    <div class="start-box" @click="start">
      <div class="circle first-circle" />
      <div class="circle second-circle" />
    </div>
  </div>
</template>

<script>
export default {
  name: 'Home',
  methods: {
    start () {
      this.$router.replace({ name: 'transition', params: { router: true } })
    }
  }
}
</script>

<style lang="scss" scoped>
  @import '../styles/global.scss';

  .container {
    background-image: url('../assets/bg.png');
    background-position: bottom center;
    background-size: cover;
    position: relative;

    .logo {
      height: 100%;
      width: 100%;
      background-image: url('../assets/logo.png');
      background-position: top center;
      background-size: cover;
    }

    .text-box {
      position: absolute;
      width: 100%;
      display: flex;
      justify-content: center;
      align-items: center;
      flex-direction: column;
    }

    .birthday-box {
      top: 20%;

      .birthday {
        font-family: subtitle;
        font-size: 4.5vw;
        letter-spacing: 1.1vw;
        color: white;
        margin-left: .6rem;
      }
    }

    .title-box {
      top: 30%;

      .title {
        font-family: title;
        font-size: 22vw;
        color: white;
      }

      .subtitle {
        font-family: subtitle;
        font-size: 5vw;
        letter-spacing: 2.5vw;
        color: white;
      }
    }

    .start-box {
      height: 3rem;
      width: 3rem;
      display: flex;
      justify-content: center;
      align-items: center;
      position: absolute;
      bottom: 31%;
      left: calc(50% - 1.5rem);

      .circle {
        border: 1px solid white;
        border-radius: 50%;
        opacity: 0;
        position: absolute;
        animation: spread 1.5s ease-out infinite;
      }

      .first-circle {
        height: 1.8rem;
        width: 1.8rem;
      }

      .second-circle {
        height: 1.5rem;
        width: 1.5rem;
        animation-delay: .5s;
      }
    }
  }

  @keyframes spread {
    0% {
      opacity: .2;
      transform: scale(1);
    }

    30% {
      opacity: 1;
      transform: scale(1.3);
    }

    100% {
      opacity: 0;
      transform: scale(2);
    }
  }
</style>

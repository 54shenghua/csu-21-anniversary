<template>
  <div class="container">
    <div class="logo fade-slide-down" style="animation-delay: .5s" />
    <div class="text-box birthday-box fade-slide-down" style="animation-delay: .8s">
      <span class="birthday">亲爱的中南，祝你生日快乐！</span>
    </div>
    <div class="text-box title-box fade-slide-down" style="animation-delay: 1.1s">
      <span class="title">拾光中南</span>
      <span class="subtitle">中南大学合并组建21周年</span>
    </div>
    <div class="tip-box fade-slide-down">
      <span>点击开启拾光之旅</span>
      <img src="https://csu21-h5.oss-cn-guangzhou.aliyuncs.com/assets/click.png" class="click" />
    </div>
    <div class="start-box" @click="start">
      <div class="circle first-circle" />
      <div class="circle second-circle" />
    </div>
    <div class="copyright">
      <span>中南小团子青年传媒中心 出品</span>
      <span>升华工作室 提供技术支持</span>
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
    background-image: url('https://csu21-h5.oss-cn-guangzhou.aliyuncs.com/assets/bg.jpg');
    background-position: bottom center;
    background-size: cover;
    position: relative;

    .logo {
      height: 100%;
      width: 100%;
      background-image: url('https://csu21-h5.oss-cn-guangzhou.aliyuncs.com/assets/logo.png');
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

    .tip-box {
      width: 100%;
      display: flex;
      justify-content: center;
      align-items: center;
      flex-direction: column;
      position: absolute;
      bottom: 37%;
      opacity: 0;
      animation: slide-down, fade;
      animation-duration: 1s, .5s;
      animation-delay: 1.1s, 1.1s;
      animation-timing-function: ease-in-out, linear;
      animation-iteration-count: infinite, 1;
      animation-fill-mode: forwards;
      -webkit-animation-fill-mode: forwards;

      span {
        font-size: .7rem;
        color: white;
        font-family: subtitle;
        letter-spacing: 5px;
      }

      .click {
        height: 1.8rem;
        margin-top: .5rem;
      }
    }

    .start-box {
      height: 3rem;
      width: 3rem;
      display: flex;
      justify-content: center;
      align-items: center;
      position: absolute;
      bottom: 28%;
      left: calc(50% - 1.5rem);
      opacity: 0;
      animation: fade .5s 1.1s;
      animation-fill-mode: forwards;
      -webkit-animation-fill-mode: forwards;

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

  .fade-slide-down {
    opacity: 0;
    animation: fade-slide-down 1.3s;
    animation-fill-mode: forwards;
    -webkit-animation-fill-mode: forwards;
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

  @keyframes slide-down {
    from {
      transform: translateY(-10px);
    }

    to {
      transform: translateY(0);
    }
  }
</style>

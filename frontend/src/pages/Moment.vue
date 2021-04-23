<template>
  <div class="container">
    <div class="logo" />
    <div class="content-box">
      <span>拾光中南</span>
      <span>时过境迁</span>
      <span>有些记忆却未曾蒙尘</span>
      <span>与中南的种种</span>
      <span>仿佛都还历历在目</span>
      <div class="content">
        <select-item index="0" type="moments" text="住在升华公寓" :onClick="clickHdl" />
        <select-item index="1" type="moments" text="在校本部参加升旗仪式" :onClick="clickHdl" />
        <select-item index="2" type="moments" text="在图书馆借一本书" :onClick="clickHdl" />
        <select-item index="3" type="moments" text="穿过B、C座时间的廊桥" :onClick="clickHdl" />
        <select-item index="4" type="moments" text="为CUBA“西南王”欢呼喝彩" :onClick="clickHdl" />
        <select-item index="5" type="moments" text="在网红食堂“八食堂”干饭" :onClick="clickHdl" />
        <select-item index="6" type="moments" text="为体侧坚持晨练" :onClick="clickHdl" />
        <select-item index="7" type="moments" text="打卡中南大学校门" :onClick="clickHdl" />
        <select-item index="8" type="moments" text="驻足天鹅湖畔" :onClick="clickHdl" />
        <select-item index="9" type="moments" text="踩着单车去上课" :onClick="clickHdl" />
        <select-item index="10" type="moments" text="在情人坡上晒太阳" :onClick="clickHdl" />
        <select-item index="11" type="moments" text="与火车头合影" :onClick="clickHdl" />
        <select-item index="12" type="moments" text="参加一次新年音乐会" :onClick="clickHdl" />
        <select-item index="13" type="moments" text="难忘的军训" :onClick="clickHdl" />
        <select-item index="14" type="moments" text="寻访和平楼" :onClick="clickHdl" />
        <select-item index="15" type="moments" text="谈一场校园恋爱" :onClick="clickHdl" />
        <select-item index="16" type="moments" text="一起赏中南初雪" :onClick="clickHdl" />
        <select-item index="17" type="moments" text="品尝中南限定月饼" :onClick="clickHdl" />
        <select-item index="18" type="moments" text="难舍湘雅红楼" :onClick="clickHdl" />
        <select-item index="19" type="moments" text="在中南，听讲座" :onClick="clickHdl" />
        <select-item index="20" type="moments" text="毕业典礼，不说再见" :onClick="clickHdl" />
      </div>
      <button @click="submit">下一步</button>
    </div>
    <div class="mountains" />
  </div>
</template>

<script>
import SelectItem from '../components/SelectItem.vue'
// import BScroll from '@better-scroll/core'

export default {
  name: 'moments',
  components: {
    'select-item': SelectItem
  },
  data () {
    return {
      moments: []
    }
  },
  methods: {
    clickHdl (id) {
      // this.moments.push(id)
      console.log(id)
    },
    submit () {
      // localStorage.setItem('moments', this.moments)
      this.$router.replace({ name: 'summary', params: { router: true } })
    }
  }
}
</script>

<style lang="scss" scoped>
  @import '../styles/global.scss';

  .container {
    background-image: url('../assets/bg2.png');
    background-position: bottom center;
    background-size: cover;
    position: relative;
    display: flex;
    justify-content: center;
    align-items: center;

    .logo {
      height: 20%;
      width: 100%;
      background-image: url('../assets/logo.png');
      background-position: top center;
      background-size: cover;
      position: absolute;
      top: 0;
    }

    .content-box {
      height: 100%;
      width: 100%;
      background-image: url('../assets/white-bg.png');
      background-position: top center;
      background-size: cover;
      margin-top: 12.5vh;
      box-sizing: border-box;
      padding: {
        top: 8vh;
        left: 20vw;
        right: 20vw;
      }
      display: flex;
      flex-direction: column;
      align-items: center;

      span {
        display: block;
        text-align: center;
        // font-size: 1.15rem;
        color: $font-color;

        &:first-child {
          font-family: title;
          font-size: 2rem;
        }

        &:not(:first-child) {
          font-family: subtitle;
          font-size: .8rem;
          margin-top: .2rem;
        }
      }

      .content {
        display: flex;
        flex-wrap: wrap;

        div {
          width: 50%;
        }
      }
    }

    .mountains {
      height: 17%;
      width: 100%;
      background-image: url('../assets/mountain.png');
      background-position: bottom center;
      background-size: cover;
      position: absolute;
      bottom: 0;
    }
  }
</style>

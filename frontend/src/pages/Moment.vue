<template>
  <div class="container">
    <div class="logo" />
    <div class="content-box">
      <div class="scroll" ref="scroll">
        <div style="padding-bottom: 7vh;">
          <span>拾光中南</span>
          <span>时过境迁</span>
          <span>有些记忆却未曾蒙尘</span>
          <span>与中南的种种</span>
          <span>仿佛都还历历在目</span>
          <div class="content">
            <select-item index="0" text="住在升华公寓" :onClick="clickHdl" />
            <select-item index="1" text="在校本部参加升旗仪式" :onClick="clickHdl" />
            <select-item index="2" text="在图书馆借一本书" :onClick="clickHdl" />
            <select-item index="3" text="穿过B、C座之间的廊桥" :onClick="clickHdl" />
            <select-item index="4" text='为CUBA"西南王"欢呼喝彩' :onClick="clickHdl" />
            <select-item index="5" text='在网红食堂"八食堂"干饭' :onClick="clickHdl" />
            <select-item index="6" text="为体测坚持晨练" :onClick="clickHdl" />
            <select-item index="7" text="打卡中南大学校门" :onClick="clickHdl" />
            <select-item index="8" text="驻足天鹅湖畔" :onClick="clickHdl" />
            <select-item index="9" text="踩着单车去上课" :onClick="clickHdl" />
            <select-item index="10" text="在情人坡上晒太阳" :onClick="clickHdl" />
            <select-item index="11" text="与火车头合影" :onClick="clickHdl" />
            <select-item index="12" text="参加一次新年音乐会" :onClick="clickHdl" />
            <select-item index="13" text="难忘的军训" :onClick="clickHdl" />
            <select-item index="14" text="寻访和平楼" :onClick="clickHdl" />
            <select-item index="15" text="谈一场校园恋爱" :onClick="clickHdl" />
            <select-item index="16" text="一起赏中南初雪" :onClick="clickHdl" />
            <select-item index="17" text="品尝中南限定月饼" :onClick="clickHdl" />
            <select-item index="18" text="难舍湘雅红楼" :onClick="clickHdl" />
            <select-item index="19" text="在中南，听讲座" :onClick="clickHdl" />
            <select-item index="20" text="毕业典礼，不说再见" :onClick="clickHdl" />
          </div>
          <div class="button-box">
            <button @click="submit">下一步</button>
          </div>
        </div>
      </div>
    </div>
    <div class="mountains" />
  </div>
</template>

<script>
import SelectItem from '../components/MomentSelectItem.vue'
import BScroll from '@better-scroll/core'

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
  mounted () {
    this.$nextTick(() => {
      // eslint-disable-next-line no-unused-vars
      setTimeout(() => {
        this.bs = new BScroll(this.$refs.scroll, {
          scrollY: true,
          click: true
        })
      }, 1000)
    })
  },
  updated () {
    this.bs.refresh()
  },
  methods: {
    clickHdl (id) {
      const exist = this.moments.indexOf(id)
      if (exist === -1) {
        this.moments.push(id)
      } else {
        this.moments.splice(exist, 1)
      }
    },
    submit () {
      if (this.moments.length === 0) {
        this.$toast('请选择一项记忆哦')
        return
      }
      // localStorage.setItem('moments', this.moments)
      this.$store.moments = this.moments
      this.$router.replace({ name: 'summary', params: { router: true } })
    }
  }
}
</script>

<style lang="scss" scoped>
  @import '../styles/global.scss';

  .container {
    background-image: url('https://csu21-h5.oss-cn-guangzhou.aliyuncs.com/assets/bg2.jpg');
    background-position: bottom center;
    background-size: cover;
    position: relative;
    display: flex;
    justify-content: center;
    align-items: center;

    .logo {
      height: 20%;
      width: 100%;
      background-image: url('https://csu21-h5.oss-cn-guangzhou.aliyuncs.com/assets/logo.png');
      background-position: top center;
      background-size: cover;
      position: absolute;
      top: 0;
    }

    .content-box {
      height: 100%;
      width: 100%;
      background-image: url('https://csu21-h5.oss-cn-guangzhou.aliyuncs.com/assets/white-bg.png');
      background-position: top center;
      background-size: cover;
      margin-top: 12.5vh;
      box-sizing: border-box;
      padding: {
        left: 20vw;
        right: 20vw;
      }
      display: flex;
      flex-direction: column;
      align-items: center;
      overflow: hidden;

      .scroll {
        margin-top: 8vh;
        overflow: hidden;
        height: 80%;

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

        .button-box {
          display: flex;
          justify-content: center;
          align-items: center;
          margin-top: 2vh;
        }
      }
    }

    .mountains {
      height: 17%;
      width: 100%;
      background-image: url('https://csu21-h5.oss-cn-guangzhou.aliyuncs.com/assets/mountain.png');
      background-position: bottom center;
      background-size: cover;
      position: absolute;
      bottom: 0;
      pointer-events: none;
    }
  }
</style>

<template>
  <div class="container">
    <div class="logo" />
    <div class="content-box">
      <span>我在中南的那些日子里</span>
      <span>打卡过这些校区</span>
      <div class="content">
        <select-item index="0" text="校本部" :onClick="clickHdl" />
        <select-item index="1" text="新校区" :onClick="clickHdl" />
        <select-item index="2" text="南校区" :onClick="clickHdl" />
        <select-item index="3" text="铁道校区" :onClick="clickHdl" />
        <select-item index="4" text="湘雅校区" :onClick="clickHdl" />
        <select-item index="5" text="湘雅新校区" :onClick="clickHdl" />
      </div>
      <button @click="submit">下一步</button>
    </div>
    <div class="mountains" />
  </div>
</template>

<script>
import SelectItem from '../components/CampusSelectItem.vue'

export default {
  name: 'Campus',
  components: {
    'select-item': SelectItem
  },
  data () {
    return {
      campus: []
    }
  },
  methods: {
    clickHdl (id) {
      this.campus.push(id)
    },
    submit () {
      if (this.campus.length === 0) {
        this.$toast('请选择一个打卡过的校区哦')
        return
      }
      // localStorage.setItem('campus', this.campus)
      this.$store.campus = this.campus
      this.$router.replace({ name: 'moment', params: { router: true } })
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
        top: 10vh;
        left: 20vw;
        right: 20vw;
      }
      display: flex;
      flex-direction: column;
      align-items: center;

      span {
        display: block;
        text-align: center;
        font-family: fangzheng;
        font-size: 1.15rem;
        color: $font-color;
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
      background-image: url('https://csu21-h5.oss-cn-guangzhou.aliyuncs.com/assets/mountain.png');
      background-position: bottom center;
      background-size: cover;
      position: absolute;
      bottom: 0;
      pointer-events: none;
    }
  }
</style>

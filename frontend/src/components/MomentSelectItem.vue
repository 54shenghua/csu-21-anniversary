<template>
  <div class="select-item-container" :style="`width: ${special ? '140px' : '50%'}`" @click="clickHdl">
    <img :src="`https://csu21-h5.oss-cn-guangzhou.aliyuncs.com/assets/moments/${index}.jpg`" :style="`width: ${special ? '65%' : '80%'};opacity:${active ? 1 : 0.5};`" />
    <div class="text-box">
      <div class="text" :style="`background-color:rgb(${active ? '6,76,148' : '237,237,237'});`">
        <span :style="`color:${active ? 'white' : 'rgb(6,76,148)'}`">{{text}}</span>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'SelectItem',
  data () {
    return {
      active: false
    }
  },
  props: {
    index: {
      type: String,
      default: -1
    },
    text: {
      type: String,
      default: 'Text'
    },
    onClick: {
      type: Function,
      default: () => console.log('clicked')
    },
    special: {
      type: Boolean,
      default: false
    }
  },
  methods: {
    clickHdl () {
      this.active = !this.active
      this.onClick(parseInt(this.index))
    }
  }
}
</script>

<style lang="scss" scoped>
  @import '../styles/global.scss';

  .select-item-container {
    box-sizing: border-box;
    display: flex;
    // justify-content: center;
    align-items: center;
    flex-direction: column;
    margin: {
      top: 1.5vh;
      bottom: 1.5vh;
      left: auto;
      right: auto;
    }

    img {
      transition: opacity .5s;
      margin-bottom: 1vh;
    }

    .text-box {
      min-height: 1.2rem;
      width: 100%;
      margin: {
        top: auto;
        bottom: auto;
      }
      display: flex;
      justify-content: center;
      align-items: center;

      .text {
        min-height: 1.3rem;
        width: 90%;
        border: 1px solid $font-color;
        display: flex;
        justify-content: center;
        align-items: center;
        transition: background-color .5s;
        box-sizing: border-box;
        padding: {
          left: 1.5vw;
          right: 1.5vw;
        }

        span {
          font-family: moment;
          font-size: 12px;
          transition: color .5s;
          // transform: scale(.8);
          text-align: center;
        }
      }
    }
  }
</style>

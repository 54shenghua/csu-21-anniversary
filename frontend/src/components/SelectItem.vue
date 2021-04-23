<template>
  <div class="select-item-container" @click="clickHdl">
    <img :src="require(`../assets/${type}/${index}.jpg`)" :style="`opacity:${active ? 1 : 0.5};`" />
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
    type: {
      type: String,
      default: ''
    },
    text: {
      type: String,
      default: 'Text'
    },
    onClick: {
      type: Function,
      default: () => console.log('clicked')
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
    width: 50%;
    box-sizing: border-box;
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
    margin: {
      top: 1.5vh;
      bottom: 1.5vh;
    }

    img {
      width: 75%;
      transition: opacity .5s;
    }

    .text-box {
      height: 1.2rem;
      width: 100%;
      margin-top: 1vh;
      display: flex;
      justify-content: center;
      align-items: center;

      .text {
        height: 1.3rem;
        width: 4rem;
        border: 1px solid $font-color;
        display: flex;
        justify-content: center;
        align-items: center;
        transition: background-color .5s;

        span {
          font-family: moment;
          font-size: .7rem;
          transition: color .5s;
        }
      }
    }
  }
</style>

<template>
  <div class="container">
    <van-popup v-model="showPicker" round position="bottom">
      <van-datetime-picker
        v-model="datePicked"
        type="date"
        title="选择日期"
        @confirm="pickerConfirmHdl"
        @cancel="pickerCancelHdl"
        :min-date="minDate"
        :max-date="maxDate"
        :formatter="formatter"
      />
    </van-popup>
    <div class="logo" />
    <div class="content-box">
      <div class="title">
        <span>那天，</span>
        <span>是我与中南的初次见面</span>
      </div>
      <div class="input-box">
        <button v-if="!picked" @click="clickHdl">选择日期</button>
        <div v-else class="date">
          <div>
            <span>{{datePicked.getFullYear()}}</span>
            <span>年</span>
          </div>
          <div>
            <span>{{datePicked.getMonth() + 1}}</span>
            <span>月</span>
          </div>
          <div :style="`left: ${(datePicked.getMonth() + 1) / 10 >= 1 ? '6rem' : '4rem'}`">
            <span>{{datePicked.getDate()}}</span>
            <span>日</span>
          </div>
          <div class="line" :style="`left: ${(datePicked.getMonth() + 1) / 10 >= 1 ? '6rem' : '4rem'}`" />
        </div>
      </div>
      <button v-show="picked" class="next" @click="submit">下一步</button>
      <div class="tuanzi" />
    </div>
    <div class="mountains" />
  </div>
</template>

<script>
import dayjs from 'dayjs'

const formatterMap = {
  year: '年',
  month: '月',
  day: '日'
}

export default {
  name: 'Date',
  data () {
    return {
      showPicker: false,
      datePicked: new Date(),
      picked: false,
      minDate: new Date(1903, 1, 1),
      maxDate: new Date()
    }
  },
  methods: {
    clickHdl () {
      this.showPicker = true
    },
    pickerCancelHdl () {
      this.showPicker = false
    },
    pickerConfirmHdl (value) {
      this.showPicker = false
      this.picked = true
    },
    formatter (type, val) {
      return val + formatterMap[type]
    },
    submit () {
      // localStorage.setItem('time', dayjs(this.datePicked).format('YYYY-MM-DD'))
      this.$store.time = dayjs(this.datePicked)
      this.$router.replace({ name: 'campus', params: { router: true } })
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
      position: relative;

      .title {
        width: 100%;
        margin-top: 3vh;

        span {
          display: block;
          font-family: fangzheng;
          color: $font-color;

          &:nth-child(1) {
            font-size: 2.1rem;
          }

          &:nth-child(2) {
            font-size: .9rem;
            margin-top: .5vh;
          }
        }
      }

      .input-box {
        height: 35vh;
        width: 100%;
        display: flex;
        justify-content: center;
        align-items: flex-end;

        button {
          margin-bottom: 8vh;
        }

        .date {
          height: 100%;
          width: 100%;
          position: relative;

          div {
            width: max-content;
            position: absolute;

            span {
              font-family: fangzheng;
              color: $font-color;
            }

            &:nth-child(1) {
              top: 0;
              left: 0;
              transform: scaleX(.85);
              transform-origin: 0 0;

              span {
                &:nth-child(1) {
                  font-size: 6rem;
                }
              }
            }

            &:nth-child(2) {
              top: 6rem;
              transform: scaleX(.85);
              transform-origin: 0 0;

              span {
                &:nth-child(1) {
                  font-size: 6rem;
                  display: block;
                  line-height: 5rem;
                  margin-top: .8rem;
                }
              }
            }

            &:nth-child(3) {
              top: 11.8rem;
              transform: scaleX(.85);
              transform-origin: 0 0;

              span {
                &:nth-child(1) {
                  font-size: 3.5rem;
                  line-height: 5rem;
                }

                &:nth-child(2) {
                  position: relative;
                  top: -1.3rem;
                }
              }
            }
          }

          .line {
            top: 8.5rem;
            height: 6rem;
            width: 2px;
            background: $font-color;
            transform: rotate(33deg);
          }
        }

        button {
          height: 3rem;
          width: 80%;
          border-radius: 10px;
          font-family: fangzheng;
          font-size: 1.2rem;
          background-color: $font-color;
          background-image: none;
          padding: 0;
        }
      }

      .next {
        margin-top: 10vh;
      }

      .tuanzi {
        height: 15vh;
        width: 10vh;
        background-image: url('https://csu21-h5.oss-cn-guangzhou.aliyuncs.com/assets/tuanzi.png');
        background-position: center center;
        background-size: contain;
        background-repeat: no-repeat;
        position: absolute;
        bottom: 25vh;
        right: 4rem;
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

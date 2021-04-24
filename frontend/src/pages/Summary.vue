<template>
  <div class="container" :style="`transform: scale(${scaleRate})`">
    <div id="export" class="content-box">
      <div class="content">
        <div class="logo">
          <img src="../assets/blue-logo.png"/>
        </div>
        <div class="title" />
        <div class="campus">
          <div class="avatar" />
          <div class="campus-text">
            <div>
              <span>{{'名字测试'}}</span>
              <span>，在与中南相遇后的</span>
              <span>{{36500}}</span>
              <span>天里</span>
            </div>
            <div>
              <span>你去过 </span>
              <span>{{'校本部、新校区、南校区、铁道校区、湘雅校区、湘雅新校区'}}</span>
            </div>
            <div class="campus-img-box">
              <img class="campus-img" v-for="item in campus" :key="item" :src="require(`../assets/summary/campus/${item}.png`)" />
            </div>
          </div>
        </div>
        <div class="moments">
          <div class="text">
            <div>
              <span>属于 </span>
              <span>{{'名字测试'}}</span>
            </div>
            <div>
              <span>的 </span>
              <span>中南记忆#</span>
              <div class="moments-box">
                <span>为CUBA“西南王”喝彩</span>
                <span>为CUBA“西南王”喝彩</span>
                <span>为CUBA“西南王”喝彩</span>
                <span>为CUBA“西南王”喝彩</span>
                <span>为CUBA“西南王”喝彩</span>
                <span>为CUBA“西南王”喝彩</span>
                <span>为CUBA“西南王”喝彩</span>
                <span>为CUBA“西南王”喝彩</span>
                <span>为CUBA“西南王”喝彩</span>
                <span>为CUBA“西南王”喝彩</span>
                <span>为CUBA“西南王”喝彩</span>
                <span>为CUBA“西南王”喝彩</span>
                <span>为CUBA“西南王”喝彩</span>
                <span>为CUBA“西南王”喝彩</span>
                <span>为CUBA“西南王”喝彩</span>
                <span>为CUBA“西南王”喝彩</span>
                <span>为CUBA“西南王”喝彩</span>
                <span>为CUBA“西南王”喝彩</span>
                <span>为CUBA“西南王”喝彩</span>
                <span>为CUBA“西南王”喝彩</span>
                <span>为CUBA“西南王”喝彩</span>
              </div>
            </div>
          </div>
          <div class="moment-img-box">
            <img class="moment-img" v-for="item in moments" :key="item" :src="require(`../assets/summary/moments/${item}.jpg`)" />
          </div>
        </div>
        <div class="gate">
          <img src="../assets/gate.png" />
        </div>
        <div class="bottom">
          <img src="../assets/qrcode.png" />
          <span>扫码生成</span>
          <span>拾光中南</span>
          <span>长按保存你的结果页</span>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import html2canvas from 'html2canvas'

export default {
  name: 'Summary',
  data () {
    return {
      campus: [2, 4, 5, 1],
      moments: Array(21).fill(0).map((item, index) => index),
      scaleRate: 1
    }
  },
  mounted () {
    this.$toast.loading({
      message: '生成结果页中',
      duration: 0
    })

    const content = document.getElementById('export')
    const realHeight = content.offsetHeight
    const height = content.clientHeight
    this.scaleRate = height / realHeight
    const width = content.clientWidth
    const canvas = document.createElement('canvas')
    const scale = 3

    canvas.height = height * scale
    canvas.width = width * scale
    canvas.style.height = `${height * scale}px`
    canvas.style.width = `${width * scale}px`
    // canvas.getContext('2d').scale(scale, scale)

    const options = {
      scale,
      canvas,
      logging: process.env.NODE_ENV === 'development',
      height,
      width,
      useCORS: true
    }

    html2canvas(content, options)
      .then((canvas) => {
        const img = canvas.toDataURL('image/jpg')
        const exportImg = document.createElement('img')
        exportImg.src = img
        exportImg.style.position = 'absolute'
        exportImg.style.top = 0
        exportImg.style.left = 0
        exportImg.style.width = '100%'
        exportImg.style.opacity = 0
        exportImg.style.zIndex = 999
        document.body.appendChild(exportImg)

        this.spawned = true
        this.$toast.clear()
      })
  }
}
</script>

<style lang="scss" scoped>
  @import '../styles/global.scss';

  .container {
    display: flex;
    justify-content: center;
    align-items: center;
    background-image: url('../assets/bg2.jpg');
    background-position: center center;
    background-size: cover;

    .content-box {
      width: 90%;
      background-image: url('../assets/summary-bg.jpg');
      background-position: top center;
      background-size: cover;

      .content {
        width: 100%;
        background: linear-gradient(#bed3e6, transparent);
        box-sizing: border-box;
        padding: 0 7vw;
        position: relative;

        .logo {
          height: 8vh;
          display: flex;
          justify-content: center;
          align-items: center;

          img {
            height: 5vh;
          }
        }

        .title {
          height: 13vh;
          width: 90%;
          margin: {
            top: 1vh;
            bottom: 2.5vh;
          }
          background-image: url('../assets/summary-title.png');
          background-position: center center;
          background-size: contain;
          background-repeat: no-repeat;

        }

        .campus {
          width: 100%;
          display: flex;
          position: relative;

          .avatar {
            height: 4.5vh;
            width: 4.5vh;
            border: 1px solid $font-color;
            margin: {
              top: .5vh;
              right: 1vh;
            }
          }

          .campus-text {
            display: flex;
            flex-direction: column;
            width: calc(100% - 7vh);
            font-size: 12px;

            div {
              &:nth-child(1) {
                span {
                  &:not(:first-child) {
                    font-family: moment;
                  }

                  &:nth-child(3) {
                    font-size: 1.1rem;
                    color: rgb(223,38,37);
                  }
                }
              }

              &:nth-child(2) {
                span {
                  font-family: moment;

                  &:nth-child(2) {
                    font-size: 13px;
                    color: $font-color;
                  }
                }
              }
            }
          }

          .campus-img-box {
            height: min-content;
            width: 19.2vh;
            margin: {
              top: 1vh;
              left: auto;
            }
            display: flex;
            flex-wrap: wrap;
            // background-color: pink;
            position: relative;
            right: -1vh;

            .campus-img {
              height: 6vh;
              width: 6vh;
              margin: .2vh;
            }
          }
        }

        .moments {
          height: max-content;
          width: 100%;
          display: flex;
          position: relative;
          top: -10vh;

          .text {
            width: calc(100% - 19vh);

            div {
              &:nth-child(1) {
                span {
                  font-size: 12px;

                  &:nth-child(1) {
                    font-size: 1.1rem;
                    font-family: moment-bold;
                  }
                }
              }

              &:nth-child(2) {
                span {
                  font-family: moment;

                  &:nth-child(1) {
                    font-size: 14px;
                  }

                  &:nth-child(2) {
                    font-size: 1.3rem;
                    color: $font-color;
                  }
                }

                .moments-box {
                  margin-top: .5vh;

                  span {
                    display: block;
                    font-size: 12px;
                    color: black;
                    transform: scale(.8);
                    transform-origin: 0 0;
                  }
                }
              }
            }
          }

          .moment-img-box {
            height: min-content;
            width: 20vh;
            display: flex;
            flex-wrap: wrap;
            margin-top: 12vh;

            .moment-img {
              height: 5.5vh;
              width: 5.5vh;
              margin: .5vh;
              background-size: contain;

            }
          }
        }

        .gate {
          height: 20vh;
          position: relative;

          img {
            width: 100%;
            position: absolute;
            bottom: 0;
          }
        }

        .bottom {
          height: 14vh;
          width: 100%;
          position: absolute;
          bottom: 0;
          left: 0;
          display: flex;
          flex-direction: column;
          justify-content: center;
          align-items: center;

          img {
            height: 5vh;
          }

          span {
            &:nth-child(2) {
              font-size: 12px;
              transform: scale(.8);
            }

            &:nth-child(3) {
              font-family: summary-bottom;
              font-size: 1.1rem;
            }

            &:nth-child(4) {
              font-size: 12px;
              border-left: 1px solid rgb(154,70,73);
              transform: scale(.8);
            }
          }
        }
      }
    }
  }
</style>

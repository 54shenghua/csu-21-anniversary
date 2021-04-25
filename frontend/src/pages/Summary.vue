<template>
  <div class="container">
    <!-- <img class="bg" src="../assets/bg2.jpg"> -->
    <div id="export" class="content-box" :style="`transform: scale(${scaleRate}); visibility: ${spawned ? 'visible' : 'none'}`">
      <div class="content">
        <div class="logo">
          <img src="../assets/blue-logo.png"/>
        </div>
        <div class="title" />
        <div class="campus">
          <div class="avatar" />
          <div class="campus-text">
            <div>
              <span>{{$store.username}}</span>
              <span>，在与中南相遇后的</span>
              <span>{{$store.calcDays()}}</span>
              <span>天里</span>
            </div>
            <div>
              <span>你去过 </span>
              <span>{{campus}}</span>
            </div>
            <div class="campus-img-box">
              <img class="campus-img" v-for="item in $store.campus" :key="item" :src="require(`../assets/summary/campus/${item}.png`)" />
            </div>
          </div>
        </div>
        <div class="moments">
          <div class="text">
            <div>
              <span>属于 </span>
              <span>{{$store.username}}</span>
            </div>
            <div>
              <span>的 </span>
              <span>中南记忆#</span>
              <div class="moments-box">
                <span v-for="item in $store.moments" :key="item">{{momentsMap[item]}}</span>
              </div>
            </div>
          </div>
          <div class="moment-img-box">
            <img class="moment-img" v-for="item in $store.moments" :key="item" :src="require(`../assets/summary/moments/${item}.jpg`)" />
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
    <div class="copyright">
      <span>中南小团子青年传媒中心 出品</span>
      <span>升华工作室 提供技术支持</span>
    </div>
  </div>
</template>

<script>
import html2canvas from 'html2canvas'

const campusMap = [
  '校本部',
  '新校区',
  '南校区',
  '铁道校区',
  '湘雅校区',
  '湘雅新校区'
]

const momentsMap = [
  '住在升华公寓',
  '在校本部参加升旗仪式',
  '在图书馆借一本书',
  '穿过B、C座之间的廊桥',
  '为CUBA“西南王”欢呼喝彩',
  '在网红食堂“八食堂”干饭',
  '为体测坚持晨练',
  '打卡中南大学校门',
  '驻足天鹅湖畔',
  '踩着单车去上课',
  '在情人坡上晒太阳',
  '与火车头合影',
  '参加一次新年音乐会',
  '难忘的军训',
  '寻访和平楼',
  '谈一场校园恋爱',
  '一起赏中南初雪',
  '品尝中南限定月饼',
  '难舍湘雅红楼',
  '在中南，听讲座',
  '毕业典礼，不说再见'
]

export default {
  name: 'Summary',
  data () {
    return {
      momentsMap,
      spawned: false,
      scaleRate: 1,
      campus: ''
    }
  },
  mounted () {
    this.$store.campus.sort()
    this.$store.campus.forEach((item) => {
      this.campus += (campusMap[item] + '、')
    })
    this.campus = this.campus.slice(0, this.campus.length - 1)

    this.$toast.loading({
      message: '生成结果页中',
      duration: 0
    })

    setTimeout(() => {
      const content = document.getElementById('export')
      const height = content.clientHeight
      const width = content.clientWidth
      const canvas = document.createElement('canvas')
      const scale = 3

      const container = document.getElementById('app')
      const viewHeight = container.clientHeight
      const viewWidth = container.clientWidth

      const real = document.getElementById('export')
      const realHeight = real.clientHeight
      const realWidth = real.clientWidth
      this.scaleRate = Math.min(viewHeight / realHeight, realWidth / viewWidth) * 0.9

      canvas.height = height * scale
      canvas.width = width * scale
      canvas.style.height = `${height * scale}px`
      canvas.style.width = `${width * scale}px`

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
          exportImg.style.left = 0
          exportImg.style.width = '100%'
          exportImg.style.opacity = 0
          exportImg.style.zIndex = 999
          document.body.appendChild(exportImg)

          this.spawned = true
          this.$toast.clear()
        })
    }, 500)
  }
}
</script>

<style lang="scss" scoped>
  @import '../styles/global.scss';

  .container {
    display: flex;
    justify-content: center;
    align-items: center;
    position: relative;

    .bg {
      height: 100%;
      width: 100%;
      position: absolute;
      top: 0;
      left: 0;
    }

    .content-box {
      width: 22rem;
      background-image: url('../assets/summary-bg.jpg');
      background-position: top center;
      background-size: cover;
      margin-bottom: 1rem;

      .content {
        width: 22rem;
        background: linear-gradient(#bed3e6, transparent);
        box-sizing: border-box;
        padding: 0 35px;
        position: relative;

        .logo {
          height: 3.5rem;
          display: flex;
          justify-content: center;
          align-items: center;

          img {
            height: 2.2rem;
          }
        }

        .title {
          height: 6rem;
          width: 90%;
          margin: {
            top: .5rem;
            bottom: 1rem;
          }
          background-image: url('../assets/summary-title.png');
          background-position: center center;
          background-size: contain;
          background-repeat: no-repeat;
          position: relative;
          left: -.6rem;
        }

        .campus {
          width: 100%;
          display: flex;
          position: relative;

          .avatar {
            height: 1.8rem;
            width: 1.8rem;
            border: 1px solid $font-color;
            margin: {
              top: .5rem;
              bottom: 1rem;
              right: .3rem;
            }
          }

          .campus-text {
            display: flex;
            flex-direction: column;
            width: calc(100% - 2.1rem);
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
            height: 5.4rem;
            width: 8.1rem;
            margin: {
              top: 3px;
              left: auto;
              right: 3px;
            }
            display: flex;
            flex-wrap: wrap;

            .campus-img {
              height: 2.7rem;
              width: 2.7rem;
            }
          }
        }

        .moments {
          height: max-content;
          width: 100%;
          display: flex;
          position: relative;
          top: -3rem;

          .text {
            div {
              &:nth-child(1) {
                span {
                  &:nth-child(1) {
                    font-size: 1.1rem;
                    font-family: moment-bold;
                  }

                  &:nth-child(2) {
                    font-size: 14px;
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
                    font-size: 1.5rem;
                    color: $font-color;
                  }
                }

                .moments-box {
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
            width: 8.4rem;
            display: flex;
            flex-wrap: wrap;
            margin: {
              top: 3.3rem;
              left: auto;
            }

            .moment-img {
              height: 2.4rem;
              width: 2.4rem;
              margin: .2rem;
              background-size: contain;

            }
          }
        }

        .gate {
          height: 9rem;
          position: relative;

          img {
            width: 100%;
            position: absolute;
            bottom: 0;
          }
        }

        .bottom {
          height: 6.3rem;
          width: 100%;
          position: absolute;
          bottom: 0;
          left: 0;
          display: flex;
          flex-direction: column;
          justify-content: center;
          align-items: center;

          img {
            height: 2rem;
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

            &:nth-child(5) {
              font-size: 12px;
              transform: scale(.8);
            }
          }
        }
      }
    }

    .copyright {
      position: absolute;
      bottom: 0;

      span {
        display: block;
        font-family: subtitle;
      }
    }
  }
</style>

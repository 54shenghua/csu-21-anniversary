<template>
  <div class="container">
    <div class="logo" />
    <div class="content-box">
      <span class="title">你好，中南人</span>
      <div class="avatar-box">
        <img class="avatar-outer" src="https://csu21-h5.oss-cn-guangzhou.aliyuncs.com/assets/avatar-outer.png" />
        <img v-if="avatar !== ''" class="avatar" :src="avatar">
      </div>
      <div class="input-box">
        <input class="input" v-model="name" placeholder="请输入你的名字" />
      </div>
      <button @click="submit">下一步</button>
    </div>
  </div>
</template>

<script>
export default {
  name: 'Profile',
  data () {
    return {
      name: '',
      avatar: ''
    }
  },
  methods: {
    submit () {
      if (process.env.NODE_ENV !== 'development' && this.name === '') {
        this.$toast.fail('请输入你的名字~')
        return
      }
      // localStorage.setItem('name', this.name)
      this.$store.username = this.name
      this.$router.replace({ name: 'date', params: { router: true } })
    }
  }
}
</script>

<style lang="scss" scoped>
  @import '../styles/global.scss';

  .container {
    background-image: url('https://csu21-h5.oss-cn-guangzhou.aliyuncs.com/assets/bg2.jpg');
    background-position: center center;
    background-size: cover;
    position: relative;
    display: flex;
    justify-content: center;
    align-items: center;

    .logo {
      $logo-size: 15vh;
      height: $logo-size;
      width: $logo-size;
      background-image: url('https://csu21-h5.oss-cn-guangzhou.aliyuncs.com/assets/trans-logo.png');
      background-size: cover;
      position: absolute;
      top: 3%;
    }

    .content-box {
      height: 75%;
      width: 80%;
      background-image: url('https://csu21-h5.oss-cn-guangzhou.aliyuncs.com/assets/content-box.png');
      background-position: center center;
      background-size: cover;
      margin-top: 15%;
      display: flex;
      justify-content: center;
      align-items: center;
      flex-direction: column;

      .title {
        font-size: 2.3rem;
        letter-spacing: 2px;
        font-family: title;
        color: $font-color;
        margin-bottom: 6%;
      }

      .avatar-box {
        $avatar-box-size: 16vh;
        height: $avatar-box-size;
        width: $avatar-box-size;
        background-image: url('https://csu21-h5.oss-cn-guangzhou.aliyuncs.com/assets/avatar-inner.png');
        background-position: center center;
        background-size: contain;
        display: flex;
        justify-content: center;
        align-items: center;
        position: relative;

        .avatar-outer {
          $avatar-box-size: 16vh;
          height: $avatar-box-size;
          width: $avatar-box-size;
          z-index: 1;
        }

        .avatar {
          $avatar-size: 13.6vh;
          height: $avatar-size;
          width: $avatar-size;
          border-radius: 50%;
          position: absolute;
          top: 3.5%;
          left: 7%;
          z-index: 0;
        }
      }

      .input-box {
        height: 20%;
        display: flex;
        justify-content: center;
        align-items: center;

        input {
          height: 1.5rem;
          width: 75%;
          outline: none;
          border: 2px solid $font-color;
          border-radius: 10px;
          padding: {
            left: 7px;
            right: 7px;
          }
          text-align: center;
        }
      }

      button {
        margin: {
          top: 3%;
          bottom: 17%;
        }
      }
    }
  }
</style>

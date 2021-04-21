<template>
  <div class="container">
    <div class="logo" />
    <div class="content-box">

    </div>
  </div>
</template>

<script>
export default {
  name: 'Transition',
  data () {
    return {

    }
  }
}
</script>

<style lang="scss" scoped>
  .container {
    background-image: url('../assets/2bg.png');
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
      background-image: url('../assets/trans-logo.png');
      background-size: cover;
      position: absolute;
      top: 3%;
    }

    .content-box {
      height: 75%;
      width: 80%;
      background-image: url('../assets/content-box.png');
      background-position: center center;
      background-size: cover;
      margin-top: 15%;
    }
  }
</style>

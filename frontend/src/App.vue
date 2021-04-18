<template>
  <div id="app">
    <transition :name="`${['forbidden', 'loading'].includes($route.name) ? '' : 'fade'}`">
      <router-view />
    </transition>
  </div>
</template>

<style lang="scss" scoped>
  #app {
    position: absolute;
    top: 0;
    left: 0;
    height: 100%;
    width: 100%;
    overflow: hidden;
  }

  .fade-enter-active {
    transition: opacity .5s .5s;
  }

  .fade-leave-active {
    transition: opacity .5s;
  }

  .fade-enter, .fade-leave-to {
    opacity: 0;
  }

  .container {
    height: 100%;
    width: 100%;
  }
</style>

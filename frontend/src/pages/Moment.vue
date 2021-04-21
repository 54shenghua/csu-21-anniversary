<template>
  <div class="container">

  </div>
</template>

<script>
export default {
  name: 'Moment',
  data () {
    return {
      moment: []
    }
  },
  methods: {
    clickHdl (id) {
      this.moment.push(id)
    },
    submit () {
      localStorage.setItem('moment', this.moment)
      this.$router.replace({ name: 'summary', params: { router: true } })
    }
  }
}
</script>

<style lang="scss" scoped>

</style>

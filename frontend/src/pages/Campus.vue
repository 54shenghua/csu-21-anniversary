<template>
  <div class="container">

  </div>
</template>

<script>
export default {
  name: 'Campus',
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
      localStorage.setItem('campus', this.campus)
      this.$router.replace({ name: 'memory', params: { router: true } })
    }
  }
}
</script>

<style lang="scss" scoped>

</style>

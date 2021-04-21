<template>
  <div class="container">
    <input v-model="name" />
  </div>
</template>

<script>
export default {
  name: 'Profile',
  data () {
    return {
      name: ''
    }
  },
  methods: {
    submit () {
      localStorage.setItem('name', this.name)
      this.$router.replace({ name: 'date', params: { router: true } })
    }
  }
}
</script>

<style lang="scss" scoped>

</style>

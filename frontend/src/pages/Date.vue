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
    <input @click="clickHdl" readonly />
  </div>
</template>

<script>
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
      datePicked: {},
      minDate: new Date(1960, 1, 1),
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
    },
    formatter (type, val) {
      return val + formatterMap[type]
    }
  }
}
</script>

<style lang="scss" scoped>
  input {
    outline: none;
  }
</style>

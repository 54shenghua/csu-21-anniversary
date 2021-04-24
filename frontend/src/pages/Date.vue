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
    <input :value="dateShown" @click="clickHdl" readonly />
    <button @click="submit">下一步</button>
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
      dateShown: '',
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
      this.dateShown = dayjs(this.datePicked).format('YYYY 年 MM 月 DD 日')
    },
    formatter (type, val) {
      return val + formatterMap[type]
    },
    submit () {
      localStorage.setItem('time', dayjs(this.datePicked).format('YYYY-MM-DD'))
      this.$router.replace({ name: 'campus', params: { router: true } })
    }
  }
}
</script>

<style lang="scss" scoped>
  input {
    outline: none;
  }
</style>

const dayjs = require('dayjs')

class Store {
  constructor () {
    this.openid = ''
    this.username = ''
    this.time = {}
    this.avatar = ''
    this.campus = []
    this.moments = []
    this.images = []
  }

  calcDays () {
    return dayjs().diff(this.time, 'day')
  }
}

export default new Store()

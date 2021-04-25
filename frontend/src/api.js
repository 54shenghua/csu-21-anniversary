import { Axios } from './config/axios'
import store from './store'

export function login (code) {
  return Axios.post('login/', { code })
  // return Promise.resolve({
  //   data: {
  //     openid: 'xxx',
  //     avatar: 'xxx',
  //     msg: '',
  //     status: true
  //   }
  // })
}

export function count () {
  return Axios.post('click/', {
    openid: store.openid,
    name: store.name,
    time: store.time.format('YYYY-MM-DD'),
    campus: store.campus,
    moment: store.moments
  })
}

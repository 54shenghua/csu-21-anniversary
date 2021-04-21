// import Axios from './config/axios'

export function login (code) {
  // return Axios.post('/login', { code })
  return Promise.resolve({
    data: {
      openid: 'xxx',
      avatar: 'xxx',
      msg: '',
      status: true
    }
  })
}

export function count () {
  // return Axios.post('/count', {
  //   openid: localStorage.getItem('openid'),
  //   name: localStorage.getItem('name'),
  //   time: localStorage.getItem('time'),
  //   campus: localStorage.getItem('campus'),
  //   moment: localStorage.getItem('moment')
  // })
}

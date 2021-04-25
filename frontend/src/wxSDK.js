import wx from 'weixin-js-sdk'
import { Axios } from './config/axios'

const options = {
  title: '拾光中南',
  desc: '和21岁的中南，一起回到相遇的那天！',
  link: 'https://csu21.54sher.com',
  imgUrl: 'https://csu21-h5.oss-cn-guangzhou.aliyuncs.com/assets/share.jpg'
}

export function initWXJSSDK (url) {
  Axios.post('ticket/', {
    url
  }).then((res) => {
    wx.config({
      debug: false,
      appId: 'wx2fdfc27744ffa252',
      timestamp: res.data.data.timestamp,
      nonceStr: res.data.data.noncestr,
      signature: res.data.data.signature,
      jsApiList: ['updateAppMessageShareData', 'updateTimelineShareData']
    })

    wx.ready(() => {
      wx.updateAppMessageShareData(options)

      wx.updateTimelineShareData(options)
    })

    wx.error((res) => {
      alert(JSON.stringify(res))
    })
  })
}

const imgs = [
  'bg.jpg',
  'summary-title.png',
  'gate.png',
  'mountain.png',
  'content-box.png',
  'logo.png',
  'button.png',
  'bg2.jpg',
  'trans-logo.png',
  'avatar-outer.png',
  'blue-logo.png',
  'avatar-inner.png',
  'click.png',
  'summary-bg.jpg',
  'white-bg.png',
  'qrcode.png'
]

for (let i = 0; i < 21; ++i) {
  if (i < 6) {
    imgs.push(`campus/${i}.jpg`)
    imgs.push(`summary/campus/${i}.png`)
  }
  imgs.push(`moments/${i}.jpg`)
  imgs.push(`summary/moments/${i}.jpg`)
}

const prefix = 'https://csu21-h5.oss-cn-guangzhou.aliyuncs.com/assets/'

export function imgPreloader () {
  // eslint-disable-next-line prefer-const
  let promises = []

  imgs.forEach((item) => {
    promises.push(new Promise((resolve, reject) => {
      const img = new Image()
      img.onload = () => {
        resolve()
      }
      img.onerror = () => {
        reject(new Error('image preload failed'))
      }
      img.src = prefix + item
    }))
  })
  return Promise.all(promises)
}

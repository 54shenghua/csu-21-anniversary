const imgs = [
]

const prefix = ''

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

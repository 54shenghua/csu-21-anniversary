<template>
  <div id="export" class="container">

  </div>
</template>

<script>
import html2canvas from 'html2canvas'

export default {
  name: 'Summary',
  data () {
    return {

    }
  },
  mounted () {
    const content = document.getElementById('export')
    const height = content.clientHeight
    const width = content.clientWidth
    const canvas = document.createElement('canvas')
    const scale = 2

    canvas.height = height
    canvas.width = width
    canvas.style.height = `${height * scale}px`
    canvas.style.width = `${width * scale}px`
    canvas.getContext('2d').scale(scale, scale)

    const options = {
      scale,
      canvas,
      logging: process.env.NODE_ENV === 'development',
      height,
      width,
      useCORS: true
    }

    html2canvas(content, options)
      .then((canvas) => {
        const img = canvas.toDataURL('image/jpg')
        const exportImg = document.createElement('img')
        exportImg.src = img
        document.body.appendChild(exportImg)
      })
  }
}
</script>

<style lang="scss" scoped>

</style>

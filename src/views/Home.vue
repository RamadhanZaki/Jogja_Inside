<template>
  <div class="home">
    <Header/>
    <IntroText/>
  </div>
</template>

<script>
// @ is an alias to /src
import Header from '@/components/Home/Header.vue'
import IntroText from '@/components/Home/IntroText.vue'

export default {
  name: 'HomePage',
  components: {
    Header,
    IntroText,
  }
}
</script>

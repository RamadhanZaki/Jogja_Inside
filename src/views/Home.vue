<template>
  <div class="home">
    <Navbar/>
    <Header/>
    <IntroText/>
    <TopDestinations/>
  </div>
</template>

<script>
// @ is an alias to /src
import Navbar from '@/components/Navbar.vue'
import Header from '@/components/Home/Header.vue'
import IntroText from '@/components/Home/IntroText.vue'
import TopDestinations from '@/components/TopDestination.vue'

export default {
  name: 'HomePage',
  components: {
    Header,
    Navbar,
    IntroText,
    TopDestinations,
  }
}
</script>

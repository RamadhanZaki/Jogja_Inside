<template>
  <div class="home">
    <Navbar/>
    <Header/>
    <IntroText/>
    <TopThree />
    <TopDestinations/>
    <Footer/>
  </div>
</template>

<script>
// @ is an alias to /src
import Navbar from '@/components/Navbar.vue'
import Header from '@/components/Home/Header.vue'
import IntroText from '@/components/Home/IntroText.vue'
import TopDestinations from '@/components/TopDestination.vue'
import TopThree from '@/components/TopThree.vue' 
import Footer from '@/components/Footer.vue'

export default {
  name: 'HomePage',
  components: {
    Navbar,
    Header,
    IntroText,
    TopThree,
    TopDestinations,
    Footer,
    
  }
}
</script>

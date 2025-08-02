<template>
  <div class="home">
    <Navbar/>
    <Header/>
    <IntroText/>
    <TopThree />
    <HiddenGems/>
    <TopDestinations/>
    <WhyChooseUs/>
    <Footer/>
  </div>
</template>

<script>
// @ is an alias to /src
import Navbar from '@/components/Navbar.vue'
import Header from '@/components/Home/Header.vue'
import IntroText from '@/components/Home/IntroText.vue'
import TopDestinations from '@/components/TopDestination.vue'
import HiddenGems from '@/components/Home/HiddenGems.vue'
import TopThree from '@/components/TopThree.vue' 
import Footer from '@/components/Footer.vue'
import WhyChooseUs from '@/components/Home/WhyChooseUs.vue'

export default {
  name: 'HomePage',
  components: {
    Navbar,
    Header,
    IntroText,
    TopThree,
    TopDestinations,
    HiddenGems,
    WhyChooseUs,
    Footer,
    
  }
}
</script>

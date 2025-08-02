<template>
  <div class="home">
    <Navbar />
    <Header />
    <RunningText />
    <ExploreDestination/>
    <TopDestinations />
    <WhyChooseUs />
    <HiddenGems />
    <BannerBottom/>
    <Footer />
  </div>
</template>


<script>
// @ is an alias to /src
import Navbar from '@/components/Navbar.vue'
import Header from '@/components/Home/Header.vue'
import RunningText from '@/components/Home/RunningText.vue'
import ExploreDestination from '@/components/Home/ExploreDestination.vue'
import TopDestinations from '@/components/Home/TopDestination.vue'
import HiddenGems from '@/components/Home/HiddenGems.vue'
import Footer from '@/components/Footer.vue'
import WhyChooseUs from '@/components/Home/WhyChooseUs.vue'
import BannerBottom from '@/components/Home/BannerBottom.vue'

export default {
  name: 'HomePage',
  components: {
    Navbar,
    Header,
    RunningText,
    ExploreDestination,
    TopDestinations,
    HiddenGems,
    WhyChooseUs,
    BannerBottom,
    Footer,
    
  }
}
</script>

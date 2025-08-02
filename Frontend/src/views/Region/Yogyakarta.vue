<template>
  <div class="yogyakarta-region-page">
    <Navbar />
    <HeroSection/>
    <ExploreYK/>
    <TrendingNowYK/>
    <TopHiddenGems/>
    <StatSection region="Yogyakarta" backgroundImage="/images/Background/SSYK.jpg"/>
    <Footer />
  </div>
</template>

<script>
import Navbar from '@/components/Navbar.vue';
import Footer from '@/components/Footer.vue';
import HeroSection from '@/components/Yogyakarta/HeroSectionYK.vue';
import StatSection from '@/components/StatSection.vue';
import TopHiddenGems from '@/components/Yogyakarta/TopHiddenGemsYK.vue';
import ExploreYK from '@/components/Yogyakarta/ExploreYK.vue';
import TrendingNowYK from '@/components/Yogyakarta/TrendingNowYK.vue';

export default {
  name: 'YogyakartaRegionPage',
  components: {
    Navbar,
    HeroSection,
    StatSection,
    TrendingNowYK,
    ExploreYK,
    TopHiddenGems,
    Footer,
  },
};
</script>

<style scoped>

@import url('https://fonts.googleapis.com/css2?family=Luckiest+Guy&family=Permanent+Marker&family=Great+Vibes&display=swap');


</style>
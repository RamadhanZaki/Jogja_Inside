<template>
  <div class="kulonprogo-region-page">
    <Navbar />
    <HeroSection/>
    <ExploreKP/>
    <TrendingNowKP/>
    <TopHiddenGemsKP/>
    <StatSection region="Kulon Progo" backgroundImage="/images/Background/SSKP.webp"/>
    <Footer />
  </div>
</template>

<script>
import Navbar from '@/components/Navbar.vue';

import Footer from '@/components/Footer.vue';
import HeroSection from '@/components/KulonProgo/HeroSectionKP.vue';
import StatSection from '@/components/StatSection.vue';
import TopHiddenGemsKP from '@/components/KulonProgo/TopHiddenGemsKP.vue';
import TrendingNowKP from '@/components/KulonProgo/TrendingNowKP.vue';
import ExploreKP from '@/components/KulonProgo/ExploreKP.vue';

export default {
  name: 'KulonProgoRegionPage',
  components: {
    Navbar,
    HeroSection,
    ExploreKP,
    StatSection,
    TrendingNowKP,
    TopHiddenGemsKP,
    Footer,
  },
};
</script>

<style scoped>

@import url('https://fonts.googleapis.com/css2?family=Luckiest+Guy&family=Permanent+Marker&family=Great+Vibes&display=swap');


</style>
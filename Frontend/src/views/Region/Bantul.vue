<template>
  <div class="bantul-region-page">
    <Navbar />
    <HeroSection/>
    <ExploreBL/>
    <TrendingNowBL/>
    <TopHiddenGems/>
    <StatSection region="Bantul" backgroundImage="/images/Background/SSBL.webp"/>
    <Footer />
  </div>
</template>

<script>
import Navbar from '@/components/Navbar.vue';
import Footer from '@/components/Footer.vue';
import HeroSection from '@/components/Bantul/HeroSectionBL.vue';
import StatSection from '@/components/StatSection.vue';
import TopHiddenGems from '@/components/Bantul/TopHiddenGemsBL.vue';
import TrendingNowBL from '@/components/Bantul/TrendingNowBL.vue';
import ExploreBL from '@/components/Bantul/ExploreBL.vue';

export default {
  name: 'BantulRegionPage',
  components: {
    Navbar,
    HeroSection,
    TrendingNowBL,
    ExploreBL,
    StatSection,
    TopHiddenGems,
    Footer,
  },
};
</script>

<style scoped>

@import url('https://fonts.googleapis.com/css2?family=Luckiest+Guy&family=Permanent+Marker&family=Great+Vibes&display=swap');


</style>

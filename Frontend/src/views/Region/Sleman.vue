<template>
  <div class="sleman-region-page">
    <Navbar />
    <HeroSection/>
    <ExploreSM/>
    <TrendingNowSM/>
    <TopHiddenGems/>
    <StatSection region="Sleman" backgroundImage="/images/Background/SSSM.jpg"/>
    <Footer />
  </div>
</template>

<script>
import Navbar from '@/components/Navbar.vue';
import Footer from '@/components/Footer.vue';
import HeroSection from '@/components/Sleman/HeroSectionSM.vue';
import StatSection from '@/components/StatSection.vue';
import TopHiddenGems from '@/components/Sleman/TopHiddenGemsSM.vue';
import ExploreSM from '@/components/Sleman/ExploreSM.vue';
import TrendingNowSM from '@/components/Sleman/TrendingNowSM.vue';

export default {
  name: 'SlemanRegionPage',
  components: {
    Navbar,
    HeroSection,
    ExploreSM,
    StatSection,
    TrendingNowSM,
    TopHiddenGems,
    Footer,
  },
};
</script>

<style scoped>

@import url('https://fonts.googleapis.com/css2?family=Luckiest+Guy&family=Permanent+Marker&family=Great+Vibes&display=swap');


</style>
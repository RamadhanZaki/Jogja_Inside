<template>
  <div class="gunungkidul-region-page">
    <Navbar />
    <HeroSection/>
    <ExploreGK/>
    <TredingNowGK/>
    <TopHiddenGems/>
    <StatSection region="GunungKidul" backgroundImage="/images/Background/SSGK.jpg"/>
    <Footer />
  </div>
</template>

<script>
import Navbar from '@/components/Navbar.vue';
import Footer from '@/components/Footer.vue';
import HeroSection from '@/components/GunungKidul/HeroSectionGK.vue';
import StatSection from '@/components/StatSection.vue';
import TopHiddenGems from '@/components/GunungKidul/TopHiddenGemsGK.vue';
import TredingNowGK from '@/components/GunungKidul/TrendingNowGK.vue';
import ExploreGK from '@/components/GunungKidul/ExploreGK.vue';

export default {
  name: 'GunungKidulRegionPage',
  components: {
    Navbar,
    HeroSection,
    TredingNowGK,
    ExploreGK,
    StatSection,
    TopHiddenGems,
    Footer,
  },
};
</script>

<style scoped>

@import url('https://fonts.googleapis.com/css2?family=Luckiest+Guy&family=Permanent+Marker&family=Great+Vibes&display=swap');


</style>
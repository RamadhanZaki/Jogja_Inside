<template>
  <section
    class="stat-section"
    :style="{
      backgroundImage: 'linear-gradient(rgba(0, 0, 0, 0.55), rgba(0, 0, 0, 0.55)), url(' + backgroundImage + ')',
    }"
  >
    <div class="overlay">
      <div class="main-stat">
        <h2>{{ totalDestinations }}+</h2>
        <p>A relaxing place to enjoy your vacation</p>
      </div>
      <hr class="divider" />

      <div class="sub-stats">
        <div class="stat-item">
          <h3>{{ trendingCount }}+</h3>
          <p>Favorite travel destination</p>
        </div>
        <div class="stat-item">
          <h3>{{ hiddenGemCount }}+</h3>
          <p>Hidden but worth it</p>
        </div>
        <div class="stat-item">
          <h3>{{ natureEscapeCount }}+</h3>
          <p>Into the wild peace</p>
        </div>
      </div>
    </div>
  </section>
</template>

<script>
import axios from 'axios';

export default {
  name: 'StatSection',
  props: {
    region: {
      type: String,
      required: true,
    },
    backgroundImage: {
      type: String,
      default: '/img/bg/default.jpg',
    },
  },
  data() {
    return {
      totalDestinations: 0,
      trendingCount: 0,
      hiddenGemCount: 0,
      natureEscapeCount: 0,
    };
  },
  mounted() {
    this.fetchStats();
  },
  methods: {
    async fetchStats() {
      try {
        const res = await axios.get(
          `${process.env.VUE_APP_API_BASE}/destination-stats?region=${this.region}`
        );
        this.totalDestinations = res.data.total;
        this.trendingCount = res.data.trending;
        this.hiddenGemCount = res.data.hidden_gem;
        this.natureEscapeCount = res.data.nature_escape;
      } catch (error) {
        console.error('❌ Gagal memuat data statistik:', error);
      }
    },
  },
};
</script>

<style scoped>
.stat-section {
  background-size: cover;
  background-position: center;
  position: relative;
  padding: 0;
}

.overlay {
  padding: 5rem 2rem;
  color: white;
  text-align: center;
}

.main-stat h2 {
  font-size: 3rem;
  font-weight: bold;
  margin-bottom: 1rem;
}

.main-stat p {
  font-size: 1.2rem;
  margin-bottom: 2rem;
}

.divider {
  width: 90%;
  height: 1px;
  background: #ccc;
  border: none;
  margin: 0 auto 2rem auto;
}

.sub-stats {
  display: flex;
  justify-content: center;
  gap: 3rem;
  flex-wrap: wrap;
}

.stat-item {
  border-left: 1px solid #ccc;
  padding: 0 2rem;
}

.stat-item:first-child {
  border-left: none;
}

.stat-item h3 {
  font-size: 2rem;
  margin-bottom: 0.5rem;
}

.stat-item p {
  font-size: 1.1rem;
}
</style>

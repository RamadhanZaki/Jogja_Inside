<template>
  <section class="top-hidden-gems">
    <div class="container">
      <h2 class="section-title">Trending di Yogyakarta</h2>
      <div class="carousel-container">
        <button class="nav left" @click="scrollLeft">←</button>

        <div
          class="carousel"
          ref="carousel"
          :class="{ 'shake-left': shakeDirection === 'left', 'shake-right': shakeDirection === 'right' }"
          @animationend="shakeDirection = ''"
        >
          <router-link
            v-for="(card, index) in visibleCards"
            :key="index"
            :to="`/destination/${card.slug}`"
            class="card"
          >
            <img :src="card.image" :alt="card.title" loading="lazy" />
            <div class="card-overlay">
              <h3>{{ card.title }}</h3>
              <p>{{ card.description }}</p>
            </div>
          </router-link>
        </div>

        <button class="nav right" @click="scrollRight">→</button>
      </div>
    </div>
  </section>
</template>

<script>
import axios from 'axios'

export default {
  data() {
    return {
      scrollIndex: 0,
      visibleCount: 4,
      shakeDirection: '',
      cards: [],
    }
  },
  computed: {
    visibleCards() {
      return this.cards.slice(this.scrollIndex, this.scrollIndex + this.visibleCount)
    },
  },
  methods: {
    scrollLeft() {
      if (this.scrollIndex > 0) {
        this.scrollIndex--
      } else {
        this.triggerShake('left')
      }
    },
    scrollRight() {
      if (this.scrollIndex + this.visibleCount < this.cards.length) {
        this.scrollIndex++
      } else {
        this.triggerShake('right')
      }
    },
    triggerShake(direction) {
      this.shakeDirection = direction
    },
    async fetchTrendingDestinations() {
      try {
        const apiBase = process.env.VUE_APP_API_BASE || 'https://jogja-inside.my.id/api'
        const baseUrl = apiBase.replace('/api', '')

        const response = await axios.get(`${apiBase}/destinations`)
        console.log('API response:', response.data)

        const destinations = Array.isArray(response.data.data)
          ? response.data.data
          : response.data.data?.destinations || []

        const trending = destinations.filter(
          item => item.label === 'Trending Now' && item.region === 'Yogyakarta'
        )

        this.cards = trending.map(item => ({
          title: item.name,
          description: item.region || 'Unknown Region',
          image: item.thumbnail
            ? `${baseUrl}/storage/${item.thumbnail}`
            : 'https://via.placeholder.com/300x200?text=No+Image',
          slug: item.slug,
        }))
      } catch (error) {
        console.error('❌ Gagal memuat destinasi trending:', error.message || error)
      }
    },
  },
  mounted() {
    this.fetchTrendingDestinations()
  },
}
</script>

<style scoped>
.container {
  max-width: 1060px;
  margin: 0 auto;
  padding: 0 15px;
  box-sizing: border-box;
}
.top-hidden-gems {
  padding: 2rem 0;
}
.section-title {
  font-size: 2rem;
  margin-bottom: 1.5rem;
  text-align: left;
}
.carousel-container {
  display: flex;
  align-items: center;
  justify-content: center;
  position: relative;
}
.carousel {
  display: flex;
  gap: 1rem;
  overflow: hidden;
  width: 100%;
}
.card {
  flex: 0 0 calc(25% - 1rem);
  position: relative;
  border-radius: 12px;
  overflow: hidden;
  background: #000;
  height: 280px;
  text-decoration: none;
  color: inherit;
}
.card img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  display: block;
}
.card-overlay {
  position: absolute;
  bottom: 0;
  left: 0;
  z-index: 2;
  color: white;
  background: rgba(0, 0, 0, 0.35);
  width: 100%;
  padding: 0.5rem;
}
.card-overlay h3 {
  font-size: 0.9rem;
  margin: 0;
  font-weight: bold;
}
.card-overlay p {
  font-size: 0.75rem;
  margin: 0.25rem 0 0;
}
.nav {
  background: none;
  border: none;
  font-size: 2rem;
  cursor: pointer;
  user-select: none;
  padding: 0 0.5rem;
}
@keyframes shake-left {
  0% { transform: translateX(0); }
  25% { transform: translateX(-8px); }
  50% { transform: translateX(6px); }
  75% { transform: translateX(-4px); }
  100% { transform: translateX(0); }
}
@keyframes shake-right {
  0% { transform: translateX(0); }
  25% { transform: translateX(8px); }
  50% { transform: translateX(-6px); }
  75% { transform: translateX(4px); }
  100% { transform: translateX(0); }
}
.shake-left {
  animation: shake-left 0.4s ease;
}
.shake-right {
  animation: shake-right 0.4s ease;
}
@media (max-width: 768px) {
  .card {
    flex: 0 0 calc(50% - 0.5rem);
    height: 240px;
  }
}
@media (max-width: 480px) {
  .card {
    flex: 0 0 100%;
    height: 200px;
  }
}
</style>

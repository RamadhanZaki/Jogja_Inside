<template>
  <section class="top-hidden-gems">
    <h2>INSPIRATIONAL STORIES</h2>
    <div class="carousel-container">
      <button class="nav left" @click="scrollLeft">←</button>

      <div
        class="carousel"
        ref="carousel"
        :class="{ 'shake-left': shakeDirection === 'left', 'shake-right': shakeDirection === 'right' }"
        @animationend="shakeDirection = ''"
      >
        <div
          class="card"
          v-for="(card, index) in visibleCards"
          :key="index"
        >
          <img :src="card.image" :alt="card.title" loading="lazy" />
          <div class="card-overlay">
            <h3>{{ card.title }}</h3>
            <p>{{ card.description }}</p>
          </div>
        </div>
      </div>

      <button class="nav right" @click="scrollRight">→</button>
    </div>
  </section>
</template>

<script>
export default {
  data() {
    return {
      scrollIndex: 0,
      visibleCount: 4,
      shakeDirection: "",
      cards: [
        {
          title: "Hot Springs Circle Route",
          description: "The Kootenays & Rockies",
          image: require('@/assets/thumbnail/TopHiddenGems/faza-umay-gII27TOw_e8-unsplash.jpg'),
        },
        {
          title: "→ VISIT WEBSITE",
          description: "Destination British Columbia",
          image: require('@/assets/thumbnail/TopHiddenGems/venwardo-HEcEfSRzWg4-unsplash.jpg'),
        },
        {
          title: "How to be a respectful adventurer...",
          description: "Jess Bauer",
          image: require('@/assets/thumbnail/TopHiddenGems/venwardo-Tkx2ynTSBT0-unsplash.jpg'),
        },
        {
          title: "British Columbia is 944,735 km²",
          description: "Destination British Columbia",
          image: require('@/assets/thumbnail/TopHiddenGems/venwardo-VTJBDhcsh7Q-unsplash.jpg'),
        },
        {
          title: "Another Gem",
          description: "Extra content",
          image: require('@/assets/thumbnail/TopHiddenGems/venwardo-WGDIHZ2mRFI-unsplash.jpg'),
        },
      ],
    };
  },
  computed: {
    visibleCards() {
      return this.cards.slice(this.scrollIndex, this.scrollIndex + this.visibleCount);
    },
  },
  methods: {
    scrollLeft() {
      if (this.scrollIndex > 0) {
        this.scrollIndex--;
      } else {
        this.triggerShake("left");
      }
    },
    scrollRight() {
      if (this.scrollIndex + this.visibleCount < this.cards.length) {
        this.scrollIndex++;
      } else {
        this.triggerShake("right");
      }
    },
    triggerShake(direction) {
      this.shakeDirection = direction;
    },
  },
};
</script>

<style scoped>
.top-hidden-gems {
  padding: 2rem 1rem;
  text-align: center;
}
h2 {
  font-size: 2rem;
  margin-bottom: 1.5rem;
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
  max-width: 1200px;
}
.card {
  flex: 0 0 calc(25% - 1rem);
  position: relative;
  border-radius: 12px;
  overflow: hidden;
  background: #000;
  height: 380px; /* ✅ Lebih panjang */
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
  font-size: 1rem;
  margin: 0;
  font-weight: bold;
}
.card-overlay p {
  font-size: 0.85rem;
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

/* Shake Animation */
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

/* Responsiveness */
@media (max-width: 768px) {
  .card {
    flex: 0 0 calc(50% - 0.5rem);
    height: 340px; /* ✅ Tablet lebih tinggi */
  }
}

@media (max-width: 480px) {
  .card {
    flex: 0 0 100%;
    height: 300px; /* ✅ Mobile juga lebih tinggi */
  }
}
</style>

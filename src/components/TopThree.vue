<template>
  
  <div class="three-top">
    <router-link 
      v-for="(card, index) in cards" 
      :key="index" 
      class="card"
      :to="card.link"
      :aria-label="'Learn more about ' + card.title.replace(/<br>/g, ' ')"
    >
      <div class="background">
        <img
          :src="card.image"
          :alt="card.alt"
          class="card-image"
          loading="lazy"
        />
        <div class="overlay"></div>
        <div class="card-content">
          <h2 class="card-title" v-html="card.title"></h2>
          <p class="card-description">{{ card.description }}</p>
          <button class="learn-more" :aria-label="'Learn more about ' + card.title.replace(/<br>/g, ' ')">
            LEARN MORE <span>&#8250;</span>
          </button>
        </div>
      </div>
    </router-link>
  </div>
</template>

<script setup>
// Gunakan require atau import agar Webpack bisa memproses gambar dari src/assets
const cards = [
  {
    title: 'TOP HIDDEN<br>FOR COFFESHOP',
    description: 'Tempat ngopi tersembunyi dengan suasana tenang dan rasa yang otentik—surga kecil bagi pencinta kopi dan keheningan.',
    image: require('@/assets/thumbnail/TopHiddenGems/HiddenCoffe.jpg'),
    alt: 'Scenic view representing Indigenous cultures',
    link: '/About',
  },
  {
    title: 'TOP HIDDEN<br>FOR BEACH',
    description: 'Pantai tersembunyi yang jauh dari keramaian, menyuguhkan pasir putih dan debur ombak yang menenangkan jiwa.',
    image: require('@/assets/Destinasi/GunungKidul/Pantai/Sedahan/5.webp'),
    alt: 'Accessible travel in British Columbia',
    link: '/accessible-travel',
  },
  {
    title: 'TOP HIDDEN<br>FOR MOUNTAIN',
    description: 'Destinasi pendakian tersembunyi dengan panorama alam menakjubkan—cocok untuk pencari petualangan dan ketenangan.',
    image: require('@/assets/New folder/kurniawan-kami-saputra-uuKYEG4PRbU-unsplash.jpg'),
    alt: 'BC road trip landscape',
    link: '/bc-road-trip',
  },
];
</script>

<style scoped>
.three-top {
  display: flex;
  width: 100vw;
  height: 80vh;
  margin: 0;
  padding: 4rem 0; /* Tambahkan padding atas & bawah */
  overflow: hidden;
}

.card {
  flex: 1;
  height: 100%;
  overflow: hidden;
  cursor: pointer;
  position: relative;
  display: block;
  text-decoration: none;
}

.background {
  position: relative;
  width: 100%;
  height: 100%;
}

.card-image {
  width: 100%;
  height: 100%;
  object-fit: cover;
  display: block;
}

.overlay {
  position: absolute;
  inset: 0;
  background: rgba(0, 0, 0, 0.4); /* untuk kontras teks */
  z-index: 1;
}

.card-content {
  position: absolute;
  z-index: 2;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  color: white;
  text-align: center;
  max-width: 80%;
  transition: transform 0.3s ease;
}

.card:hover .card-content {
  transform: translate(-50%, -50%) scale(1.03);
  will-change: transform;
}

.card-title {
  font-size: 2vw;
  font-weight: bold;
  line-height: 1.2;
  margin-bottom: 1rem;
}

.card-description {
  font-size: 1.1vw;
  margin-bottom: 1.5rem;
  line-height: 1.5;
}

.learn-more {
  background: none;
  border: none;
  color: white;
  font-weight: bold;
  font-size: 1vw;
  cursor: pointer;
  text-transform: uppercase;
  letter-spacing: 0.5px;
}

.learn-more span {
  font-size: 1.2vw;
  margin-left: 4px;
}

/* Responsive */
@media (max-width: 768px) {
  .three-top {
    flex-direction: column;
    height: auto;
    align-items: center;
    padding: 2rem 0; /* Lebih kecil di mobile */
    gap: 1.5rem;
  }

  .card {
    width: 90vw;
    max-width: 500px;
    aspect-ratio: 1 / 1;
    border-radius: 12px;
    overflow: hidden;
  }

  .card-title {
    font-size: 6vw;
  }

  .card-description {
    font-size: 4.5vw;
  }

  .learn-more {
    font-size: 4vw;
  }

  .learn-more span {
    font-size: 5vw;
  }
}
</style>

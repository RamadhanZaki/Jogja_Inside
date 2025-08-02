<template>
  <div class="region">


    <section class="about-section">
      <img
        src="@/assets/Background/About.webp"
        class="bg-img"
        loading="lazy"
        alt="Background Bantul"
      />
      <!-- Overlay gelap -->
      <div class="overlay"></div>

      <div class="about-content">
        <h1 class="about-title">
          Temukan Destinasi dan Event Menarik di <br />
          <span class="highlight-bantul">Bantul</span>
        </h1>
        <p class="about-description">
          Bantul menyediakan semua yang Anda butuhkan untuk liburan yang tak
          terlupakan, mulai dari<br />
          keindahan alam yang memukau hingga acara rekreasi yang menyenangkan.
        </p>

        <div class="gallery-grid">
          <img
            src="@/assets/thumbnail/Region/Bantul/Muara Pandan Simo.webp"
            class="img tall shifted"
            loading="lazy"
            alt="Muara Pandan Simo"
          />
          <div class="column">
            <img
              src="@/assets/thumbnail/Region/Bantul/Bukit Paralayang.jpg"
              class="img small"
              loading="lazy"
              alt="Bukit Paralayang"
            />
            <img
              src="@/assets/thumbnail/Region/Bantul/Puncak Mangunan.jpg"
              class="img tall"
              loading="lazy"
              alt="Puncak Mangunan"
            />
          </div>
          <img
            src="@/assets/thumbnail/Region/Bantul/Bukit Lintang Sewu.jpg"
            class="img large shifted"
            loading="lazy"
            alt="Bukit Lintang Sewu"
          />
          <div class="column">
            <img
              src="@/assets/thumbnail/Region/Bantul/potrobayan river camp.webp"
              class="img tall"
              loading="lazy"
              alt="Potrobayan River Camp"
            />
            <img
              src="@/assets/thumbnail/Region/Bantul/kurniawan-kami-saputra-OASgtG0soBI-unsplash.jpg"
              class="img small"
              loading="lazy"
              alt="Pemandangan Sungai Bantul"
            />
          </div>
          <img
            src="@/assets/thumbnail/Region/Bantul/Pinus Mangunan.jpg"
            class="img tall shifted"
            loading="lazy"
            alt="Pinus Mangunan"
          />
        </div>
      </div>
    </section>


  </div>
</template>

<script>


export default {
  name: 'RegionPage',
  components: {

  },
};
</script>

<style scoped>
.about-section {
  position: relative;
  height: 100vh;
  padding: 40px 20px;
  overflow: hidden;
  color: white;
}

/* Background image */
.bg-img {
  position: absolute;
  inset: 0;
  width: 100%;
  height: 100%;
  object-fit: cover;
  z-index: 0;
}

/* Overlay gelap */
.overlay {
  position: absolute;
  inset: 0;
  background-color: rgba(0, 0, 0, 0.6);
  z-index: 1;
}

/* Konten di atas overlay */
.about-content {
  position: relative;
  z-index: 2;
  max-width: 1000px;
  margin: 0 auto;
  text-align: center;
  padding-top: 40px;
}

/* Judul */
.about-title {
  font-size: 32px;
  font-family: 'Poppins', sans-serif;
  font-weight: bold;
}

.highlight-bantul {
  display: block;
  font-size: 32px;
  margin-top: 8px;
}

/* Deskripsi */
.about-description {
  font-size: 16px;
  line-height: 1.5;
  margin-bottom: 25px;
}

/* Gallery grid desktop */
.gallery-grid {
  display: grid;
  grid-template-columns: repeat(5, auto);
  gap: 10px;
  align-items: start;
  justify-content: center;
  flex-wrap: wrap;
}

.shifted {
  margin-top: 60px;
}

.column {
  display: flex;
  flex-direction: column;
  gap: 10px;
}

.img {
  border: 3px solid #ffffff;
  border-radius: 10px;
  object-fit: cover;
  box-shadow: 0 6px 12px rgba(0, 0, 0, 0.25);
  cursor: pointer;
  transition: transform 0.3s ease;
}

.tall {
  width: 165px;
  height: 220px;
}

.small {
  width: 165px;
  height: 110px;
}

.large {
  width: 330px;
  height: 220px;
}

/* Responsive */
@media (max-width: 768px) {
  .about-section {
    padding: 20px 10px;
    height: auto;
  }

  .about-title {
    font-size: 1.4rem;
    padding-top: 15px;
    line-height: 1.4;
  }

  .highlight-bantul {
    font-size: 1.6rem;
    margin-top: 5px;
  }

  .about-description {
    font-size: 0.85rem;
    line-height: 1.5;
    margin-bottom: 16px;
    padding: 0 5px;
  }

  .gallery-grid {
    grid-template-columns: repeat(5, 1fr);
    gap: 5px;
    padding: 0 10px;
  }

  .img {
    width: 100%;
    max-width: 100%;
    height: auto;
  }

  .tall {
    height: 20vw;
  }

  .small {
    height: 12vw;
  }

  .large {
    height: 20vw;
    grid-column: span 2;
  }

  .shifted {
    margin-top: 20px;
  }
}
</style>

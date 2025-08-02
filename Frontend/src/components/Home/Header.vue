<template>
  <section class="about-section d-flex align-items-center">
    <div class="container about-content text-white">
      <div ref="heroText" class="hero-text-box invisible">
        <h1 class="hero-title">Jelajahi Yogyakarta Lebih Dalam</h1>
        <p class="hero-description">
          Jogja Inside adalah panduan wisata terpercaya untuk menemukan destinasi populer dan permata tersembunyi di Yogyakarta. Kami menyajikan informasi lengkap, rute terbaik, dan tips wisata untuk pengalaman liburan yang lebih berkesan. Temukan sisi lain Jogja yang belum banyak dijelajahi.
        </p>
      </div>
    </div>
  </section>
</template>

<script>
export default {
  name: "HeroSection",
  mounted() {
    const isMobile = window.innerWidth <= 768;
    const el = this.$refs.heroText;

    // Jika mobile, tampilkan langsung tanpa observer & animasi
    if (isMobile && el) {
      el.classList.remove("invisible");
      return;
    }

    const options = { threshold: 0.1 };

    const animateIn = (element) => {
      element.classList.remove("invisible");
      requestAnimationFrame(() => {
        element.classList.add("animate-fadeInSlideLeft");
      });
    };

    const callback = (entries) => {
      entries.forEach(entry => {
        if (entry.isIntersecting) {
          animateIn(entry.target);
        }
      });
    };

    this.observer = new IntersectionObserver(callback, options);
    if (el) this.observer.observe(el);
  },
  beforeDestroy() {
    if (this.observer) {
      this.observer.disconnect();
    }
  }
};
</script>

<style scoped>
/* ============================================================= Hero Section =============================================================== */

.about-section {
  min-height: 100vh;
  background-image: url('@/assets/Background/Home.jpg');
  background-size: cover;
  background-position: center top;
  background-repeat: no-repeat;
  position: relative;
  padding: 0;
  margin: 0;
}

.about-section::before {
  content: "";
  position: absolute;
  inset: 0;
  background-color: rgba(0, 0, 0, 0.5);
  z-index: 1;
}

.about-content {
  position: relative;
  z-index: 2;
  display: flex;
  align-items: center;
  min-height: 100vh;
  padding-left: 10px;
  padding-right: 20px;
}

.hero-text-box {
  max-width: 720px;
  margin-left: -30px;
}

/* Awal disembunyikan */
.invisible {
  opacity: 0;
}

.hero-title {
  font-size: 36px;
  font-weight: 700;
  line-height: 1.2;
  margin-bottom: 20px;
  color: white;
  font-family: 'Montserrat', sans-serif;
}

.hero-description {
  font-size: 18px;
  line-height: 1.8;
  color: white;
  font-family: Arial, sans-serif;
  margin-bottom: 0;
  text-align: justify;
}

/* ================================ Responsive (Mobile) ================================= */
@media (max-width: 768px) {
  .about-section {
    height: auto;
    min-height: unset;
    padding: 60px 20px 160px;
    background-image: url('@/assets/Background/Home.jpg');
  }

  .about-section::before {
    height: 100%;
    width: 100%;
    position: absolute;
    top: 0;
    left: 0;
    content: "";
    background-color: rgba(0, 0, 0, 0.5);
    z-index: 1;
  }

  .about-content {
    padding-top: 100px;
    min-height: auto;
    flex-direction: column;
    justify-content: center;
    text-align: center;
  }

  .hero-text-box {
    max-width: 100%;
    margin-left: 0;
  }

  .hero-title {
    font-size: 28px;
  }

  .hero-description {
    font-size: 14px;
    text-align: center;
  }

  /* Nonaktifkan animasi di mobile */
  .animate-fadeInSlideLeft {
    animation: none !important;
    opacity: 1 !important;
    transform: none !important;
  }
}

/* ======================================================== Hero Section Animasi ============================================================ */
@keyframes fadeInSlideLeft {
  0% {
    opacity: 0;
    transform: translateX(-30px);
  }
  100% {
    opacity: 1;
    transform: translateX(0);
  }
}

.animate-fadeInSlideLeft {
  animation: fadeInSlideLeft 1.2s ease-out forwards;
}
</style>

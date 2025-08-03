<template>
  <section class="about-section d-flex align-items-center">
    <div class="container about-content text-white">
      <div ref="heroText" class="hero-text-box invisible">
        <h1 class="hero-title">Jogja-Inside</h1>
        <p class="hero-subtitle">
          temukan keindahan yogyakarta dengan pengalaman wisata yang tak terlupakan.
        </p>
        <div class="search-box">
          <input
            type="text"
            class="search-input"
            placeholder="Search"
            v-model="searchText"
            @keyup.enter="handleSearch"
          />
          <button class="search-button" @click="handleSearch">
            <i class="fas fa-search"></i>
          </button>
        </div>
      </div>
    </div>
  </section>
</template>

<script>
export default {
  name: "HeroSection",
  data() {
    return {
      searchText: "", // ✅ Menyimpan input user
    };
  },
  methods: {
  handleSearch() {
    const query = this.searchText.trim();

    this.$router.push({
      name: "DestinationResult",
      query: query ? { search: query } : { all: true }
    });
  }

  },
  mounted() {
    const isMobile = window.innerWidth <= 768;
    const el = this.$refs.heroText;

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
  padding: 0 20px;
  justify-content: center;
  text-align: center;
}

.hero-text-box {
  max-width: 800px;
}

.invisible {
  opacity: 0;
}

.hero-title {
  font-size: 42px;
  font-weight: 700;
  line-height: 1.2;
  margin-bottom: 12px;
  color: white;
  font-family: 'Montserrat', sans-serif;
}

.hero-subtitle {
  font-size: 18px;
  color: #ffffffcc;
  font-family: 'Arial', sans-serif;
  margin-bottom: 30px;
  text-transform: lowercase;
  line-height: 1.6;
}

.search-box {
  display: flex;
  justify-content: center;
  align-items: center;
  max-width: 600px;
  margin: 0 auto;
  background: white;
  border-radius: 6px;
  overflow: hidden;
  box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
}

.search-input {
  flex: 1;
  padding: 14px 16px;
  border: none;
  outline: none;
  font-size: 16px;
  color: #333;
}

.search-button {
  background-color: white;
  border: none;
  padding: 0 16px;
  cursor: pointer;
  font-size: 18px;
  color: #444;
}

.search-button i {
  font-family: 'Font Awesome 5 Free';
  font-weight: 900;
}

/* 🔧 Tampilan MOBILE (lebih ringkas & hemat ruang) */
@media (max-width: 768px) {
  .about-section {
    min-height: auto;
    height: auto;
    padding: 20px 0; /* berikan padding agar tidak terlalu dempet */
  }

  .about-content {
    padding-top: 100px;
    padding-bottom: 100px;
    flex-direction: column;
    min-height: auto;
    height: auto;
    justify-content: flex-start;
  }

  .hero-title {
    font-size: 20px;
    margin-bottom: 6px;
  }

  .hero-subtitle {
    font-size: 13px;
    margin-bottom: 12px;
    line-height: 1.4;
  }

  .search-box {
    flex-direction: row;
    max-width: 100%;
    height: 38px;
    border-radius: 5px;
  }

  .search-input {
    font-size: 13px;
    padding: 8px 10px;
  }

  .search-button {
    font-size: 14px;
    padding: 0 10px;
  }

  .animate-fadeInSlideLeft {
    animation: none !important;
    opacity: 1 !important;
    transform: none !important;
  }
}


/* Animasi */
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

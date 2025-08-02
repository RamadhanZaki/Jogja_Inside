<template>
  <section class="hero-section">
    <img
      src="@/assets/GunungkidulHS.webp"
      alt="Background Gunungkidul"
      class="hero-background"
      loading="lazy"
    />
    <div class="hero-overlay"></div>
    <div class="hero-content">
      <h2 class="hero-subtitle">WELCOME TO</h2>
      <h1 class="hero-title">Gunungkidul</h1>
      <p class="hero-description">
        Selamat datang di Gunungkidul, surga tersembunyi di selatan<br />
        dengan gua, pantai, dan tebing yang memikat setiap langkah petualang.
      </p>
      <div class="search-container">
        <input
          type="text"
          class="search-input"
          v-model="searchText"
          @keyup.enter="goToSearch"
          placeholder="Search"
        />
        <i class="fas fa-search search-icon" @click="goToSearch"></i>
      </div>
    </div>
  </section>
</template>

<script>
export default {
  name: "HeroGunungkidulSection",
  data() {
    return {
      searchText: ""
    };
  },
  methods: {
    goToSearch() {
      const query = {};
      if (this.searchText.trim()) query.search = this.searchText.trim();
      query.region = "GunungKidul"; // ✅ Tambahkan region filter

      this.$router.push({
        name: 'DestinationResult',
        query
      });
    }
  }
};
</script>

<style scoped>
.hero-section {
  position: relative;
  width: 100%;
  height: 100vh;
  overflow: hidden;
}
.hero-background {
  position: absolute;
  inset: 0;
  width: 100%;
  height: 100%;
  object-fit: cover;
  z-index: 0;
}
.hero-overlay {
  position: absolute;
  inset: 0;
  background-color: rgba(0, 0, 0, 0.50);
  z-index: 1;
}
.hero-content {
  position: relative;
  z-index: 2;
  color: white;
  text-align: center;
  padding: 60px 20px;
  top: 50%;
  transform: translateY(-50%);
}
.hero-subtitle {
  font-family: 'Permanent Marker', cursive;
  font-size: 32px;
  margin-bottom: 10px;
}
.hero-title {
  font-family: 'Luckiest Guy', cursive;
  font-size: 64px;
  margin-bottom: 15px;
}
.hero-description {
  font-size: 15px;
  font-weight: 300;
  max-width: 600px;
  margin: 0 auto 30px;
  line-height: 1.6;
}
.search-container {
  width: 100%;
  max-width: 500px;
  margin: 0 auto;
  background-color: white;
  border-radius: 8px;
  display: flex;
  align-items: center;
  padding: 10px 16px;
  box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
}
.search-input {
  border: none;
  flex: 1;
  font-size: 15px;
  outline: none;
  padding: 4px 8px;
  background: transparent;
  color: #333;
}
.search-icon {
  font-size: 16px;
  color: #666;
  cursor: pointer;
}
</style>

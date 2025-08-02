<template>
  <nav
    class="navbar navbar-expand-lg"
    :class="isMobile ? 'navbar-dark bg-dark' : 'navbar-dark navbar-custom'"
  >
    <div class="container">
      <!-- Logo -->
      <router-link class="navbar-brand" to="/">
        <img
          src="@/assets/thumbnail/Icon/Jogja_Inside.webp"
          width="120"
          height="40"
          fetchpriority="high"
          decoding="async"
          loading="eager"
        />
      </router-link>

      <!-- Toggle button for mobile -->
      <button
        class="navbar-toggler"
        type="button"
        data-bs-toggle="collapse"
        data-bs-target="#navbarSupportedContent"
      >
        <span class="navbar-toggler-icon"></span>
      </button>

      <!-- Menu -->
      <div class="collapse navbar-collapse justify-content-end px-3 px-md-4" id="navbarSupportedContent">
        <ul class="navbar-nav mb-2 mb-lg-0">
          <li class="nav-item mx-3">
            <router-link class="nav-link active" to="/">Home</router-link>
          </li>

          <!-- Dropdown Destinasi -->
          <li class="nav-item dropdown mx-3">
            <a
              class="nav-link active dropdown-toggle"
              href="#"
              id="navbarDropdown"
              role="button"
              data-bs-toggle="dropdown"
              aria-expanded="false"
            >
              Destinasi
            </a>
            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
              <li>
                <router-link class="dropdown-item d-flex align-items-center" to="/Region/Yogyakarta">
                  <i class="fas fa-map-pin me-2"></i> Kota Yogyakarta
                </router-link>
              </li>
              <li>
                <router-link class="dropdown-item d-flex align-items-center" to="/Region/Bantul">
                  <i class="fas fa-map-pin me-2"></i> Kabupaten Bantul
                </router-link>
              </li>
              <li>
                <router-link class="dropdown-item d-flex align-items-center" to="/Region/Sleman">
                  <i class="fas fa-map-pin me-2"></i> Kabupaten Sleman
                </router-link>
              </li>
              <li>
                <router-link class="dropdown-item d-flex align-items-center" to="/Region/KulonProgo">
                  <i class="fas fa-map-pin me-2"></i> Kabupaten Kulon Progo
                </router-link>
              </li>
              <li>
                <router-link class="dropdown-item d-flex align-items-center" to="/Region/GunungKidul">
                  <i class="fas fa-map-pin me-2"></i> Kabupaten Gunungkidul
                </router-link>
              </li>
            </ul>
          </li>

          <li class="nav-item mx-3">
            <router-link class="nav-link active" to="/about">About</router-link>
          </li>
          <li class="nav-item mx-3">
            <router-link class="nav-link active" :to="{ path: '/about', hash: '#team' }">Team</router-link>
          </li>
        </ul>
      </div>
    </div>
  </nav>
</template>

<script>
export default {
  name: 'AppNavbar',
  data() {
    return {
      isMobile: false,
    };
  },
  mounted() {
    this.checkViewport();
    window.addEventListener('resize', this.checkViewport);
  },
  beforeDestroy() {
    window.removeEventListener('resize', this.checkViewport);
  },
  methods: {
    checkViewport() {
      this.isMobile = window.innerWidth <= 768;
    }
  }
};
</script>

<style scoped>
/* NAVBAR CUSTOM UNTUK DEKSTOP */
.navbar-custom {
  background-color: transparent;
  position: absolute;
  top: 0;
  width: 100%;
  padding-top: 15px;
  z-index: 3;
  transition: background-color 0.3s ease, top 0.3s;
}

.navbar-custom .nav-link {
  color: white;
}

/* Saat scroll: navbar tetap stylish */
.navbar-custom.scrolled {
  background-color: rgba(0, 0, 0, 0.9);
}

/* Dropdown Styling (berlaku di semua mode) */
.dropdown-menu {
  border-radius: 12px;
  box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
  padding: 10px 0;
  border: none;
}

.dropdown-item {
  padding: 10px 20px;
  display: flex;
  align-items: center;
  font-weight: 500;
  color: #000;
}

.dropdown-item i {
  margin-right: 10px;
  font-size: 18px;
}

.dropdown-item:hover {
  background-color: #f0f0f0;
  color: #000;
}
</style>

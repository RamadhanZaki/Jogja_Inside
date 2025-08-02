<template>
  <nav class="navbar navbar-expand-lg navbar-dark navbar-custom">
    <div class="container-fluid">

      <!-- LOGO optimized for LCP -->
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

      <!-- Navbar Menu -->
      <div class="collapse navbar-collapse d-flex justify-content-end" id="navbarSupportedContent">
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
                <router-link class="dropdown-item d-flex align-items-center" to="/yogyakarta">
                  <i class="fas fa-map-pin me-2"></i> Kota Yogyakarta
                </router-link>
              </li>
              <li>
                <router-link class="dropdown-item d-flex align-items-center" to="/region">
                  <i class="fas fa-map-pin me-2"></i> Kabupaten Bantul
                </router-link>
              </li>
              <li>
                <router-link class="dropdown-item d-flex align-items-center" to="/sleman">
                  <i class="fas fa-map-pin me-2"></i> Kabupaten Sleman
                </router-link>
              </li>
              <li>
                <router-link class="dropdown-item d-flex align-items-center" to="/kulonprogo">
                  <i class="fas fa-map-pin me-2"></i> Kabupaten Kulon Progo
                </router-link>
              </li>
              <li>
                <router-link class="dropdown-item d-flex align-items-center" to="/gunungkidul">
                  <i class="fas fa-map-pin me-2"></i> Kabupaten Gunungkidul
                </router-link>
              </li>
              <li>
                <router-link class="dropdown-item d-flex align-items-center" to="/destinasi">
                  <i class="fas fa-map-pin me-2"></i> Template Destinasi Wisata
                </router-link>
              </li>
            </ul>
          </li>

          <li class="nav-item mx-3">
            <router-link class="nav-link active" to="/about">About</router-link>
          </li>

          <!-- Search Box -->
          <form class="d-flex align-items-center mx-2">
            <div class="search-box position-relative">
              <input
                class="form-control custom-search"
                type="search"
                placeholder="Search"
                aria-label="Search"
              />
            </div>
          </form>

        </ul>
      </div>
    </div>
  </nav>
</template>

<script>
export default {
  name: 'AppNavbar'
};
</script>

<style scoped>
/*------------------------------------------------------------- Navbar -----------------------------------------------------------------------*/
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

.navbar-custom.scrolled {
  background-color: rgba(0, 0, 0, 0.9);
}

/* Dropdown Menu */
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

/* Search Box */
.search-box {
  position: relative;
  width: 200px;
}

.custom-search {
  padding-left: 40px;
  padding-right: 15px;
  border-radius: 50px !important;
  width: 100%;
  height: 35px;
  box-sizing: border-box;
  font-size: 14px;
}

/* Responsive */
@media (max-width: 768px) {
  .navbar-toggler {
    display: block;
  }

  .navbar-collapse {
    display: none !important;
  }

  .navbar-collapse.show {
    display: block !important;
  }

  .navbar-nav {
    display: flex;
    flex-direction: column;
    align-items: flex-start;
    width: 100%;
    padding-left: 0;
    margin-left: 0;
  }

  .navbar-nav li {
    text-align: left;
  }

  .navbar-nav a {
    display: block;
  }
}
</style>
<template>
  <section class="banner-wrapper">
    <div class="container">
      <div class="banner-bottom">
        <div class="text-content">
          <h2 class="title">
            Nikmatin liburanmu, biar<br />
            kami kasih rekomendasi terbaiknya
          </h2>
          <a
            href="https://jogja-inside.my.id/"
            target="_blank"
            class="wa-button"
          >
            Jogja-Inside
          </a>
        </div>
        <div class="image-container">
          <img
            src="@/assets/Home/traveler.png"
            alt="Traveler"
            class="traveler-img"
          />
        </div>
      </div>
    </div>
  </section>
</template>

<script>
export default {
  name: "BannerBottom",
};
</script>

<style scoped>
@import url("https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap");

.banner-wrapper {
  background: white;
  padding: 120px 0 80px;
  position: relative;
  overflow: visible; /* ✅ agar img yang keluar tetap terlihat */
}

.container {
  max-width: 1060px;
  margin: 0 auto;
  padding: 0 15px;
  box-sizing: border-box;
}

.banner-bottom {
  background-color: #64a3d7;
  padding: 60px 30px; /* ✅ tambah tinggi */
  display: flex;
  justify-content: space-between;
  align-items: center;
  position: relative;
  overflow: visible;
}

.text-content {
  color: white;
  font-family: "Poppins", sans-serif;
  max-width: 50%;
  z-index: 2;
}

.title {
  font-size: 2.2rem;
  font-weight: 600;
  line-height: 1.4;
  margin-bottom: 24px;
}

.wa-button {
  display: inline-block;
  background-color: white;
  color: #64a3d7;
  font-size: 0.95rem;
  font-weight: 500;
  padding: 12px 26px;
  border-radius: 50px;
  text-decoration: none;
  transition: background-color 0.3s ease;
}

.wa-button:hover {
  background-color: #e4f0fa;
}

.image-container {
  position: relative;
  width: 50%;
  display: flex;
  justify-content: flex-end;
  z-index: 1;
}

.traveler-img {
  position: absolute;
  bottom: -230px; /* ✅ tetap terlihat keluar dari bawah */
  right: -20px;
  width: 400px;
  z-index: 0;
}

@media (max-width: 768px) {
  .banner-wrapper {
    padding: 80px 0 60px; /* sedikit dikurangi */
  }

  .title {
    font-size: 1.3rem;
    line-height: 1.5;
    margin-bottom: 18px;
  }

  .wa-button {
    font-size: 0.85rem;
    padding: 10px 20px;
  }

  .traveler-img {
    width: 260px;
    bottom: -120px;
    right: -10px;
  }

  .banner-bottom {
    padding: 40px 20px;
  }
}

</style>

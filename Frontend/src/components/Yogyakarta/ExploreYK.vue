<template>
  <section class="top-destinasi-wrapper">
    <div class="container">
      <!-- SECTION 1: Sejarah Kota Yogyakarta -->
      <div class="destinasi-box">
        <div class="text">
          <h1>SEJARAH KOTA YOGYAKARTA</h1>
          <p>
            Kota Yogyakarta lahir dari sejarah panjang Kerajaan Mataram dan perjanjian Giyanti pada tahun 1755 yang membagi wilayah Mataram menjadi Kesultanan Yogyakarta dan Kasunanan Surakarta.
            Sejak saat itu, Yogyakarta berkembang sebagai pusat budaya, pendidikan, dan pemerintahan.
            Kota ini menjadi saksi perjuangan kemerdekaan Indonesia, bahkan pernah menjadi ibu kota Republik Indonesia pada tahun 1946–1949.
            Hingga kini, Yogyakarta tetap mempertahankan statusnya sebagai daerah istimewa yang dipimpin oleh Sultan sebagai Gubernur.
          </p>
        </div>
        <div class="img">
          <img src="@/assets/Yogyakarta1.jpg" alt="Sejarah Yogyakarta" />
          <div class="overlay left"></div>
        </div>
      </div>

      <!-- SECTION 2: Wisata Unggulan Yogyakarta -->
      <div class="destinasi-box">
        <div class="img">
          <img src="@/assets/Yogyakarta2.jpg" alt="Wisata Yogyakarta" />
          <div class="overlay right"></div>
        </div>
        <div class="text">
          <h1>DESTINASI WISATA KOTA YOGYAKARTA</h1>
          <p>
            Kota Yogyakarta menawarkan berbagai destinasi wisata budaya dan sejarah yang ikonik.
            Mulai dari Keraton Yogyakarta yang menjadi pusat kebudayaan Jawa, Taman Sari sebagai bekas taman kerajaan, hingga Jalan Malioboro yang ramai dengan wisata belanja dan kuliner.
            Kota ini juga dikenal sebagai kota pelajar, dengan banyak museum edukatif seperti Museum Benteng Vredeburg dan Sonobudoyo.
            Yogyakarta adalah perpaduan sempurna antara tradisi dan modernitas yang menjadikannya magnet wisata nasional maupun internasional.
          </p>
        </div>
      </div>
    </div>
  </section>
</template>

<script>
export default {
  name: 'TopDestinasiYogyakarta'
};
</script>


<style scoped>
.top-destinasi-wrapper {
  padding: 2rem 0;
  background: white;
}

.container {
  max-width: 1060px;
  margin: 0 auto;
  padding: 0 15px;
  box-sizing: border-box;
}

.destinasi-box {
  display: flex;
  position: relative;
  background: white;
  overflow: hidden;
  margin-bottom: 40px;
}

.img {
  flex: 1.3;
  position: relative;
  min-height: 280px;
}

.img img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  display: block;
}

.text {
  flex: 0.9;
  padding: 25px;
  display: flex;
  flex-direction: column;
  justify-content: center;
}

.text h1 {
  font-size: 26px;
  font-weight: 700;
  margin-bottom: 16px;
  color: #1a1a1a;
}

.text p {
  font-size: 16.5px;
  line-height: 1.9;
  color: #333;
  text-align: justify;
}

.overlay {
  position: absolute;
  top: 0;
  bottom: 0;
  width: 180px;
  z-index: 3;
  pointer-events: none;
}

.overlay.left {
  left: 0;
  background: linear-gradient(to right, rgba(255,255,255,1), rgba(255,255,255,0));
}

.overlay.right {
  right: 0;
  background: linear-gradient(to left, rgba(255,255,255,1), rgba(255,255,255,0));
}

@media (max-width: 768px) {
  .destinasi-box {
    flex-direction: column;
    align-items: center;
    margin-bottom: 30px;
  }

  .img {
    min-height: 200px;
    width: 100%;
  }

  .text {
    padding: 20px;
    text-align: center;
  }

  .text h1 {
    font-size: 20px;
  }

  .text p {
    font-size: 15px;
    text-align: justify;
  }

  .overlay {
    display: none;
  }
}
</style>

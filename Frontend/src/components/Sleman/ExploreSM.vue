<template>
  <section class="top-destinasi-wrapper">
    <div class="container">
      <!-- SECTION 1: Sejarah Awal Sleman -->
      <div class="destinasi-box">
        <div class="text">
          <h1>ASAL-USUL KABUPATEN SLEMAN</h1>
          <p>
            Kabupaten Sleman merupakan salah satu kabupaten di Daerah Istimewa Yogyakarta yang memiliki peran penting dalam sejarah dan budaya Jawa.
            Wilayah ini telah dikenal sejak masa Kerajaan Mataram Kuno, dan banyak situs purbakala seperti Candi Prambanan, Candi Sambisari, dan Candi Kalasan menjadi saksi sejarahnya.
            Secara administratif, Kabupaten Sleman dibentuk secara resmi pada tahun 1945, dan menjadi daerah yang strategis karena berbatasan langsung dengan Provinsi Jawa Tengah serta memiliki Gunung Merapi sebagai ikon alam dan budaya.
            Sleman berkembang pesat dalam sektor pendidikan, pertanian, serta pariwisata.
          </p>
        </div>
        <div class="img">
          <img src="@/assets/Sleman1.jpeg" alt="Sejarah Sleman" />
          <div class="overlay left"></div>
        </div>
      </div>

      <!-- SECTION 2: Rekomendasi Wisata Sleman -->
      <div class="destinasi-box">
        <div class="img">
          <img src="@/assets/Sleman2.jpg" alt="Wisata Sleman" />
          <div class="overlay right"></div>
        </div>
        <div class="text">
          <h1>DESTINASI WISATA UNGGULAN SLEMAN</h1>
          <p>
            Sleman memiliki banyak destinasi wisata menarik yang menjadi daya tarik utama wisatawan di Yogyakarta.
            Beberapa tempat yang populer antara lain Kaliurang yang sejuk dengan pemandangan Gunung Merapi, Merapi Lava Tour menggunakan jeep, serta berbagai candi bersejarah seperti Prambanan, Sambisari, dan Ratu Boko.
            Tidak hanya itu, Sleman juga menawarkan wisata edukatif seperti Museum Gunungapi Merapi, Agrowisata salak pondoh, dan Desa Wisata Pentingsari.
            Sleman adalah pilihan tepat untuk wisata alam, budaya, sekaligus edukasi dalam satu paket perjalanan.
          </p>
        </div>
      </div>
    </div>
  </section>
</template>

<script>
export default {
  name: 'TopDestinasiGunungkidul'
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

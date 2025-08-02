<template>
  <section class="top-destinasi-wrapper">
    <div class="container">
      <!-- SECTION 1: Sejarah Awal -->
      <div class="destinasi-box">
        <div class="text">
          <h1>ASAL-USUL KABUPATEN GUNUNGKIDUL</h1>
          <p>
            Kabupaten Gunungkidul merupakan salah satu wilayah di Daerah Istimewa Yogyakarta yang memiliki sejarah panjang.
            Berdasarkan catatan sejarah, Gunungkidul mulai dikenal sejak masa Kerajaan Mataram Islam. Wilayah ini dahulu dikenal dengan sebutan Wonosari dan sebagian besar berupa hutan dan pegunungan kapur.
            Pada masa pemerintahan Sultan Hamengkubuwono IX, dilakukan pembagian administratif yang kemudian menetapkan Gunungkidul sebagai kabupaten tersendiri pada tanggal 27 Mei 1948.
            Penetapan ini menjadi tonggak penting dalam sejarah daerah ini sebagai wilayah yang mandiri dalam pemerintahan dan pembangunan.
          </p>
        </div>
        <div class="img">
          <img src="@/assets/GK1.jpg" alt="Sejarah Gunungkidul" />
          <div class="overlay left"></div>
        </div>
      </div>

      <!-- SECTION 2: Rekomendasi Wisata -->
      <div class="destinasi-box">
        <div class="img">
          <img src="@/assets/GK2.jpg" alt="Wisata Gunungkidul" />
          <div class="overlay right"></div>
        </div>
        <div class="text">
          <h1>DESTINASI WISATA UNGGULAN GUNUNGKIDUL</h1>
          <p>
            Gunungkidul terkenal dengan deretan destinasi wisata alamnya yang memukau.
            Beberapa tempat yang wajib dikunjungi antara lain Pantai Indrayanti dengan pasir putih dan ombaknya yang tenang, Goa Pindul yang menawarkan pengalaman cave tubing yang seru, serta Air Terjun Sri Gethuk yang memesona di tengah pedesaan.
            Selain itu, wisatawan juga dapat menikmati keindahan Bukit Bintang, Hutan Pinus Pengger, dan Embung Nglanggeran.
            Gunungkidul adalah pilihan terbaik untuk kamu yang ingin menjelajahi sisi alami Yogyakarta yang belum banyak dijamah.
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

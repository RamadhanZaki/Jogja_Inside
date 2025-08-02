<template>
  <section class="top-destinasi-wrapper">
    <div class="container">
      <!-- SECTION 1: Sejarah Kulon Progo -->
      <div class="destinasi-box">
        <div class="text">
          <h1>SEJARAH KABUPATEN KULON PROGO</h1>
          <p>
            Kabupaten Kulon Progo terbentuk pada tahun 1951 melalui penggabungan dua wilayah, yaitu Kabupaten Kulon dan Kabupaten Naggulan.
            Nama "Kulon Progo" sendiri berasal dari letaknya yang berada di sebelah barat (kulon) Sungai Progo.
            Wilayah ini memiliki sejarah panjang sebagai bagian dari Kasultanan Yogyakarta dan dikenal sebagai kawasan pertanian serta jalur penting sejak zaman kolonial.
            Kini, Kulon Progo terus berkembang sebagai daerah wisata yang menawarkan pesona alam dan budaya lokal yang otentik.
          </p>
        </div>
        <div class="img">
          <img src="@/assets/KulonProgo1.jpeg" alt="Sejarah Kulon Progo" />
          <div class="overlay left"></div>
        </div>
      </div>

      <!-- SECTION 2: Wisata Kulon Progo -->
      <div class="destinasi-box">
        <div class="img">
          <img src="@/assets/KulonProgo2.jpg" alt="Wisata Kulon Progo" />
          <div class="overlay right"></div>
        </div>
        <div class="text">
          <h1>DESTINASI WISATA KULON PROGO</h1>
          <p>
            Kulon Progo memiliki banyak destinasi wisata alam yang menakjubkan seperti Kebun Teh Nglinggo, Puncak Suroloyo, Air Terjun Kedung Pedut, dan Kalibiru yang terkenal dengan gardu pandangnya.
            Selain keindahan alam, Kulon Progo juga menawarkan pengalaman budaya khas pedesaan Jawa.
            Dukungan infrastruktur seperti Bandara Internasional Yogyakarta (YIA) turut mendorong peningkatan pariwisata di wilayah ini.
            Kulon Progo adalah pilihan ideal bagi wisatawan yang ingin menikmati suasana tenang, alami, dan penuh makna.
          </p>
        </div>
      </div>
    </div>
  </section>
</template>

<script>
export default {
  name: 'TopDestinasiKulonProgo'
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

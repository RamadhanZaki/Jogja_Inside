<template>
  <section class="top-destinasi-wrapper">
    <div class="container">
      <!-- SECTION 1: Sejarah Awal Bantul -->
      <div class="destinasi-box">
        <div class="text">
          <h1>ASAL-USUL KABUPATEN BANTUL</h1>
          <p>
            Kabupaten Bantul adalah salah satu wilayah administratif di Daerah Istimewa Yogyakarta yang memiliki akar sejarah kuat dengan Kesultanan Yogyakarta.
            Wilayah ini telah dihuni sejak zaman Kerajaan Mataram Kuno, dengan berbagai peninggalan arkeologis seperti Candi Gampingan dan situs-situs kuno lainnya.
            Secara resmi, Kabupaten Bantul dibentuk pada tanggal 20 Juli 1831, dan dikenal sebagai wilayah agraris yang kuat dengan perkembangan budaya Jawa yang kental.
            Bantul juga memiliki peran penting dalam sejarah perjuangan kemerdekaan Indonesia, termasuk sebagai jalur gerilya dan pertahanan rakyat.
          </p>
        </div>
        <div class="img">
          <img src="@/assets/Bantul1.jpeg" alt="Sejarah Bantul" />
          <div class="overlay left"></div>
        </div>
      </div>

      <!-- SECTION 2: Rekomendasi Wisata Bantul -->
      <div class="destinasi-box">
        <div class="img">
          <img src="@/assets/Bantul2.jpg" alt="Wisata Bantul" />
          <div class="overlay right"></div>
        </div>
        <div class="text">
          <h1>DESTINASI WISATA UNGGULAN BANTUL</h1>
          <p>
            Bantul menyimpan banyak destinasi wisata favorit yang menarik wisatawan lokal maupun mancanegara.
            Beberapa tempat yang tak boleh dilewatkan antara lain Pantai Parangtritis yang legendaris dengan sunset-nya yang menakjubkan, Gumuk Pasir Parangkusumo untuk bermain sandboarding, dan Hutan Pinus Mangunan yang menyuguhkan pemandangan asri dari atas bukit.
            Tidak hanya itu, wisatawan juga bisa menikmati Kampung Batik Giriloyo, Puncak Becici, serta jalur sepeda dan kuliner khas di sepanjang Jalan Parangtritis.
            Bantul merupakan perpaduan sempurna antara keindahan alam, budaya, dan petualangan.
          </p>
        </div>
      </div>
    </div>
  </section>
</template>




<script>
export default {
  name: 'TopDestinasiBantul'
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

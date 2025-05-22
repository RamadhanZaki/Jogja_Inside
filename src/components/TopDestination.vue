<template>
  <section>
    <!-- SECTION 1: gambar kanan -->
    <div ref="section1" class="top-destinasi section1">
      <div class="content">
        <h1>PESONA ALAM YOGYAKARTA</h1>
        <p>
          Yogyakarta bukan hanya tentang sejarah dan budaya, tetapi juga surga bagi para pencinta alam. 
          Dikelilingi oleh hamparan sawah hijau, pegunungan megah, pantai eksotis, dan gua-gua tersembunyi, Yogyakarta menawarkan pemandangan alam yang memesona dan penuh ketenangan.
          Dari sunrise keemasan di Bukit Panguk Kediwung, semilir angin di atas Tebing Breksi, hingga deru ombak yang memecah di Pantai Timang, setiap sudut Yogyakarta adalah lukisan alam yang hidup. 
          Kabut pagi yang menyelimuti Gunung Merapi, dan gemericik air di Air Terjun Sri Gethuk, menghadirkan suasana magis yang sulit dilupakan.
          Nikmati petualangan menyusuri hutan tropis, menelusuri aliran sungai bawah tanah di Gua Pindul, atau sekadar duduk bersantai sambil menikmati panorama alam yang menenangkan jiwa.
        </p>
      </div>
      <div class="image-section">
        <img
          loading="lazy"
          :src="require('@/assets/Background/Home.webp')"
          alt="Natural Wonder"
        />
      </div>
    </div>

    <!-- SECTION 2: gambar kiri -->
    <div ref="section2" class="top-destinasi section2">
      <div class="image-section">
        <img
          loading="lazy"
          :src="require('@/assets/Destinasi/GunungKidul/Pantai/Sedahan/IMG_1002.jpg')"
          alt="Another Wonder"
        />
      </div>
      <div class="content">
        <h1>KERAMAHAN YANG MENYENTUH HATI</h1>
        <p>
          Lebih dari sekadar tempat wisata, Yogyakarta istimewa karena orang-orangnya. 
          Warga Jogja dikenal dengan keramahan, sopan santun, dan ketulusannya dalam menyambut tamu. 
          Di setiap sudut kota, kamu akan disambut dengan senyum hangat dan sapaan ramah yang membuatmu merasa seperti di rumah sendiri.
          Masyarakat Jogja sangat menjunjung tinggi nilai-nilai budaya dan kearifan lokal. 
          Mereka hidup dalam harmoni, menjaga tradisi leluhur, namun tetap terbuka terhadap perubahan zaman. 
          Di tengah kesederhanaan, tersimpan sikap saling menghargai yang begitu kental terasa.
          Entah saat kamu berbincang dengan penjual angkringan, bertanya arah pada warga lokal, 
          atau ikut serta dalam kegiatan budaya — kamu akan merasakan kehangatan dan ketulusan yang menjadi ciri khas kehidupan di Yogyakarta.
        </p>
      </div>
    </div>
  </section>
</template>

<script>
export default {
  name: "TopDestinasi",
  mounted() {
    const options = { threshold: 0.1 };

    this.observer = new IntersectionObserver(this.handleIntersect, options);

    if (this.$refs.section1) this.observer.observe(this.$refs.section1);
    if (this.$refs.section2) this.observer.observe(this.$refs.section2);
  },
  beforeDestroy() {
    if (this.observer) this.observer.disconnect();
  },
  methods: {
    handleIntersect(entries) {
      entries.forEach(entry => {
        if (entry.isIntersecting) {
          if (entry.target === this.$refs.section1) {
            entry.target.classList.add("fadeInRight");
          } else if (entry.target === this.$refs.section2) {
            entry.target.classList.add("fadeInLeft");
          }
          this.observer.unobserve(entry.target);
        }
      });
    }
  }
};
</script>

<style scoped>


.top-destinasi {
  display: flex;
  align-items: center;
  gap: 20px;
  background: #fff;
  font-family: sans-serif;
  padding: 50px 0 50px 50px;
  will-change: transform, opacity; /* Optimasi animasi */
}

.content {
  flex: 1;
  padding: 0 30px 0 50px;
  display: flex;
  flex-direction: column;
  justify-content: center;
  height: auto;
}

.content h1 {
  font-size: 32px;
  font-weight: bold;
  color: #2e2e2e;
  margin: 0 0 20px 0;
  line-height: 1.2;
}

.content p {
  font-size: 16px;
  line-height: 1.8;
  color: #333;
  margin-bottom: 30px;
  text-align: justify;
}

.content button {
  padding: 10px 10px;
  background-color: #2c6f63;
  color: #fff;
  font-weight: bold;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  align-self: flex-start;
}

.image-section {
  flex: 1;
  display: flex;
  justify-content: flex-end;
  align-items: center;
  padding: 0;
  margin: 0;
}

.image-section img {
  width: 100%;
  max-width: 500px;
  height: auto;
  border-radius: 2px;
  display: block;
  margin: 0;
  object-fit: cover;
}

/* SECTION 2: gambar kiri, teks kanan, gambar mepet kiri */
.top-destinasi.section2 {
  flex-direction: row;
  padding: 50px 0;
}

.top-destinasi.section2 .image-section {
  justify-content: flex-start;
  padding: 0;
  margin: 0;
}

.top-destinasi.section2 .image-section img {
  width: 100%;
  max-width: 500px;
  object-fit: cover;
  display: block;
}

.top-destinasi.section2 .content {
  padding-left: 50px;
  padding-right: 50px;
}

/*=============================================================== Animasi ==================================================================== */

@keyframes fadeInRight {
  from {
    opacity: 0;
    transform: translateX(50px);
  }
  to {
    opacity: 1;
    transform: translateX(0);
  }
}

@keyframes fadeInLeft {
  from {
    opacity: 0;
    transform: translateX(-50px);
  }
  to {
    opacity: 1;
    transform: translateX(0);
  }
}

.fadeInRight {
  animation: fadeInRight 1s ease forwards;
}

.fadeInLeft {
  animation: fadeInLeft 1s ease forwards;
}

/*=============================================================== MOBILE ==================================================================== */
@media (max-width: 768px) {
  /* Nonaktifkan animasi fadeInRight dan fadeInLeft di mobile */
  .fadeInRight,
  .fadeInLeft {
    animation: none !important;
    opacity: 1 !important;
    transform: none !important;
  }

  .top-destinasi,
  .top-destinasi.section2 {
    flex-direction: column;
    padding: 30px 20px;
  }

  .intro-text {
    order: 1;
    padding: 0 15px;
    font-size: 14px;
    text-align: justify;
  }

  .image-section {
    order: 2;
    justify-content: center;
    margin-bottom: 20px;
  }

  .image-section img {
    width: 100%;
    height: auto;
    border-radius: 2px;
  }

  .content {
    order: 3;
    padding: 0;
    text-align: center;
    display: flex;
    flex-direction: column;
    align-items: center;
  }

  .content h1 {
    font-size: 24px;
    margin-bottom: 15px;
  }

  .content p {
    font-size: 14px;
    margin-bottom: 20px;
  }

  .content button {
    align-self: center;
  }
}
</style>

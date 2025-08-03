<template>
  <section class="top-destinasi-wrapper">
    <div class="container">
      <!-- SECTION 1 -->
      <div class="destinasi-box">
        <div class="text">
          <h1>PESONA ALAM YOGYAKARTA</h1>
          <p>
            Yogyakarta bukan hanya tentang sejarah dan budaya, tetapi juga surga bagi para pencinta alam.
            Dikelilingi oleh hamparan sawah hijau, pegunungan megah, pantai eksotis, dan gua-gua tersembunyi,
            Yogyakarta menawarkan pemandangan alam yang memesona dan penuh ketenangan.
            Dari sunrise keemasan di Bukit Panguk Kediwung, semilir angin di atas Tebing Breksi,
            hingga deru ombak yang memecah di Pantai Timang, setiap sudut Yogyakarta adalah lukisan alam yang hidup.
          </p>
        </div>
        <div class="img">
          <img src="@/assets/Background/Home.jpg" alt="Pesona Alam" />
          <div class="overlay left"></div>
        </div>
      </div>

      <!-- SECTION 2 -->
      <div class="destinasi-box">
        <div class="img">
          <img src="@/assets/Mabhh.jpeg" alt="Keramahan" />
          <div class="overlay right"></div>
        </div>
        <div class="text">
          <h1>KERAMAHAN YANG MENYENTUH HATI</h1>
          <p>
            Lebih dari sekadar tempat wisata, Yogyakarta istimewa karena orang-orangnya.
            Warga Jogja dikenal dengan keramahan, sopan santun, dan ketulusannya dalam menyambut tamu.
            Di setiap sudut kota, kamu akan disambut dengan senyum hangat dan sapaan ramah
            yang membuatmu merasa seperti di rumah sendiri.
          </p>
        </div>
      </div>
    </div>
  </section>
</template>

<script>
export default {
  name: 'TopDestinasi'
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
    display: flex;
    flex-direction: column;
    align-items: center;
    margin-bottom: 30px;
  }

  .img {
    min-height: 200px;
    width: 100%;
    background-size: cover;
    background-position: center;
  }

  .img-1 {
    order: 1;
  }

  .section-title {
    order: 2;
    font-size: 22px;
    margin: 16px 0;
    text-align: center;
  }

  .img-2 {
    order: 3;
  }

  .text {
    order: 4;
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

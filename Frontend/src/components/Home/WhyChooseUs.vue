<template>
  <section class="why-us-section">
    <div class="container">
      <!-- HEADER -->
      <div class="why-header">
        <h2 class="why-title">Mengapa Memilih Jogja-Inside?</h2>
        <p class="why-subtitle">
          Jogja-Inside hadir sebagai panduan wisata terpercaya yang menghadirkan informasi akurat, lengkap, dan inspiratif mengenai destinasi terbaik di Yogyakarta. 
          Temukan tempat tersembunyi, budaya lokal, kuliner lezat, serta pengalaman autentik yang membuat perjalanan Anda lebih bermakna.
        </p>
      </div>

      <!-- CARD GRID -->
      <div class="why-grid">
        <div v-for="(item, index) in whyItems" :key="index" class="why-card">
          <div class="why-icon">
            <i :class="['fas', item.icon]"></i>
          </div>
          <h3 class="why-card-title">{{ item.title }}</h3>
          <p class="why-card-desc">{{ item.desc }}</p>
        </div>
      </div>
    </div>
  </section>
</template>

<script>
export default {
  name: "WhyChooseUs",
  data() {
    return {
      whyItems: [
        {
          icon: "fa-map-marked-alt",
          title: "Destinasi Lengkap",
          desc: "Dari pantai tersembunyi hingga pegunungan eksotis, kami sajikan beragam destinasi wisata di seluruh wilayah Yogyakarta.",
        },
        {
          icon: "fa-compass",
          title: "Panduan Lokal",
          desc: "Rekomendasi dari warga lokal dan traveler berpengalaman untuk pengalaman yang lebih autentik dan mendalam.",
        },
        {
          icon: "fa-utensils",
          title: "Kuliner Khas Jogja",
          desc: "Nikmati berbagai kuliner khas seperti gudeg, bakpia, dan angkringan dengan info lokasi terbaik dan harga terjangkau.",
        },
        {
          icon: "fa-heart",
          title: "Wisata Ramah & Nyaman",
          desc: "Cocok untuk keluarga, solo traveler, atau honeymoon—kami bantu Anda temukan suasana liburan yang nyaman dan bersahabat.",
        },
      ],
    };
  },
};
</script>

<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@400;600;700&display=swap');

.why-us-section {
  background: #ffffff;
  padding: 80px 0;
  font-family: 'Montserrat', sans-serif;
}

.container {
  max-width: 1060px;
  margin: auto;
  padding: 0 15px;
}

/* HEADER */
.why-header {
  max-width: 900px;
  margin-bottom: 60px;
}

.why-title {
  font-size: 22px;
  font-weight: 700;
  color: #000;
  margin-bottom: 16px;
  text-align: left;
}

.why-subtitle {
  font-size: 14px;
  color: #333;
  line-height: 1.75;
  text-align: justify;
  max-width: 700px;
}

/* GRID */
.why-grid {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  gap: 40px;
}

/* CARD */
.why-card {
  background-color: #fff;
  border-radius: 16px;
  padding: 40px 24px;
  box-shadow: 0 6px 20px rgba(0, 0, 0, 0.08), 0 0 0 1px rgba(0, 0, 0, 0.05);
  display: flex;
  flex-direction: column;
  align-items: center;
  height: 100%;
  transition: all 0.3s ease;
  text-align: center;
}

.why-icon {
  font-size: 50px; /* diperbesar */
  color: #64a3d7;
  margin-bottom: 20px;
  text-align: center;
}

/* Text */
.why-card-title {
  font-size: 20px;
  font-weight: 700;
  margin-bottom: 10px;
  color: #000;
}

.why-card-desc {
  font-size: 14px;
  color: #555;
  line-height: 1.7;
}

/* RESPONSIVE */
@media (max-width: 1024px) {
  .why-grid {
    grid-template-columns: repeat(2, 1fr);
    gap: 30px;
  }
}

@media (max-width: 768px) {
  .why-grid {
    grid-template-columns: 1fr;
  }

  .why-header {
    text-align: center;
  }

  .why-title {
    text-align: center;
  }

  .why-subtitle {
    text-align: center;
    max-width: 100%;
  }

  .why-card {
    align-items: center;
    text-align: center;
  }

  .why-card-title,
  .why-card-desc {
    text-align: center;
  }
}
</style>

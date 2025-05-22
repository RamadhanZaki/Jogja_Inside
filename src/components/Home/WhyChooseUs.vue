<template>
  <section class="why-us-section" aria-labelledby="why-us-heading">
    <div class="why-title-wrapper">
      <h2 id="why-us-heading" class="why-title">Why Us?</h2>
    </div>
    <div class="container">
      <div class="why-grid">
        <div v-for="(item, index) in whyItems" :key="index" class="why-item">
          <i :class="['icon', item.icon]" aria-hidden="true"></i>
          <div class="text-box">
            <h3>{{ item.title }}</h3>
            <p>{{ item.desc }}</p>
          </div>
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
          icon: 'fas fa-compass',
          title: 'Eksplorasi Autentik',
          desc: 'Temukan pengalaman wisata dari perspektif lokal, bukan sekadar destinasi viral.',
        },
        {
          icon: 'fas fa-map',
          title: 'Hidden Gems Terpilih',
          desc: 'Bantu kamu temukan sudut tersembunyi Jogja yang belum banyak orang tahu.',
        },
        {
          icon: 'fas fa-user-check',
          title: 'Rekomendasi Personal',
          desc: 'Konten kurasi berbasis riset, bukan sekadar iklan.',
        },
        {
          icon: 'fas fa-hiking',
          title: 'Siap Jelajah, Kapan Saja',
          desc: 'Panduan praktis dan informasi up-to-date agar kamu bisa langsung menjelajah.',
        }
      ]
    };
  }
};
</script>

<style scoped>
.why-us-section {
  display: grid;
  grid-template-columns: auto 1fr;
  align-items: flex-start;
  gap: 40px;
  padding: 100px 40px 80px; /* Padding horizontal kanan-kiri sama */
  background-color: #fff;
  color: #000;
  min-height: auto; /* atau hapus baris ini */
}

.why-title-wrapper {
  display: flex;
  align-items: flex-start;
  padding-top: 10px;
  margin-bottom: 40px;
}

.why-title {
  font-size: 60px;
  font-weight: 700;
  font-family: 'Montserrat', sans-serif;
  color: #000;
  white-space: nowrap;
}

.container {
  flex: 1;
  max-width: 1200px;
  padding-left: 0; /* Dihilangkan agar simetris */
}

.why-grid {
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  gap: 60px 40px;
  margin-left: 40px;
}

.why-item {
  display: flex;
  align-items: flex-start;
  gap: 16px;
  max-width: 480px;
}

.icon {
  font-size: 40px;
  color: #007bff; /* Bootstrap primary color */
  flex-shrink: 0;
  margin-top: 4px;
}

.text-box {
  max-width: 400px;
}

.text-box h3 {
  font-size: 16px;
  font-weight: 600;
  margin: 0 0 6px;
  color: #000;
  font-family: 'Montserrat', sans-serif;
}

.text-box p {
  font-size: 14px;
  color: #444;
  margin: 0;
  line-height: 1.5;
  word-break: break-word;
  text-align: justify;
}

/* Responsive */
@media (max-width: 768px) {
  .why-us-section {
    grid-template-columns: 1fr;
    padding: 80px 20px 80px; /* Tambah padding atas dan bawah */
  }

  .why-title-wrapper {
    justify-content: center;
    padding-top: 0;
    margin-bottom: 40px; /* Tambah jarak bawah heading */
  }

  .why-title {
    font-size: 26px; /* Sedikit lebih besar untuk keterbacaan */
    text-align: center;
  }

  .container {
    padding-left: 0;
  }

  .why-grid {
    grid-template-columns: 1fr;
    gap: 48px; /* Tambah jarak antar item */
    margin-left: 0;
  }

  .why-item {
    flex-direction: column; /* Stack icon & text vertically */
    align-items: center;
    text-align: center;
  }

  .icon {
    margin-top: 0;
    margin-bottom: 12px;
  }

  .text-box h3 {
    font-size: 16px;
  }

  .text-box p {
    font-size: 14px;
    text-align: center; /* Tengah untuk lebih rapi */
  }
}

</style>

<template>
  <div class="about">
    <Navbar />
    <section class="about-section d-flex align-items-center">
      <div class="container about-content" ref="aboutContent">
        <h1 class="about-title" aria-label="Tentang Jogja Inside">ABOUT</h1>
        <div class="row align-items-center">
          <!-- Gambar -->
          <div class="col-md-6 order-1 order-md-2 text-center">
            <img
              src="@/assets/team.jpg"
              alt="Foto Tim Jogja Inside"
              class="about-img"
              loading="eager"
              fetchpriority="high"
              role="img"
            />
          </div>

          <!-- Teks Deskripsi -->
          <div class="col-md-6 order-2 order-md-1 text-light text-justify">
            <p>
              Di tanah bertuah yang dipahat oleh sejarah dan budaya, Jogja Inside memulai perjalanannya pada tahun 2025. 
              Lahir dari semangat menyelesaikan Final Project mata kuliah Pemrograman Web, web ini tumbuh menjadi lebih dari sekadar tugas akademik tetapi menjelma menjadi penghormatan kecil untuk Yogyakarta, sang “Kota Pelajar” yang penuh pesona.
            </p>
            <p>
              Jogja Inside mengajak setiap penjelajah untuk menyibak sisi lain Yogyakarta dari lorong-lorong sunyi yang berhiaskan mural, kafe-kafe tersembunyi yang memeluk tradisi, hingga bentang alam yang masih perawan. 
              Setiap artikel yang tertulis adalah serpihan kisah, dan setiap rekomendasi adalah denyut nadi Yogyakarta yang sejati.
            </p>
          </div>
        </div>
      </div>
    </section>

<!-- Team Section -->
<div class="container-fluid pt-5 pb-5 bg-light">
  <div class="container text-center">
    <h2 class="display-3" id="team">Developer Team</h2>
    <p>
      Kami adalah Team kreatif yang berkontribusi dalam membangun Jogja Inside, dari desain hingga pengembangan.
    </p>

    <!-- Loading Text Saja -->
    <div v-if="!teamMembers.length" class="d-flex justify-content-center align-items-center py-5">
      <div class="loading-text">Loading...</div>
    </div>

    <!-- Daftar Anggota Tim -->
    <div class="row pt-4 gx-4 gy-4 justify-content-center" v-else>
      <div
        v-for="member in teamMembers"
        :key="member.id"
        class="col-lg-3 col-md-4 col-sm-6 tim mb-4"
      >
        <img
          :src="getImageUrl(member.img)"
          :alt="`Foto ${member.name}`"
          class="rounded-circle mb-3"
          width="200"
          height="150"
          loading="lazy"
          role="img"
        />
        <h4>{{ member.name }}</h4>
        <p>{{ member.job }}</p>
        <p>
          <a
            :href="member.instagram"
            class="social"
            target="_blank"
            rel="noopener noreferrer"
            :aria-label="`Instagram ${member.name}`"
          >
            <i class="fab fa-instagram"></i>
          </a>
          <a
            :href="member.github"
            class="social"
            target="_blank"
            rel="noopener noreferrer"
            :aria-label="`GitHub ${member.name}`"
          >
            <i class="fab fa-github"></i>
          </a>
        </p>
      </div>
    </div>
  </div>
</div>


    <Footer />
  </div>
</template>

<script>
import axios from 'axios'
import Navbar from '@/components/Navbar.vue'
import Footer from '@/components/Footer.vue'

export default {
  name: 'AboutPage',
  components: {
    Navbar,
    Footer,
  },
  data() {
    return {
      teamMembers: [],
    }
  },
  mounted() {
    this.fetchTeamMembers()

    this.$nextTick(() => {
      const el = this.$refs.aboutContent
      if (!el) return
      const observer = new IntersectionObserver(
        ([entry]) => {
          el.classList.toggle('animate-slide-in', entry.isIntersecting)
        },
        { threshold: 0.5 }
      )
      observer.observe(el)
    })
  },
  methods: {
    async fetchTeamMembers() {
    try {
      const baseURL = process.env.VUE_APP_API_BASE || 'https://jogja-inside.my.id/api'
      const res = await axios.get(`${baseURL}/teams`, {
        headers: {
          'Cache-Control': 'max-age=3600',
        },
      })
      this.teamMembers = res.data
    } catch (err) {
      console.error('Gagal mengambil data tim:', err)
    }
  },
    getImageUrl(path) {
    if (!path) return ''
    const baseURL = 'https://jogja-inside.my.id'  // ← sebelumnya pakai http
    const cleaned = path.startsWith('/storage') ? path : `/storage/${path}`
    return `${baseURL}${cleaned}`
    },
  },
}
</script>

<style scoped>
@keyframes slideInFromLeft {
  0% {
    opacity: 0;
    transform: translateX(-50px);
  }
  100% {
    opacity: 1;
    transform: translateX(0);
  }
}

@keyframes blink {
  0% { opacity: 0.2; }
  50% { opacity: 1; }
  100% { opacity: 0.2; }
}

.loading-text {
  font-size: 1.5rem;
  font-weight: 500;
  color: #333;
  animation: blink 1.2s infinite;
}


.about-section {
  min-height: 100vh;
  background-image: url('@/assets/Background/About.webp');
  background-size: cover;
  background-position: center top;
  position: relative;
  padding: 0;
  margin-top: 0;
}

.about-section::before {
  content: "";
  position: absolute;
  inset: 0;
  background-color: rgba(0, 0, 0, 0.6);
  z-index: 1;
}

.about-content {
  position: relative;
  z-index: 2;
  opacity: 0;
  transform: translateX(-50px);
  transition: all 0.6s ease-out;
}

.animate-slide-in {
  opacity: 1;
  transform: translateX(0);
}

.about-title {
  font-size: 36px;
  font-weight: bold;
  color: white;
  text-align: center;
  font-family: 'Montserrat', sans-serif;
  margin-bottom: 40px;
}

.text-justify {
  text-align: justify;
}

.about-img {
  width: 550px;
  height: 300px;
  object-fit: cover;
  border: 3px solid #ffffff;
  border-radius: 15px;
  box-shadow: 0 0 10px rgba(0,0,0,0.3);
  display: block;
  margin: 0 auto;
  transform: translateY(-15px);
}

.about-content p {
  margin-bottom: 18px;
  line-height: 1.8;
}

@media (max-width: 767px) {
  .about-content {
    text-align: center;
    opacity: 1 !important;
    transform: none !important;
    transition: none !important;
  }

  .about-section {
    padding: 20px;
  }

  .about-img {
    width: 100%;
    height: auto;
    margin-bottom: 20px;
  }

  .about-title {
    font-size: 2rem;
  }

  .about-content p {
    font-size: 1rem;
    margin-bottom: 15px;
  }
}

.tim img {
  width: 100%;
  max-width: 150px;
  border: 5px solid #ccc;
}

a.social {
  display: inline-block;
  width: 40px;
  height: 40px;
  color: #fff;
  border-radius: 50%;
  background-color: #333;
  line-height: 40px;
  text-align: center;
  margin: 0 6px;
}
</style>

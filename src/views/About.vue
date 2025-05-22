<template>
  <div class="about">
    <Navbar />
    <!-- About Section -->
    <section class="about-section d-flex align-items-center">
      <div class="container about-content" ref="aboutContent">
        <h1 class="about-title">ABOUT</h1>
        <div class="row align-items-center">
          <!-- Gambar -->
          <div class="col-md-6 order-1 order-md-2 text-center">
            <img
              src="@/assets/thumbnail/Profile/Team.webp"
              alt="Foto Tim Jogja Inside"
              class="img-fluid about-img"
              loading="lazy"
              width="600"
              height="400"
            />
          </div>

          <!-- Teks -->
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

    <!-- Team -->
    <div class="container-fluid pt-5 pb-5 bg-light">
      <div class="container text-center">
        <h2 class="display-3" id="team">Tim</h2>
        <p>
          Kami adalah tim kreatif yang berkontribusi dalam membangun Jogja Inside, dari desain hingga pengembangan.
        </p>
        <div class="row pt-4 gx-4 gy-4 justify-content-center">

          <div
            v-for="member in teamMembers"
            :key="member.name"
            class="col-lg-3 col-md-4 col-sm-6 tim mb-4"
          >
            <img
              :src="require(`@/assets/thumbnail/Profile/${member.image}`)"
              :alt="member.name"
              class="rounded-circle mb-3"
              width="200"
              height="150"
              loading="lazy"
            />
            <h4>{{ member.name }}</h4>
            <p>{{ member.role }}</p>
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

import Navbar from '@/components/Navbar.vue'
import Footer from '@/components/Footer.vue';


export default {
  name: 'AboutPage',
  components: {
    Navbar,
    Footer,
  },
  data() {
    return {
      teamMembers: [
        {
          name: 'Debi Saputra',
          image: 'Debiiiiii.webp',
          role: 'Web Designer',
          instagram: 'https://www.instagram.com/d3bisptr4_/',
          github: 'https://github.com/DebiSaputra26'
        },
        {
          name: 'Kamil',
          image: 'mil.webp',
          role: 'Web Designer',
          instagram: 'https://www.instagram.com/kamilrizqullah21/',
          github: 'https://github.com/kamill21'
        },
        {
          name: 'Dito',
          image: 'dit.webp',
          role: 'Web Designer',
          instagram: 'https://www.instagram.com/d3bisptr4_/',
          github: 'https://github.com/DebiSaputra26'
        },
        {
          name: 'Kinah',
          image: 'kinaa.webp',
          role: 'UI/UX Designer',
          instagram: 'https://www.instagram.com/nasihaass_/',
          github: 'https://github.com/nasihaassakinah'
        },
        {
          name: 'Natasya',
          image: 'syaa.webp',
          role: 'UI/UX Designer',
          instagram: 'https://www.instagram.com/szaasyy/',
          github: 'https://github.com/Asyaa415'
        },
        {
          name: 'Jeffry',
          image: 'Jeff.webp',
          role: 'Front End Developer',
          instagram: 'https://www.instagram.com/d3bisptr4_/',
          github: 'https://github.com/DebiSaputra26'
        },
        {
          name: 'Jukii',
          image: 'juk.webp',
          role: 'Bagian Beli Es Teh',
          instagram: 'https://www.instagram.com/d3bisptr4_/',
          github: 'https://github.com/DebiSaputra26'
        }
      ]
    }
  },
  mounted() {
    this.$nextTick(() => {
      const el = this.$refs.aboutContent;
      if (!el) return;

      const observer = new IntersectionObserver(
        ([entry]) => {
          if (entry.isIntersecting) {
            el.classList.add('animate-slide-in');
          } else {
            el.classList.remove('animate-slide-in');
          }
        },
        { threshold: 0.5 }
      );

      observer.observe(el);
    });
  }
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
  background-color: rgba(0, 0, 0, 0.6); /* Kontras ditingkatkan */
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
  border: 3px solid #ffffff;
  border-radius: 15px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
  width: 100%;
  height: auto;
  object-fit: cover;
  transform: translateY(-15px);
}

/* Mobile responsive */
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

/* Team Section */
.tim img {
  width: 100%;
  max-width: 150px;
  border: 5px solid #cccccc;
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

@media (max-width: 768px) {
  .tim img {
    max-width: 150px;
  }

  a.social {
    width: 40px;
    height: 40px;
    line-height: 40px;
  }
}
</style>

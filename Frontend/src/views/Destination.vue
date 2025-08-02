<template>
  <div class="destinasi">
    <Navbar />
    <div class="halaman-wisata">
      <div
        class="background-overlay"
        :style="{ backgroundImage: 'linear-gradient(rgba(0, 0, 0, 0.4), rgba(0, 0, 0, 0.4)), url(' + destination.background_url + ')' }"
      ></div>
      <div class="container">
        <h1 class="nama-wisata">{{ destination.name }}</h1>

        <!-- SLIDER -->
        <div class="slider-wrapper">
          <button class="slide-btn prev" @click="prevSlide">‹</button>
          <div class="slider">
            <component
              :is="currentMedia.type === 'video' ? 'video' : 'img'"
              :src="currentMedia.src"
              v-bind="currentMedia.type === 'video' ? { autoplay: true, muted: true, loop: true, loading: 'lazy' } : { loading: 'lazy' }"
            ></component>
          </div>
          <button class="slide-btn next" @click="nextSlide">›</button>
        </div>

        <!-- Info Wisata -->
        <div class="header-info">
          <div class="info-item">Kategori: <a href="#">{{ destination.category }}</a></div>
          <div class="info-item">Tempat: <a href="#">{{ destination.region }}</a></div>
          <div class="info-item">Tanggal: <a href="#">{{ formatDate(destination.updated_at) }}</a></div>
          <div class="info-item">Rating: <span><span v-for="n in Math.floor(destination.rating)" :key="n">⭐</span></span></div>
        </div>

        <div class="content">
          <!-- Sidebar -->
          <div class="sidebar">
            <select class="tab-dropdown" v-model="activeTab">
              <option value="deskripsi">📄 Deskripsi</option>
              <option value="lokasi">🗺️ Lokasi & Rute</option>
              <option value="tiket">🎫 Tiket Masuk</option>
              <option value="fasilitas">🏖️ Fasilitas</option>
            </select>

            <ul class="tab-sidebar">
              <li
                v-for="tab in tabs"
                :key="tab.value"
                :class="{ active: activeTab === tab.value }"
                class="tab-btn"
                @click="setActiveTab(tab.value)"
              >
                <span class="icon">
                  {{
                    tab.value === 'deskripsi' ? '📄' :
                    tab.value === 'lokasi' ? '🗺️' :
                    tab.value === 'tiket' ? '🎫' :
                    tab.value === 'fasilitas' ? '🏖️' : ''
                  }}
                </span>
                {{ tab.label }}
              </li>
            </ul>

            <div class="social-icons">
              <template v-for="social in availableSocials">
                <a
                  v-if="social.link"
                  :key="`link-${social.icon}`"
                  :href="social.link"
                  target="_blank"
                  rel="noopener"
                  :aria-label="social.label"
                >
                  <i
                    :class="['fab', social.icon, 'fa-2x']"
                    :style="{ color: iconColor(social.icon) }"
                  ></i>
                </a>
                <span
                  v-else
                  :key="`no-link-${social.icon}`"
                  class="icon-disabled"
                >
                  <i :class="['fab', social.icon, 'fa-2x']" style="color: #ccc;"></i>
                </span>
              </template>
            </div>
          </div>

          <!-- Konten Tab -->
          <div class="text">
            <div v-if="activeTab === 'deskripsi'" class="tab-content">
              <p v-for="(para, idx) in groupedDescription" :key="'desc-' + idx">{{ para }}</p>
            </div>
            <div v-else-if="activeTab === 'lokasi'" class="tab-content">
              <p v-for="(para, idx) in groupedLocation" :key="'loc-' + idx">{{ para }}</p>
              <div class="map-container">
                <iframe
                  v-if="destination.maps"
                  :src="destination.maps"
                  width="100%"
                  height="450"
                  style="border:0; border-radius: 8px;"
                  allowfullscreen
                  loading="lazy"
                  referrerpolicy="no-referrer-when-downgrade"
                ></iframe>
              </div>
            </div>
            <div v-else-if="activeTab === 'tiket'" class="tab-content">
              <p v-for="(para, idx) in groupedTicket" :key="'ticket-' + idx">{{ para }}</p>
            </div>
            <div v-else-if="activeTab === 'fasilitas'" class="tab-content">
              <p v-for="(para, idx) in groupedFacilities" :key="'fasil-' + idx">{{ para }}</p>
            </div>
          </div>
        </div>
      </div>
    </div>
    <Footer />
  </div>
</template>

<script>
import Navbar from '@/components/Navbar.vue';
import Footer from '@/components/Footer.vue';
import axios from 'axios';

export default {
  name: 'DestinationPage',
  components: { Navbar, Footer },
  data() {
    return {
      destination: {
        name: '',
        background_url: '',
        description: '',
        location: '',
        ticket_price: '',
        facilities: '',
        maps: '',
        category: '',
        region: '',
        updated_at: '',
        rating: 0,
        social_links: [],
        formatted_media: []
      },
      currentIndex: 0,
      activeTab: 'deskripsi',
      tabs: [
        { value: 'deskripsi', label: 'Deskripsi' },
        { value: 'lokasi', label: 'Lokasi & Rute' },
        { value: 'tiket', label: 'Tiket Masuk' },
        { value: 'fasilitas', label: 'Fasilitas' }
      ]
    };
  },
  computed: {
    currentMedia() {
      return this.destination.formatted_media[this.currentIndex] || {};
    },
    groupedDescription() {
      return this.groupText(this.destination.description);
    },
    groupedLocation() {
      return this.groupText(this.destination.location);
    },
    groupedTicket() {
      return this.groupText(this.destination.ticket_price);
    },
    groupedFacilities() {
      return this.groupText(this.destination.facilities);
    },
    availableSocials() {
      const defaultSocials = [
        { icon: 'fa-whatsapp', label: 'WhatsApp' },
        { icon: 'fa-instagram', label: 'Instagram' },
        { icon: 'fa-twitter', label: 'Twitter' },
        { icon: 'fa-tiktok', label: 'TikTok' }
      ];

      const stored = this.destination.social_links || [];

      return defaultSocials.map(defaultItem => {
        const found = stored.find(s => s.icon === defaultItem.icon);
        return {
          ...defaultItem,
          link: found && found.link ? found.link : ''
        };
      });
    }
  },
  methods: {
    nextSlide() {
      this.currentIndex = (this.currentIndex + 1) % this.destination.formatted_media.length;
    },
    prevSlide() {
      this.currentIndex = (this.currentIndex - 1 + this.destination.formatted_media.length) % this.destination.formatted_media.length;
    },
    setActiveTab(tab) {
      this.activeTab = tab;
    },
    formatDate(dateStr) {
      const options = { year: 'numeric', month: 'long', day: 'numeric' };
      return new Date(dateStr).toLocaleDateString('id-ID', options);
    },
    groupText(text) {
      if (!text) return [];
      const sentences = text.split('.').map(s => s.trim()).filter(Boolean);
      const paragraphs = [];
      for (let i = 0; i < sentences.length; i += 4) {
        paragraphs.push(sentences.slice(i, i + 4).join('. ') + '.');
      }
      return paragraphs;
    },
    iconColor(icon) {
      switch (icon) {
        case 'fa-whatsapp':
          return '#25D366';
        case 'fa-instagram':
          return '#E4405F';
        case 'fa-twitter':
          return '#1DA1F2';
        case 'fa-tiktok':
          return '#000000';
        default:
          return '#888';
      }
    }
  },
    mounted() {
    const slug = this.$route.params.slug;
    const apiBase = process.env.VUE_APP_API_BASE;

    axios.get(`${apiBase}/destinations/slug/${slug}`)
      .then(res => {
        this.destination = res.data;
      })
      .catch(err => {
        console.error('Gagal memuat destinasi:', err);
      });
  }

};
</script>

<style scoped>
.social-icons {
  margin-top: 30px;
  display: flex;
  flex-wrap: wrap;
  gap: 20px;
  padding-left: 16px;
}
.icon-disabled {
  pointer-events: none;
  cursor: not-allowed;
  opacity: 0.5;
}
.nama-wisata {
  text-align: center;
  font-size: 35px;
  font-weight: bold;
  margin-bottom: 50px;
  color: #333;
}
.halaman-wisata {
  position: relative;
  padding: 80px 0 20px;
}
.background-overlay {
  background-size: cover;
  background-repeat: no-repeat;
  background-position: center;
  position: absolute;
  inset: 0;
  z-index: 0;
}
.halaman-wisata .container {
  position: relative;
  z-index: 2;
  max-width: 900px;
  margin: 80px auto 80px;
  background-color: #fff;
  padding: 50px;
  border-radius: 8px;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.5);
}
.slider-wrapper {
  position: relative;
  border-radius: 8px;
}
.slider {
  width: 100%;
  aspect-ratio: 16 / 9;
  border-radius: 8px;
  overflow: hidden;
}
.slider img,
.slider video {
  width: 100%;
  height: 100%;
  object-fit: cover;
  display: block;
}
.slide-btn {
  position: absolute;
  top: 50%;
  transform: translateY(-50%);
  background: rgba(0, 0, 0, 0.5);
  color: white;
  border: none;
  padding: 12px;
  font-size: 24px;
  cursor: pointer;
  z-index: 1;
  border-radius: 50%;
}
.slide-btn.prev {
  left: 10px;
}
.slide-btn.next {
  right: 10px;
}
.header-info {
  margin: 15px 0 20px;
  font-size: 14px;
  color: #555;
}
.header-info a {
  color: #2e77f3;
  text-decoration: none;
}
.content {
  display: flex;
  gap: 20px;
  margin-top: 20px;
}
.sidebar {
  width: 200px;
}
.tab-sidebar {
  list-style: none;
  padding: 0;
  border-left: 2px solid #eee;
}
.tab-btn {
  padding: 12px 16px;
  cursor: pointer;
  display: flex;
  align-items: center;
  border-left: 3px solid transparent;
  transition: 0.2s ease;
}
.tab-btn:hover {
  background-color: #f0f4f8;
}
.tab-btn.active {
  font-weight: bold;
  color: #2e77f3;
  border-left-color: #2e77f3;
  background-color: #f5f7fa;
}
.icon {
  margin-right: 8px;
}
.text {
  flex: 1;
  font-size: 14px;
  color: #444;
}
.tab-content {
  margin-top: 10px;
  text-align: justify;
}
.tab-content p {
  margin-bottom: 1em;
  line-height: 1.7;
}
.map-container {
  margin-top: 1rem;
  width: 100%;
  border-radius: 8px;
  overflow: hidden;
}
.tab-dropdown {
  display: none;
}
@media (max-width: 768px) {
  .tab-dropdown {
    display: block;
    width: 100%;
    padding: 10px;
    font-size: 14px;
    margin-bottom: 16px;
    border: 1px solid #ccc;
    border-radius: 4px;
  }
  .tab-sidebar {
    display: none;
  }
  .halaman-wisata .container {
    margin-top: 20px;
    padding: 16px;
  }
  .content {
    flex-direction: column;
  }
}
</style>

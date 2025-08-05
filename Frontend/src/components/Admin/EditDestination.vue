<template>
  <div class="add-destination-modal">
    <h2>Edit Destinasi Wisata</h2>

    <div v-if="toast.show" class="toast" :style="{ backgroundColor: toast.color }">
      {{ toast.message }}
    </div>

    <form @submit.prevent="handleSubmit" class="form-grid">
      <!-- Nama -->
      <div class="form-row">
        <label for="name">Nama Destinasi:</label>
        <input id="name" type="text" v-model="destination.name" required />
      </div>

      <!-- Region -->
      <div class="form-row">
        <label for="region">Region:</label>
        <select id="region" v-model="destination.region" required>
          <option disabled value="">Pilih Region</option>
          <option v-for="region in regionOptions" :key="region" :value="region">{{ region }}</option>
        </select>
      </div>

      <!-- Deskripsi -->
      <div class="form-row">
        <label for="description">Deskripsi:</label>
        <textarea
          id="description"
          v-model="destination.description"
          rows="1"
          required
          ref="desc"
          @input="autoResize($event)"
        ></textarea>
      </div>

      <!-- Lokasi -->
      <div class="form-row">
        <label for="location">Lokasi:</label>
        <textarea
          id="location"
          v-model="destination.location"
          rows="1"
          required
          ref="loc"
          @input="autoResize($event)"
        ></textarea>
      </div>

      <!-- Tiket Masuk -->
      <div class="form-row">
        <label for="ticket_price">Tiket Masuk:</label>
        <textarea
          id="ticket_price"
          v-model="destination.ticket_price"
          rows="1"
          required
          ref="ticket"
          @input="autoResize($event)"
        ></textarea>
      </div>

      <!-- Fasilitas -->
      <div class="form-row">
        <label for="facilities">Fasilitas:</label>
        <textarea
          id="facilities"
          v-model="destination.facilities"
          rows="1"
          required
          ref="fasil"
          @input="autoResize($event)"
        ></textarea>
      </div>

      <!-- Maps -->
      <div class="form-row">
        <label for="maps">Link Google Maps:</label>
        <input id="maps" type="text" v-model="destination.maps" required />
      </div>

      <!-- Rating -->
      <div class="form-row">
        <label for="rating">Rating:</label>
        <select id="rating" v-model="destination.rating" required>
          <option disabled value="">Pilih rating</option>
          <option v-for="n in 5" :key="n" :value="n">{{ n }}</option>
        </select>
      </div>

      <!-- Label -->
      <div class="form-row">
        <label for="label">Label Khusus:</label>
        <select id="label" v-model="destination.label">
          <option disabled value="">Pilih label</option>
          <option v-for="(label, i) in labelOptions" :key="i" :value="label">{{ label }}</option>
        </select>
      </div>

      <!-- Kategori -->
      <div class="form-row">
        <label for="category">Kategori:</label>
        <select id="category" v-model="destination.category" required>
          <option disabled value="">Pilih kategori</option>
          <option v-for="(cat, i) in categoryOptions" :key="i" :value="cat">{{ cat }}</option>
        </select>
      </div>

      <!-- Background -->
      <div class="form-row">
        <label for="background">Background Img:</label>
        <input id="background" type="file" @change="handleBackground" accept="image/*" />
      </div>

      <div class="form-row" v-if="backgroundPreview">
        <label>Preview Background:</label>
        <div class="preview-item">
          <span class="remove-btn" @click="removeBackground">×</span>
          <img :src="backgroundPreview" />
        </div>
      </div>



      <!-- Media -->
      <div class="form-row">
        <label for="media">Media:</label>
        <input id="media" type="file" @change="handleMedia" accept="image/*,video/*" multiple ref="mediaInput" />
      </div>

      <div class="form-row" v-if="mediaPreview.length">
        <label>Preview Media:</label>
        <div class="media-preview">
          <div v-for="(file, index) in mediaPreview" :key="index" class="preview-item">
            <span class="remove-btn" @click="removeMedia(index)">×</span>
            <img v-if="file.type === 'image'" :src="file.url" />
            <video v-else controls :src="file.url" />
          </div>
        </div>
      </div>

      <!-- Sosial Media -->
      <div class="form-row" v-for="platform in ['whatsapp','instagram','tiktok','x']" :key="platform">
        <label :for="platform">{{ platform.charAt(0).toUpperCase() + platform.slice(1) }}:</label>
        <input :id="platform" type="url" v-model="destination[platform]" />
      </div>

      <div class="form-actions">
        <button type="submit" class="btn-primary">Simpan Perubahan</button>
        <button type="button" class="btn-secondary" @click="handleClose">Batal</button>
      </div>
    </form>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  props: ['destinationData'],
  data() {
    return {
      destination: {
        name: '',
        region: '',
        description: '',
        location: '',
        ticket_price: '',
        facilities: '',
        maps: '',
        rating: '',
        label: '',
        category: '',
        background: null,
        media: [],
        whatsapp: '',
        instagram: '',
        tiktok: '',
        x: '',
      },
      backgroundPreview: null,
      mediaPreview: [],
      labelOptions: ['Trending Now', 'Hidden Gem', 'Aesthetic Place', 'Nature Escape'],
      categoryOptions: [
        'Pantai', 'Situs Sejarah', 'Tempat Rekreasi', 'Gunung & Trekking',
        'Wisata Kuliner', 'Wisata Air', 'Wisata Religi', 'Alam Terbuka'
      ],
      regionOptions: ['Yogyakarta', 'Bantul', 'Sleman', 'Kulon Progo', 'GunungKidul'],
      toast: {
        show: false,
        message: '',
        color: '',
      },
    };
  },
  watch: {
    destinationData: {
      immediate: true,
      deep: true,
      handler(newData) {
        this.destination = { ...newData, media: [] };
        this.backgroundPreview = newData.background_url || null;

        if (Array.isArray(newData.media_urls)) {
          this.mediaPreview = newData.media_urls.map(url => ({
            url,
            type: this.getFileType(url),
          }));
        }
      }
    }
  },
  created() {
    axios.get(`${process.env.VUE_APP_API_BASE}/destinations/${this.destinationData.id}`)
      .then(res => {
        this.destination = {
          ...this.destination,
          ...res.data.data,
          media: [],
        };
        this.backgroundPreview = res.data.data.background_url;

        if (Array.isArray(res.data.data.media_urls)) {
          this.mediaPreview = res.data.data.media_urls.map(url => ({
            url,
            type: this.getFileType(url),
          }));
        }
      })
      .catch(err => {
        console.error(err);
        this.showToast('❌ Gagal memuat data destinasi!', '#dc3545');
      });
  },
  mounted() {
  this.$nextTick(() => {
    ['desc', 'loc', 'ticket', 'fasil'].forEach(ref => {
      const el = this.$refs[ref];
      if (el) {
        this.autoResize({ target: el });
      }
    });
  });
},

  methods: {
    autoResize(e) {
      e.target.style.height = 'auto';
      e.target.style.height = e.target.scrollHeight + 'px';
    },
    handleBackground(e) {
      const file = e.target.files[0];
      if (file && file.type.startsWith('image/')) {
        this.destination.background = file;
        this.backgroundPreview = URL.createObjectURL(file);
      } else {
        this.showToast('❌ File background harus berupa gambar!', '#dc3545');
        this.destination.background = null;
        this.backgroundPreview = null;
      }
    },
    handleMedia(e) {
      const newFiles = Array.from(e.target.files);
      this.destination.media = [...this.destination.media, ...newFiles];
      const newPreviews = newFiles.map(file => ({
        url: URL.createObjectURL(file),
        type: file.type.startsWith('image') ? 'image' : 'video',
      }));
      this.mediaPreview = [...this.mediaPreview, ...newPreviews];
      e.target.value = '';
    },
    removeMedia(index) {
      this.destination.media.splice(index, 1);
      this.mediaPreview.splice(index, 1);
    },
    getFileType(url) {
      const ext = url.split('.').pop().toLowerCase();
      if (['jpg', 'jpeg', 'png', 'webp', 'gif'].includes(ext)) return 'image';
      if (['mp4', 'webm', 'ogg'].includes(ext)) return 'video';
      return 'unknown';
    },
    showToast(message, color = '#333') {
      this.toast.message = message;
      this.toast.color = color;
      this.toast.show = true;
      setTimeout(() => {
        this.toast.show = false;
      }, 3000);
    },
    handleSubmit() {
      const formData = new FormData();
      for (const key in this.destination) {
        if (key !== 'media' && key !== 'background') {
          formData.append(key, this.destination[key]);
        }
      }
      if (this.destination.background instanceof File) {
        formData.append('background', this.destination.background);
      }
      this.destination.media.forEach(file => {
        formData.append('media[]', file);
      });

      axios.post(`${process.env.VUE_APP_API_BASE}/destinations/${this.destinationData.id}?_method=PUT`, formData, {
          headers: { 'Content-Type': 'multipart/form-data' }
        })
        .then(() => {
          this.showToast('✅ Data berhasil diperbarui!', '#28a745');
          setTimeout(() => {
            this.$emit('updated');
          }, 1000);
        })
        .catch(err => {
          const msg = err.response?.data?.message || '❌ Gagal menyimpan data.';
          this.showToast(msg, '#dc3545');
          console.error(err);
        });
    },
    handleClose() {
      this.$emit('close');
    },
    removeBackground() {
    this.destination.background = null;
    this.backgroundPreview = null;
    // Reset file input jika user ingin unggah file yang sama lagi
    const fileInput = document.getElementById('background');
    if (fileInput) fileInput.value = '';
    },
  },
};

</script>

<style scoped>
textarea {
  resize: none;
  overflow: hidden;
  transition: height 0.2s ease;
}

.add-destination-modal {
  background: #fff;
  border: 1px solid #ddd;
  padding: 30px;
  border-radius: 12px;
  max-width: 800px;
  margin: 20px auto;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
  font-family: 'Segoe UI', sans-serif;
  max-height: none;
  overflow-y: auto;
}

h2 {
  margin-bottom: 25px;
  font-size: 22px;
  text-align: center;
  color: #333;
}

.toast {
  position: fixed;
  top: 20px;
  right: 20px;
  background-color: #333;
  color: white;
  padding: 12px 20px;
  border-radius: 5px;
  box-shadow: 0 2px 8px rgba(0,0,0,0.15);
  font-weight: 600;
  z-index: 10000;
  animation: fadeInOut 3s forwards;
}

@keyframes fadeInOut {
  0% { opacity: 0; transform: translateY(-20px); }
  10% { opacity: 1; transform: translateY(0); }
  90% { opacity: 1; transform: translateY(0); }
  100% { opacity: 0; transform: translateY(-20px); }
}

.form-grid {
  display: flex;
  flex-direction: column;
  gap: 15px;
}

.form-row {
  display: grid;
  grid-template-columns: auto 1fr;
  align-items: center;
  gap: 12px;
}

.form-row label {
  font-weight: 600;
  color: #555;
  white-space: nowrap;
  padding-right: 10px;
  min-width: 120px;
}

input, select, textarea {
  padding: 8px 10px;
  font-size: 14px;
  width: 100%;
  border: 1px solid #ccc;
  border-radius: 6px;
}

.form-actions {
  display: flex;
  justify-content: flex-end;
  gap: 10px;
  margin-top: 15px;
}

.btn-primary {
  background-color: #007bff;
  color: white;
  padding: 8px 16px;
  border: none;
  border-radius: 6px;
  cursor: pointer;
}

.btn-primary:hover {
  background-color: #0069d9;
}

.btn-secondary {
  background-color: #6c757d;
  color: white;
  padding: 8px 16px;
  border: none;
  border-radius: 6px;
  cursor: pointer;
}

.btn-secondary:hover {
  background-color: #5a6268;
}

.media-preview {
  display: flex;
  flex-wrap: wrap;
  gap: 10px;
}

.preview-item {
  position: relative;
  width: fit-content;
}

.preview-item img,
.preview-item video {
  max-width: 160px;
  max-height: 100px;
  border-radius: 6px;
  object-fit: cover;
  border: 1px solid #ccc;
}

.remove-btn {
  position: absolute;
  top: -6px;
  right: -6px;
  background: #dc3545;
  color: white;
  border-radius: 50%;
  padding: 2px 6px;
  font-weight: bold;
  cursor: pointer;
  z-index: 1;
  font-size: 12px;
  line-height: 1;
}

@media (max-width: 600px) {
  .add-destination-modal {
    max-width: 95vw;
    padding: 20px;
  }

  .form-row {
    grid-template-columns: 1fr;
  }

  .form-row label {
    text-align: left;
    margin-bottom: 4px;
    padding-right: 0;
    min-width: auto;
  }
}
</style>

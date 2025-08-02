<template>
  <div class="add-user-modal">
    <h2>Edit Anggota Tim</h2>

    <!-- TOAST -->
    <div v-if="toast.show" class="toast" :style="{ backgroundColor: toast.color }">
      {{ toast.message }}
    </div>

    <form @submit.prevent="handleUpdate" class="form-grid" v-if="member">
      <div class="form-row">
        <label for="name">Nama:</label>
        <input id="name" type="text" v-model="member.name" required />
      </div>

      <div class="form-row">
        <label for="job">Job:</label>
        <input id="job" type="text" v-model="member.job" required />
      </div>

      <div class="form-row">
        <label for="github">Github:</label>
        <input id="github" type="url" v-model="member.github" />
      </div>

      <div class="form-row">
        <label for="instagram">Instagram:</label>
        <input id="instagram" type="url" v-model="member.instagram" />
      </div>

      <div class="form-row">
        <label for="img">Upload Foto Baru:</label>
        <input id="img" type="file" @change="handleImage" accept="image/*" ref="imgInput" />
      </div>

      <!-- PREVIEW IMAGE -->
      <div class="form-row" v-if="imagePreview">
        <label>Preview:</label>
        <div class="image-preview-wrapper">
          <img :src="imagePreview" alt="Preview" class="preview-img" />
          <button type="button" class="delete-btn" @click="removeImage">×</button>
        </div>
      </div>

      <div class="form-actions">
        <button type="submit" class="btn-primary">Simpan</button>
        <button type="button" class="btn-secondary" @click="$emit('close')">Batal</button>
      </div>
    </form>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  props: {
    team: {
      type: Object,
      required: true,
    },
  },
  data() {
    return {
      member: null,
      imagePreview: null,
      newImage: null,
      toast: {
        show: false,
        message: '',
        color: '',
      },
    };
  },
  watch: {
    team: {
      immediate: true,
      handler(newVal) {
        if (newVal) {
          this.member = { ...newVal };
          this.imagePreview = newVal.img ? this.getImageUrl(newVal.img) : null;
        }
      },
    },
  },
  methods: {
    getImageUrl(path) {
      return path.startsWith('http') ? path : `${process.env.VUE_APP_API_BASE}${path}`;
    },
    handleImage(e) {
      const file = e.target.files[0];
      if (file && file.type.startsWith('image/')) {
        this.newImage = file;
        this.imagePreview = URL.createObjectURL(file);
      } else {
        this.showToast('❌ File harus berupa gambar!', '#dc3545');
        this.newImage = null;
        this.imagePreview = null;
      }
    },
    removeImage() {
      this.newImage = null;
      this.imagePreview = null;
      this.$refs.imgInput.value = '';
    },
    showToast(message, color = '#333') {
      this.toast.message = message;
      this.toast.color = color;
      this.toast.show = true;
      setTimeout(() => {
        this.toast.show = false;
      }, 3000);
    },
    handleUpdate() {
      if (!this.member.name || !this.member.job) {
        this.showToast('❌ Nama dan Jabatan wajib diisi.', '#dc3545');
        return;
      }

      const formData = new FormData();
      formData.append('name', this.member.name);
      formData.append('job', this.member.job);
      formData.append('github', this.member.github || '');
      formData.append('instagram', this.member.instagram || '');
      if (this.newImage) {
        formData.append('image', this.newImage);
      }

      axios.post(`${process.env.VUE_APP_API_BASE}/teams/${this.member.id}?_method=PUT`, formData, {
        headers: { 'Content-Type': 'multipart/form-data' },
      })
        .then(() => {
          this.$emit('notify', {
            type: 'success',
            message: '✅ Data anggota tim berhasil diperbarui.',
          });
          this.$emit('update', {
            ...this.member,
            img: this.newImage ? `/uploads/${this.newImage.name}` : this.member.img,
            updated_at: new Date().toISOString()
          });
        })
        .catch((error) => {
          let errorMsg = 'Gagal memperbarui anggota.';
          if (error.response?.data?.message) {
            errorMsg = error.response.data.message;
          }
          this.showToast(`❌ ${errorMsg}`, '#dc3545');
          console.error(error);
        });
    },
  },
};
</script>

<style scoped>
.add-user-modal {
  background: #fff;
  border: 1px solid #ddd;
  padding: 30px;
  border-radius: 12px;
  max-width: 800px;
  margin: 20px auto 0;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
  font-family: 'Segoe UI', sans-serif;
  overflow: visible;
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
  text-align: left;
  color: #555;
  white-space: nowrap;
  padding-right: 10px;
  min-width: 120px;
}

input,
select {
  padding: 8px 10px;
  font-size: 14px;
  width: 100%;
  border: 1px solid #ccc;
  border-radius: 6px;
  box-sizing: border-box;
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

/* IMAGE PREVIEW + DELETE BUTTON */
.image-preview-wrapper {
  position: relative;
  display: inline-block;
  width: 150px;
}

.preview-img {
  width: 150px;
  border: 1px solid #ccc;
  border-radius: 8px;
  display: block;
}

.delete-btn {
  position: absolute;
  top: 4px;
  right: 4px;
  background: #dc3545;
  color: white;
  border: none;
  border-radius: 50%;
  width: 22px;
  height: 22px;
  font-size: 16px;
  line-height: 22px;
  text-align: center;
  padding: 0;
  cursor: pointer;
  box-shadow: 0 2px 6px rgba(0,0,0,0.3);
}

@media (max-width: 600px) {
  .add-user-modal {
    max-width: 95vw;
    padding: 20px;
  }
  .form-row {
    grid-template-columns: 1fr;
  }
  .form-row label {
    text-align: left;
    padding-right: 0;
    min-width: auto;
    margin-bottom: 4px;
  }
}
</style>

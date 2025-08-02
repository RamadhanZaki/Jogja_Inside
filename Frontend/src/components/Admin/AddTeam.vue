<template>
  <div class="add-user-modal">
    <h2>Tambah Anggota Tim</h2>

    <!-- TOAST -->
    <div v-if="toast.show" class="toast" :style="{ backgroundColor: toast.color }">
      {{ toast.message }}
    </div>

    <form @submit.prevent="handleSubmit" class="form-grid">
      <div class="form-row">
        <label for="name">Nama:</label>
        <input id="name" type="text" v-model="newMember.name" required />
      </div>

      <div class="form-row">
        <label for="job">Job:</label>
        <input id="job" type="text" v-model="newMember.job" required />
      </div>

      <div class="form-row">
        <label for="github">Github:</label>
        <input id="github" type="url" v-model="newMember.github" />
      </div>

      <div class="form-row">
        <label for="instagram">Instagram:</label>
        <input id="instagram" type="url" v-model="newMember.instagram" />
      </div>

      <div class="form-row">
        <label for="img">Upload Foto:</label>
        <input id="img" type="file" @change="handleImage" accept="image/*" required ref="imgInput" />
      </div>

      <!-- PREVIEW IMAGE -->
      <div class="form-row" v-if="imagePreview">
        <label>Preview:</label>
        <img :src="imagePreview" alt="Preview" width="150" style="border: 1px solid #ccc; border-radius: 8px;" />
      </div>

      <div class="form-actions">
        <button type="submit" class="btn-primary">Tambah</button>
        <button type="button" class="btn-secondary" @click="$emit('close')">Batal</button>
      </div>
    </form>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data() {
    return {
      newMember: {
        name: '',
        job: '',
        github: '',
        instagram: '',
        img: null,
      },
      imagePreview: null,
      toast: {
        show: false,
        message: '',
        color: '',
      },
    };
  },
  methods: {
    handleImage(e) {
      const file = e.target.files[0];
      if (file && file.type.startsWith('image/')) {
        this.newMember.img = file;
        this.imagePreview = URL.createObjectURL(file);
      } else {
        this.showToast('❌ File harus berupa gambar!', '#dc3545');
        this.newMember.img = null;
        this.imagePreview = null;
      }
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
      if (!this.newMember.name || !this.newMember.job || !this.newMember.img) {
        this.showToast('❌ Nama, Jabatan, dan Foto wajib diisi.', '#dc3545');
        return;
      }

      const formData = new FormData();
      formData.append('name', this.newMember.name);
      formData.append('job', this.newMember.job);
      formData.append('github', this.newMember.github);
      formData.append('instagram', this.newMember.instagram);
      formData.append('image', this.newMember.img);

      axios.post(`https://jogja-inside.my.id/api/teams`, formData, {
      headers: { 'Content-Type': 'multipart/form-data' },
      })

        .then(() => {
          this.$emit('notify', {
            type: 'success',
            message: '✅ Anggota tim berhasil ditambahkan.',
          });
          this.$emit('created');
          this.resetForm();
        })
        .catch((error) => {
          let errorMsg = 'Gagal menambahkan anggota.';
          if (error.response?.data?.message) {
            errorMsg = error.response.data.message;
          }
          this.showToast(`❌ ${errorMsg}`, '#dc3545');
          console.error(error);
        });
    },
    resetForm() {
      this.newMember = {
        name: '',
        job: '',
        github: '',
        instagram: '',
        img: null,
      };
      this.imagePreview = null;
      if (this.$refs.imgInput) {
        this.$refs.imgInput.value = '';
      }
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

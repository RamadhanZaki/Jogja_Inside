<template>
  <div class="add-user-modal">
    <h2>Tambah User Baru</h2>

    <!-- TOAST -->
    <div v-if="toast.show" class="toast" :style="{ backgroundColor: toast.color }">
      {{ toast.message }}
    </div>

    <form @submit.prevent="handleSubmit" class="form-grid">
      <div class="form-row">
        <label for="name">Nama:</label>
        <input id="name" type="text" v-model="newUser.name" required />
      </div>

      <div class="form-row">
        <label for="username">Username:</label>
        <input id="username" type="text" v-model="newUser.username" required />
      </div>

      <div class="form-row">
        <label for="email">Email:</label>
        <input id="email" type="email" v-model="newUser.email" required />
      </div>

      <div class="form-row">
        <label for="role">Role:</label>
        <select id="role" v-model="newUser.role" required>
          <option disabled value="">-- Pilih Role --</option>
          <option>Admin</option>
          <option>Super Admin</option>
        </select>
      </div>

      <div class="form-row">
        <label for="password">Password:</label>
        <div class="password-field">
          <input
            id="password"
            :type="showPassword ? 'text' : 'password'"
            v-model="newUser.password"
            required
          />
          <button type="button" @click="togglePassword">
            {{ showPassword ? 'Sembunyikan' : 'Lihat' }}
          </button>
        </div>
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

const apiBase = process.env.VUE_APP_API_BASE;


export default {
  data() {
    return {
      newUser: {
        name: '',
        username: '',
        email: '',
        role: '',
        password: ''
      },
      showPassword: false,
      toast: {
        show: false,
        message: '',
        color: ''
      }
    };
  },
  methods: {
    togglePassword() {
      this.showPassword = !this.showPassword;
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
      if (this.newUser.password.length < 8) {
        this.showToast('❌ Password minimal 8 karakter.', '#dc3545'); // merah
        return;
      }

      axios.post(`${apiBase}/users`, this.newUser)
        .then(() => {
          this.$emit('notify', {
            type: 'success',
            message: '✅ User berhasil ditambahkan.'
          });
          this.$emit('created', this.newUser);
          this.resetForm();
        })
        .catch((error) => {
          let errorMsg = 'Gagal menambahkan user.';
          if (error.response && error.response.data) {
            errorMsg = error.response.data.message || errorMsg;
          }
          this.showToast(`❌ ${errorMsg}`, '#dc3545'); // merah
          console.error(error);
        });
    },
    resetForm() {
      this.newUser = {
        name: '',
        username: '',
        email: '',
        role: '',
        password: ''
      };
    }
  }
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

.password-field {
  display: flex;
  gap: 8px;
}

.password-field input {
  flex: 1;
}

.password-field button {
  padding: 8px 10px;
  border: none;
  background-color: #ddd;
  border-radius: 5px;
  cursor: pointer;
}

.password-field button:hover {
  background-color: #bbb;
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

<template>
  <div class="add-user-modal">
    <h2>Edit User</h2>
    <form @submit.prevent="handleSave" class="form-grid">
      <div class="form-row">
        <label>ID:</label>
        <input type="text" :value="editedUser.id" disabled class="readonly" />
      </div>

      <div class="form-row">
        <label>Role:</label>
        <input type="text" :value="editedUser.role" disabled class="readonly" />
      </div>

      <div class="form-row">
        <label for="username">Username:</label>
        <input
          id="username"
          type="text"
          v-model="editedUser.username"
          :disabled="!isEditable"
          required
        />
      </div>

      <div class="form-row">
        <label for="email">Email:</label>
        <input
          id="email"
          type="email"
          v-model="editedUser.email"
          :disabled="!isEditable"
          required
        />
      </div>

      <div class="form-row">
        <label for="password">Password:</label>
        <div class="password-field">
          <input
            id="password"
            :type="showPassword ? 'text' : 'password'"
            v-model="editedUser.password"
            :disabled="!isEditable"
            placeholder="Kosongkan jika tidak ingin ubah password"
          />
          <button type="button" @click="togglePassword">
            {{ showPassword ? 'Sembunyikan' : 'Lihat' }}
          </button>
        </div>
      </div>

      <div class="form-actions">
        <button type="submit" class="btn-primary" :disabled="!isEditable">Simpan</button>
        <button type="button" class="btn-secondary" @click="$emit('close')">Batal</button>
      </div>
    </form>

    <!-- Toast Notification -->
    <div
      v-if="toast.show"
      :class="['toast', toast.success ? 'toast-success' : 'toast-error']"
    >
      {{ toast.message }}
    </div>
  </div>
</template>

<script>
import axios from 'axios';


export default {
  props: ['user'],
  data() {
    return {
      editedUser: {
        id: '',
        role: '',
        username: '',
        email: '',
        password: ''
      },
      showPassword: false,
      toast: {
        show: false,
        message: '',
        success: true
      },
      currentUserId: null,
      currentUserRole: ''
    };
  },
  computed: {
    isEditable() {
      return (
        this.currentUserRole === 'Super Admin' ||
        this.currentUserId === this.editedUser.id
      );
    }
  },
  watch: {
    user: {
      immediate: true,
      handler(newUser) {
        this.editedUser = {
          id: parseInt(newUser.id),
          role: newUser.role,
          username: newUser.username,
          email: newUser.email,
          password: ''
        };
      }
    }
  },
  mounted() {
    const id = parseInt(localStorage.getItem('user_id'));
    const role = localStorage.getItem('user_role');

    if (!id || !role) {
      localStorage.setItem('user_id', this.user.id);
      localStorage.setItem('user_role', 'Super Admin');
      this.currentUserId = parseInt(this.user.id);
      this.currentUserRole = 'Super Admin';
    } else {
      this.currentUserId = id;
      this.currentUserRole = role;
    }
  },
  methods: {
    togglePassword() {
      this.showPassword = !this.showPassword;
    },
    showToast(message, success = true) {
      this.toast.message = message;
      this.toast.success = success;
      this.toast.show = true;

      setTimeout(() => {
        this.toast.show = false;
      }, 3000);
    },
    handleSave() {
      if (
        this.editedUser.username === this.user.username &&
        this.editedUser.email === this.user.email &&
        this.editedUser.password === ''
      ) {
        this.showToast('Tidak ada perubahan yang dilakukan.', false);
        return;
      }

      if (
        this.editedUser.password &&
        this.editedUser.password.length < 8
      ) {
        this.showToast('❌ Password minimal 8 karakter.', false);
        return;
      }

      axios.put(`${process.env.VUE_APP_API_BASE}/users/${this.editedUser.id}`, this.editedUser)
        .then((response) => {
          const updatedData = response.data;
          this.showToast('Data berhasil diperbarui.', true);
          this.$emit('update', updatedData);
          this.editedUser.password = '';
        })
        .catch((error) => {
          this.showToast('Gagal menyimpan perubahan.', false);
          console.error('Error:', error.response ? error.response.data : error.message);
        });
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
}

h2 {
  margin-bottom: 25px;
  font-size: 22px;
  text-align: center;
  color: #333;
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

input[disabled].readonly {
  background-color: #e0e0e0;
  cursor: not-allowed;
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

.btn-primary:disabled {
  background-color: #7baaf7;
  cursor: not-allowed;
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

/* Toast Notification */
.toast {
  position: fixed;
  top: 20px;
  right: 20px;
  padding: 12px 20px;
  border-radius: 8px;
  font-weight: bold;
  color: #fff;
  z-index: 999999;
  opacity: 0.95;
  transition: all 0.3s ease-in-out;
}

.toast-success {
  background-color: #28a745;
}

.toast-error {
  background-color: #dc3545;
}

/* Responsif */
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

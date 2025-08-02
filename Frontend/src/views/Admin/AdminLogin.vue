<template>
  <div class="login-page">
    <div class="login-wrapper">
      <img :src="logo" alt="Logo" class="logo" />

      <form @submit.prevent="login" class="login-form">
        <label>USERNAME OR EMAIL ADDRESS</label>
        <input v-model="username" type="text" required />

        <label>PASSWORD</label>
        <div class="password-wrapper">
          <input v-model="password" :type="showPassword ? 'text' : 'password'" required />
          <span class="toggle-password" @click="togglePassword">👁️</span>
        </div>

        <div class="remember-me">
          <input type="checkbox" id="remember" v-model="rememberMe" />
          <label for="remember">REMEMBER ME</label>
        </div>

        <button type="submit">Log In</button>

        <div class="links">
          <router-link to="/" class="back-link">← GO JOGJA_INSIDE</router-link>
        </div>
      </form>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      username: '',
      password: '',
      showPassword: false,
      rememberMe: false,
      logo: require('@/assets/thumbnail/Icon/Jogja_Inside.webp')
    };
  },
  methods: {
    togglePassword() {
      this.showPassword = !this.showPassword;
    },
    login() {
      if (!this.username || !this.password) {
        alert('Username dan password wajib diisi');
        return;
      }

      // ✅ gunakan baseURL dari VUE_APP_API_BASE melalui instance this.$axios
      this.$axios.post('/login', {
        username: this.username,
        password: this.password
      })
      .then(response => {
        const token = response.data.token;
        localStorage.setItem('adminToken', token);
        this.$router.replace('/admin/dashboard'); // aman & tidak balik ke login
      })
      .catch(error => {
        alert(error.response?.data?.message || 'Login gagal. Silakan coba lagi.');
      });
    }
  }
};
</script>

<style scoped>
.login-page {
  background-color: #0f3550;
  height: 100vh;
  display: flex;
  justify-content: center;
  align-items: center;
}

.login-wrapper {
  width: 100%;
  max-width: 400px;
  padding: 40px;
  text-align: center;
  color: white;
}

.logo {
  max-width: 150px;
  margin: 0 auto 30px;
}

.login-form {
  background: none;
}

label {
  display: block;
  text-align: left;
  margin-bottom: 6px;
  font-size: 14px;
  font-weight: bold;
}

input[type="text"],
input[type="password"] {
  width: 100%;
  padding: 10px;
  margin-bottom: 16px;
  border-radius: 4px;
  border: none;
}

.password-wrapper {
  position: relative;
}

.password-wrapper input {
  padding-right: 40px;
}

.toggle-password {
  position: absolute;
  right: 10px;
  top: 10px;
  cursor: pointer;
}

.remember-me {
  display: flex;
  align-items: center;
  margin-bottom: 20px;
  color: white;
  font-size: 14px;
  font-weight: bold;
  text-align: left;
  width: 100%;
  justify-content: flex-start;
  gap: 8px;
  padding-left: 2px;
}

.remember-me input[type="checkbox"] {
  width: 16px;
  height: 16px;
  accent-color: #2271b1; /* styling centang */
}

button {
  width: 100%;
  padding: 10px;
  background-color: #2271b1;
  color: white;
  border: none;
  border-radius: 4px;
  font-weight: bold;
  cursor: pointer;
}

.links {
  margin-top: 20px;
  font-size: 13px;
}

.links a {
  color: #ffffff;
  text-decoration: none;
}

.links a:hover {
  text-decoration: underline;
}
</style>

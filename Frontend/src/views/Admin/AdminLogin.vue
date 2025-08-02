<template>
  <div class="login-page">
    <div class="login-wrapper">
      <!-- Menggunakan require agar logo dari assets bisa dimuat -->
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
          <input type="checkbox" v-model="rememberMe" />
          <label>REMEMBER ME</label>
        </div>

        <button type="submit">Log In</button>

        <div class="links">
          <p><a href="#">LOST YOUR PASSWORD?</a></p>
          <p><a href="#">← GO JOGJA_INSIDE</a></p>
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
      // Memuat logo dengan require agar bisa di-bundle webpack
      logo: require('@/assets/thumbnail/Icon/Jogja_Inside.webp')
    };
  },
  methods: {
    togglePassword() {
      this.showPassword = !this.showPassword;
    },
    login() {
      if (this.username === 'admin' && this.password === 'admin123') {
        localStorage.setItem('isAdmin', true);
        this.$router.push('/admin/dashboard');
      } else {
        alert('Username atau password salah');
      }
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
  gap: 8px;
  color: white;
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

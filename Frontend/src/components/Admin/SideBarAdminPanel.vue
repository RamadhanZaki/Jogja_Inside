<template>
  <div class="sidebar">
    <h1 class="logo">Admin Panel</h1>
    <nav>
      <ul>
        <li
          v-for="item in menu"
          :key="item.key"
          :class="{ active: item.key === activeTab, disabled: item.disabled }"
          @click="!item.disabled && $emit('navigate', item.key)"
        >
          <i :class="item.icon"></i>
          <span>{{ item.label }}</span>
        </li>
      </ul>
    </nav>
    <div class="bottom">
      <button class="logout" @click="logout">
        <i class="fas fa-sign-out-alt"></i>
        <span>Logout</span>
      </button>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    activeTab: String,
  },
  data() {
    return {
      menu: [
        { key: 'akunWeb', label: 'Account', icon: 'fas fa-user' },
        { key: 'kontenDestinasi', label: 'Destinasi', icon: 'fas fa-map-marked-alt' },
        { key: 'tim', label: 'Team', icon: 'fas fa-users' },
      ],
    };
  },
  methods: {
    logout() {
      if (confirm('Yakin ingin logout dari admin dashboard?')) {
        localStorage.removeItem('adminToken');
        this.$router.replace('/admin/login').catch(() => {});
      }
    }
  }
};
</script>

<style scoped>
.sidebar {
  position: fixed;
  top: 0;
  left: 0;
  width: 240px;
  height: 100vh;
  background-color: #2c3e50;
  color: #ecf0f1;
  padding: 20px;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  z-index: 1000;
}
.logo {
  font-size: 1.5rem;
  margin-bottom: 30px;
  text-align: center;
  font-weight: bold;
}
nav ul {
  list-style: none;
  padding: 0;
  margin: 0;
}
nav li {
  display: flex;
  align-items: center;
  padding: 12px 16px;
  border-radius: 8px;
  margin-bottom: 10px;
  cursor: pointer;
  transition: background-color 0.2s;
}
nav li:hover {
  background-color: #34495e;
}
nav li i {
  margin-right: 10px;
}
nav li.active {
  background-color: #1abc9c;
  color: #ffffff;
}
nav li.disabled {
  opacity: 0.5;
  pointer-events: none;
}
.bottom {
  margin-top: auto;
}
.logout {
  width: 100%;
  background-color: transparent;
  border: none;
  color: #e74c3c;
  text-align: left;
  display: flex;
  align-items: center;
  gap: 10px;
  font-size: 1rem;
  cursor: pointer;
  padding: 10px;
  border-radius: 8px;
  transition: background-color 0.2s;
}
.logout:hover {
  background-color: #c0392b;
  color: #fff;
}
</style>

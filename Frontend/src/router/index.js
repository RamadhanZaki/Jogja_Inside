import Vue from 'vue';
import VueRouter from 'vue-router';

// Import halaman utama
import Home from '@/views/Home.vue';
import About from '@/views/About.vue';
import Destination from '@/views/Destination.vue'; // ✅ Komponen detail destinasi
import DestinationResult from '@/views/DestinationResult.vue';

// Import halaman region
import Yogyakarta from '@/views/Region/Yogyakarta.vue';
import Bantul from '@/views/Region/Bantul.vue';
import GunungKidul from '@/views/Region/GunungKidul.vue';
import Sleman from '@/views/Region/Sleman.vue';
import KulonProgo from '@/views/Region/KulonProgo.vue';

// Import halaman admin
import AdminLogin from '@/views/Admin/AdminLogin.vue';
import AdminDashboard from '@/views/Admin/AdminDashboard.vue';

Vue.use(VueRouter);

const routes = [
  // Halaman umum
  { path: '/', name: 'Home', component: Home },
  { path: '/about', name: 'About', component: About },
  { path: '/destinationresult', name: 'DestinationResult', component: DestinationResult },

  // Region
  { path: '/Region/Yogyakarta', name: 'Yogyakarta', component: Yogyakarta },
  { path: '/Region/Bantul', name: 'Bantul', component: Bantul },
  { path: '/Region/Sleman', name: 'Sleman', component: Sleman },
  { path: '/Region/KulonProgo', name: 'KulonProgo', component: KulonProgo },
  { path: '/Region/GunungKidul', name: 'GunungKidul', component: GunungKidul },

  // Admin
  {
    path: '/admin/login',
    name: 'AdminLogin',
    component: AdminLogin,
    meta: { guestOnly: true }
  },
  {
    path: '/admin/dashboard',
    name: 'AdminDashboard',
    component: AdminDashboard,
    meta: { requiresAuth: true }
  },

  // ✅ Halaman detail destinasi berdasarkan slug
  {
    path: '/destination/:slug',
    name: 'DestinationDetail',
    component: Destination
  },

  // Redirect semua path tidak dikenal ke halaman Home
  { path: '*', redirect: '/' }
];

const router = new VueRouter({
  mode: 'history',
  routes,
  scrollBehavior(to) {
    if (to.hash) {
      return {
        selector: to.hash,
        behavior: 'smooth',
      };
    }
    return { x: 0, y: 0 };
  }
});

// ✅ Middleware untuk autentikasi admin
router.beforeEach((to, from, next) => {
  const token = localStorage.getItem('adminToken');
  const isAuthenticated = token && token !== 'null' && token !== '';

  if (to.path === '/admin/login') {
    if (isAuthenticated) {
      return next('/admin/dashboard');
    }
    return next();
  }

  if (to.matched.some(record => record.meta.requiresAuth)) {
    if (!isAuthenticated) {
      return next('/admin/login');
    }
  }

  next();
});

export default router;

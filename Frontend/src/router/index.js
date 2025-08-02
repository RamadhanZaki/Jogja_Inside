import Vue from 'vue';
import VueRouter from 'vue-router';

// Import semua view
import Home from '@/views/Home.vue';
import About from '@/views/About.vue';
import Destination from '@/views/Destination.vue';
import Region from '@/views/Region.vue';
import AdminLogin from '@/views/Admin/AdminLogin.vue';
import AdminDashboard from '@/views/Admin/AdminDashboard.vue';


Vue.use(VueRouter);

const routes = [
  {
    path: '/',
    name: 'Home',
    component: Home
  },
  {
    path: '/about',
    name: 'About',
    component: About
  },
  {
    path: '/destination',
    name: 'Destination',
    component: Destination
  },
  {
    path: '/region',
    name: 'Region',
    component: Region
  },
  {
    path: '/admin/login',
    name: 'AdminLogin',
    component: AdminLogin
  },
  {
    path: '/admin/dashboard',
    name: 'AdminDashboard',
    component: AdminDashboard,
    meta: { requiresAuth: true }
  }
];

const router = new VueRouter({
  mode: 'history',
  routes
});

// Middleware sederhana untuk proteksi admin
router.beforeEach((to, from, next) => {
  const isAdmin = localStorage.getItem('isAdmin');
  if (to.matched.some(record => record.meta.requiresAuth) && !isAdmin) {
    next('/admin/login');
  } else {
    next();
  }
});

export default router;

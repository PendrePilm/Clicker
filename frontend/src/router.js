import { createRouter, createWebHistory } from 'vue-router'; // Importez depuis Vue Router 4

import UserLogin from './views/UserLogin.vue';
import UserRegister from './views/UserRegister.vue';
import UserDashboard from './views/UserDashboard.vue';
import UserNiveau1 from './views/UserNiveau1.vue';  

const router = createRouter({
  history: createWebHistory(),
  routes: [
    {
      path: '/',
      redirect: '/login'
    },
    {
      path: '/login',
      component: UserLogin
    },
    {
      path: '/register',
      component: UserRegister
    },
    {
      path: '/dashboard',
      component: UserDashboard
    },
    {
      path: '/niveau1',
      component: UserNiveau1
    }
  ]
});

export default router;
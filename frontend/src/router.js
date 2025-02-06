import { createRouter, createWebHistory } from 'vue-router'; // Importez depuis Vue Router 4

import UserLogin from './views/UserLogin.vue';
import UserRegister from './views/UserRegister.vue';

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
    }
  ]
});

export default router;
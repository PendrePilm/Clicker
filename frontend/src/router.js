import { createRouter, createWebHistory } from 'vue-router'; // Importez depuis Vue Router 4

import UserLogin from './views/UserLogin.vue';
import UserRegister from './views/UserRegister.vue';
import UserDashboard from './views/UserDashboard.vue';
import UserNiveau1 from './views/UserNiveau1.vue';  
import UserNiveau2 from './views/UserNiveau2.vue';
import UserNiveau3 from './views/UserNiveau3.vue';

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
    },
    {
      path: '/niveau2',
      component: UserNiveau2
    },
    {
      path: '/niveau3',
      component: UserNiveau3
    }
  ]
});

export default router;
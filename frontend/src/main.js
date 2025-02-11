import { createApp } from 'vue'; // Importez createApp depuis Vue 3
import App from './App.vue';
import router from './router'; // Importez le routeur
import 'bootstrap/dist/css/bootstrap.css';
import 'bootstrap/dist/js/bootstrap.js';

createApp(App)
  .use(router) // Utilisez le routeur
  .mount('#app');
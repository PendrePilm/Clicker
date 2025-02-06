<template>
    <div class="dashboard bg-dark text-white min-vh-100">
      <!-- Menu en haut à gauche -->
      <div class="d-flex align-items-center p-3">
        <img src="@/assets/user.png" alt="User" class="user-image me-2" />
        <span class="username me-3">{{ username }}</span>
        <div class="dropdown">
          <button class="btn btn-success dropdown-toggle" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
            Menu
          </button>
          <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
            <li><a class="dropdown-item" href="#" @click="logout">Se déconnecter</a></li>
          </ul>
        </div>
      </div>
  
      <!-- Contenu principal -->
      <div class="container text-center mt-5">
        <h1>Choix du niveau</h1>
        <div class="row justify-content-center mt-4">
          <!-- Image 1 -->
          <div class="col-md-4 mb-4" v-if="userLevel >= 1">
            <router-link to="/niveau1">
              <img src="@/assets/niveau1.jpg" alt="Niveau 1" class="img-fluid niveau-image" />
            </router-link>
          </div>

          <!-- Image 2 -->
          <div class="col-md-4 mb-4">
          <router-link v-if="userLevel >= 2" to="/niveau2">
            <img src="@/assets/niveau2.jpg" alt="Niveau 2" class="img-fluid niveau-image" />
          </router-link>
          <img v-else src="@/assets/niveau2.jpg" alt="Niveau 2" class="img-fluid niveau-image blocked" />
        </div>

          <!-- Image 3 -->
          <div class="col-md-4 mb-4">
          <router-link v-if="userLevel >= 3" to="/niveau3">
            <img src="@/assets/niveau3.jpg" alt="Niveau 3" class="img-fluid niveau-image" />
          </router-link>
          <img v-else src="@/assets/niveau3.jpg" alt="Niveau 3" class="img-fluid niveau-image blocked" />
        </div>
        </div>
      </div>
    </div>
  </template>
  
  <script>
  export default {
  data() {
    return {
      username: localStorage.getItem('username') || "Utilisateur", // Récupéré depuis le localStorage
      userLevel: parseInt(localStorage.getItem('userLevel')) || 1, // Récupéré depuis le localStorage
    };
  },
  methods: {
    logout() {
      // Supprimez les informations de l'utilisateur
      localStorage.removeItem('username');
      localStorage.removeItem('userLevel');
      this.$router.push('/login');
    },
  },
};
  </script>
  
  <style scoped>
  .dashboard {
    padding: 20px;
  }
  
  .user-image {
    width: 40px;
    height: 40px;
    border-radius: 50%;
  }
  
  .username {
    font-size: 1.2rem;
    font-weight: bold;
  }
  
  .niveau-image {
    border: 2px solid #28a745; /* Bordure verte */
    border-radius: 10px;
    transition: transform 0.3s ease;
  }
  
  .niveau-image:hover {
    transform: scale(1.05); /* Effet de zoom au survol */
  }
  .blocked {
  filter: grayscale(100%); /* Griser l'image */
  opacity: 0.6; /* Rendre l'image plus transparente */
  pointer-events: none; /* Désactiver les clics */
  }
  </style>
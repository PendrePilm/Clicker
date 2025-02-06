<template>
    <div class="container d-flex justify-content-center align-items-center vh-100">
      <div class="card bg-secondary text-white" style="width: 18rem;">
        <div class="card-body">
          <h5 class="card-title text-center">Créer un compte</h5>
          <form @submit.prevent="register">
            <div class="mb-3">
              <label for="username" class="form-label">Pseudo</label>
              <input type="text" class="form-control bg-dark text-white" id="username" v-model="username" required>
            </div>
            <div class="mb-3">
              <label for="password" class="form-label">Mot de passe</label>
              <input type="password" class="form-control bg-dark text-white" id="password" v-model="password" required>
            </div>
            <button type="submit" class="btn custom-green-btn w-100">S'inscrire</button>
          </form>
          <p class="text-center mt-3">
            <router-link to="/login">Se connecter</router-link>
          </p>
        </div>
      </div>
    </div>
  </template>
  
  <script>
  export default {
    data() {
      return {
        username: '',
        password: ''
      };
    },
   methods: {
  async register() {
    try {
      const response = await fetch('http://localhost/clicker2/backend/register.php', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json'
        },
        body: JSON.stringify({
          username: this.username,
          password: this.password
        })
      });

      const data = await response.json();

      if (data.success) {
        alert('Inscription réussie!');
        this.$router.push('/login');
      } else {
        alert('Erreur lors de l\'inscription');
      }
    } catch (error) {
      console.error('Erreur lors de l\'inscription:', error);
    }
  }
}
  };
  </script>
  
<style scoped>
  .custom-green-btn {
    background-color: #28a745; /* Vert Bootstrap par défaut */
    border-color: #28a745;
  }

  .custom-green-btn:hover {
    background-color: #218838; /* Vert plus foncé au survol */
    border-color: #1e7e34;
  }
</style>
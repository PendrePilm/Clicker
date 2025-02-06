<template>
    <div class="container d-flex justify-content-center align-items-center vh-100">
      <div class="card" style="width: 18rem;">
        <div class="card-body">
          <h5 class="card-title text-center">Connexion</h5>
          <form @submit.prevent="login">
            <div class="mb-3">
              <label for="username" class="form-label">Pseudo</label>
              <input type="text" class="form-control" id="username" v-model="username" required>
            </div>
            <div class="mb-3">
              <label for="password" class="form-label">Mot de passe</label>
              <input type="password" class="form-control" id="password" v-model="password" required>
            </div>
            <button type="submit" class="btn btn-primary w-100">Se connecter</button>
          </form>
          <p class="text-center mt-3">
            <router-link to="/register">Créer un compte</router-link>
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
      async login() {
        try {
          const response = await fetch('http://localhost/clicker2/backend/login.php', {
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
            alert('Connexion réussie!');
            // Redirection vers une autre page après connexion
            this.$router.push('/dashboard');
          } else {
            alert('Identifiants incorrects');
          }
        } catch (error) {
          console.error('Erreur lors de la connexion:', error);
        }
      }
    }
  };
  </script>
  
  <style scoped>
  /* Ajoutez vos styles ici si nécessaire */
  </style>
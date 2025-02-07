<template>
    <!-- Menu en haut à gauche -->
    <div class="d-flex align-items-center p-3">
      <img src="@/assets/user.png" alt="User" class="user-image me-2" />
      <span class="username me-3">{{ username }}</span>
      <div class="dropdown">
        <button class="btn btn-success dropdown-toggle" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
          Menu
        </button>
        <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
          <li><router-link class="dropdown-item" to="/dashboard">Retour au choix des niveaux</router-link></li>
          <li><a class="dropdown-item" href="#" @click="logout">Se déconnecter</a></li>
        </ul>
      </div>
    </div>
  
    <!-- Clicker (à gauche) et Bâtiments (à droite) -->
    <div class="d-flex justify-content-between">
      <!-- Clicker à gauche -->
      <div class="m8-clicker">
        <h2>Esport Clicker</h2>
        <p>Cliquez pour gagner des points !</p>
        <button @click="m8Cookie" class="btn btn-success">
          <img src="@/assets/M8.png" alt="m8" class="m8-image" />
        </button>
        <p>Nombre de coupes : {{ clicks }}</p>
      </div>
  
      <!-- Bâtiments à droite -->
      <div class="buildings">
        <h3>Bâtiments</h3>
        <div v-for="(building, index) in buildings" :key="index" class="mb-3">
          <button @click="buyBuilding(building)" class="btn btn-primary">
            Acheter {{ building.name }} (Coût : {{ building.cost }})
          </button>
          <span>Quantité : {{ building.quantity }}</span>
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
  
        clicks: 0, // Nombre de clics
        buildings: [
        { name: 'Entrainement', cost: 10, quantity: 0, passiveRate: 1 }, // 1 clic par seconde
        { name: 'Achat joueur mid', cost: 50, quantity: 0, passiveRate: 5 }, // 5 clics par seconde
        { name: 'Competition', cost: 100, quantity: 0, passiveRate: 10 }, // 10 clics par seconde
        { name: 'Pract avec pro', cost: 200, quantity: 0, passiveRate: 20 }, // 20 clics par seconde
        { name: 'Achat joueur pro', cost: 500, quantity: 0, passiveRate: 50 }, // 50 clics par seconde
        { name: 'Reconnaissance de la structure', cost: 1000, quantity: 0, passiveRate: 100 }, // 100 clics par seconde
      ],
      };
    },
    methods: {
      logout() {  
        // Supprimez les informations de l'utilisateur
        localStorage.removeItem('username');
        localStorage.removeItem('userLevel');
        this.$router.push('/login');
      },
      matchCookie() {
        this.clicks += 1;
        this.saveData(); // Sauvegarder les données après chaque clic
      },
      async checkLevelUp() {
        // Passer au niveau suivant si l'utilisateur a acheté le dernier bâtiment 10 fois
        const lastBuilding = this.buildings[this.buildings.length - 1];
        if (lastBuilding.quantity >= 10) {
          this.levelUp();
        }
      },
      async levelUp() {
      try {
        const response = await fetch('http://localhost/clicker2/backend/levelup.php', {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json',
          },
          body: JSON.stringify({
            username: this.username,
          }),
        });
  
        const data = await response.json();
  
        if (data.success) {
          alert('Félicitations, vous avez passé un niveau !');
          this.userLevel += 1; // Mettre à jour le niveau dans le frontend
          this.clicks = 0; // Réinitialiser les clics
          this.buildings = []; // Réinitialiser les bâtiments
        } else {
          alert('Erreur lors de la mise à jour du niveau');
        }
      } catch (error) {
        console.error('Erreur lors de la mise à jour du niveau:', error);
      }
    },
    calculatePassiveClicks() {
      let passiveClicks = 0;
      this.buildings.forEach(building => {
        passiveClicks += building.quantity * building.passiveRate;
      });
      return passiveClicks;
    },
      buyBuilding(building) {
        if (this.clicks >= building.cost) {
          this.clicks -= building.cost;
          building.quantity += 1;
          building.cost = Math.ceil(building.cost * 1.15); // Augmenter le coût du bâtiment
          this.saveData(); // Sauvegarder les données après chaque achat
          this.checkLevelUp(); // Vérifier si l'utilisateur peut passer au niveau suivant
        } else {
          alert('Pas assez de coupes pour acheter ce bâtiment !');
        }
      },
      async saveData() {
        try {
          const response = await fetch('http://localhost/clicker2/backend/save.php', {
            method: 'POST',
            headers: {
              'Content-Type': 'application/json',
            },
            body: JSON.stringify({
              username: this.username,
              clicks: this.clicks,
              buildings: this.buildings,
            }),
          });
  
          const data = await response.json();
          if (!data.success) {
            console.error('Erreur lors de la sauvegarde des données');
          }
        } catch (error) {
          console.error('Erreur lors de la sauvegarde des données:', error);
        }
      },
    },
    async created() {
      // Récupérer les données de l'utilisateur au chargement du composant
      try {
        const response = await fetch('http://localhost/clicker2/backend/load.php', {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json',
          },
          body: JSON.stringify({
            username: this.username,
          }),
        });
  
        const data = await response.json();
        if (data.success) {
          this.clicks = data.clicks;
          this.buildings = data.buildings;
        }
      } catch (error) {
        console.error('Erreur lors du chargement des données:', error);
      }
    },
  };
  </script>
  
  <style scoped>
  .user-image {
    width: 40px;
    height: 40px;
    border-radius: 50%;
  }
  
  .username {
    font-size: 1.2rem;
    font-weight: bold;
  }
  
  .m8-clicker {
    text-align: left;
    padding: 20px;
  }
  
  .m8-image {
    width: 250px;
    height: 250px;
    vertical-align: middle;
  }
  
  .buildings {
    text-align: left;
    padding: 20px;
  }
  
  .d-flex {
    display: flex;
    justify-content: space-between;
  }
  
  .d-flex .m8-clicker {
    width: 48%; /* Pour occuper moins de place à gauche */
  }
  
  .d-flex .buildings {
    width: 48%; /* Pour occuper moins de place à droite */
  }
  </style>
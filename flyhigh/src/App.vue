<script setup>
import navbar from './components/navbar.vue'
import landing from './components/landing.vue'
</script>

<template>
  <p class="bg-amber-100 text-amber-900 text-center text-sm p-2 " role="note">Démonstration — aucune donnée envoyée, les boutons sont inactifs.</p>
  <navbar/>
  <landing/>
  <footer class="p-4 text-center text-sm text-gray-500">
    <p>Démonstration visuelle : aucune donnée n'est envoyée.
      <a class="underline" href="../mentions-legales.html">Mentions légales</a> ·
      <a class="underline" href="../confidentialite.html">Confidentialité</a></p>
  </footer>
</template>

<style scoped>

</style>

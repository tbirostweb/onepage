<script setup>

</script>

<template>
  <div class="px-6 py-4 mb-2 flex flex-row justify-between items-center">
    <h1 class="text-4xl font-black">BR.<span class="text-amber-500">F</span> </h1>

    <input class="bg-gray-100 rounded-md py-2 px-8 text-base" id="search" type="search" placeholder="🔍 Rechercher">

    <div class="flex flex-row justify-between items-center gap-6">
        <div class="flex flex-col items-center gap-1">
          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-shopping-bag-icon lucide-shopping-bag"><path d="M16 10a4 4 0 0 1-8 0"/><path d="M3.103 6.034h17.794"/><path d="M3.4 5.467a2 2 0 0 0-.4 1.2V20a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6.667a2 2 0 0 0-.4-1.2l-2-2.667A2 2 0 0 0 17 2H7a2 2 0 0 0-1.6.8z"/></svg>
          <p class="text-xs text-gray-600">Cart</p>
        </div>
        <div class="flex flex-col items-center gap-1">
          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-heart-icon lucide-heart"><path d="M2 9.5a5.5 5.5 0 0 1 9.591-3.676.56.56 0 0 0 .818 0A5.49 5.49 0 0 1 22 9.5c0 2.29-1.5 4-3 5.5l-5.492 5.313a2 2 0 0 1-3 .019L5 15c-1.5-1.5-3-3.2-3-5.5"/></svg>
          <p class="text-xs text-gray-600">Favorites</p>
        </div>
            <img class="border border-gray-300 w-12 h-12 rounded-full bg-gray-200" src="" alt="pp">
        </div>
</div>

  <nav class="px-6">
    <ul class="flex flex-wrap gap-8 font-medium text-lg">
      <li>
        <a href="">Women</a>
      </li>
      <li>
        <a href="">Men</a>
      </li>
      <li>
      <a href="">Kids</a>
    </li>
      <li>
      <a href="">Sports</a>
    </li>
      <li>
        <a href="">Brands</a>
      </li>
      <li>
        <a href="">New</a>
      </li>
      <li>
        <a class="text-red-500" href="">Sale</a>
      </li>
    </ul>
  </nav>
<div class="p-4" >
<div class=" h-[0.5px] bg-gray-400 w-full">
</div>
</div>

</template>

<style scoped>

</style>

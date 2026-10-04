<script setup>

</script>

<template>
  <div class="p-4 mt-10 font">
    <div class="flex flex-col md:flex-row items-start md:items-end justify-between gap-6">
      <div class="text-4xl md:text-6xl font-light">
        <h1><span class="block mb-3">Projects `Made</span><span class="block">Easier^</span></h1>
      </div>
      <div class="flex flex-row items-end gap-10 font-medium">
        <div class="text-4xl">/</div>
        <div class="flex flex-col">
          <h2><span class="block mb-3">Easily Organize Your</span><span class="block">Project Work</span></h2>
        </div>
      </div>
      <div class="flex flex-row items-end">
        <button type="button" aria-disabled="true" title="Démonstration" class="flex flex-row items-center gap-2 rounded-full bg-green-500 p-2 px-4 text-black">
          Begin
          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-move-right-icon lucide-move-right"><path d="M18 8L22 12L18 16"/><path d="M2 12H22"/></svg>
        </button>
      </div>
    </div>
  </div>

  <div class="grid grid-cols-1 md:grid-cols-3 gap-4 mt-6 p-4">
    <div class="h-80 md:col-span-2 rounded-xl bg-green-400" aria-hidden="true"></div>
    <div class="h-80 rounded-xl bg-fuchsia-400" aria-hidden="true"></div>
  </div>

  <div class="grid grid-cols-2 md:grid-cols-5 gap-4 p-4 mt-6 text-2xl md:text-4xl font-semibold place-items-center">
    <div>Rakuten</div>
    <div>NCR</div>
    <div>Monday.com</div>
    <div>Disney</div>
    <div>Dropbox</div>
  </div>

</template>

<style scoped>

</style>

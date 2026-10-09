<script setup>

</script>

<template>
  <nav class="flex items-center justify-between p-4 font-medium">
    <!-- Left Section -->
    <div class="flex items-center gap-3">
      <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-loader-pinwheel-icon lucide-loader-pinwheel"><path d="M22 12a1 1 0 0 1-10 0 1 1 0 0 0-10 0"/><path d="M7 20.7a1 1 0 1 1 5-8.7 1 1 0 1 0 5-8.6"/><path d="M7 3.3a1 1 0 1 1 5 8.6 1 1 0 1 0 5 8.6"/><circle cx="12" cy="12" r="10"/></svg>
      <span>/</span>
      <a href="#" class="transition hover:text-gray-300">support@tract.ai</a>
    </div>

    <!-- Center Section -->
    <ul class="flex items-center gap-4">
      <li><a href="#" class="transition hover:text-gray-300">Currency</a></li>
      <li class="text-gray-500" aria-hidden="true">·</li>
      <li><a href="#" class="transition hover:text-gray-300">Data</a></li>
      <li class="text-gray-500" aria-hidden="true">·</li>
      <li><a href="#" class="transition hover:text-gray-300">Web App</a></li>
      <li class="text-gray-500" aria-hidden="true">·</li>
      <li><a href="#" class="transition hover:text-gray-300">Payment</a></li>
    </ul>

    <!-- Right Section -->
    <div class="flex items-center gap-3">
        <button class="px-3 py-1.5 rounded-full transition hover:bg-white/10">
            Login
        </button>
        <button class="flex items-center gap-2 rounded-full border border-white px-3 py-1.5 transition hover:bg-white/10">
            Download
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="h-5 w-5 lucide lucide-move-down-right-icon lucide-move-down-right"><path d="M19 13V19H13"/><path d="M5 5L19 19"/></svg>
        </button>
    </div>
  </nav>

</template>

<style scoped>

</style>

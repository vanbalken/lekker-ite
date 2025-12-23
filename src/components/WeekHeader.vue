<script setup>
defineProps({
  label: {
    type: String,
    required: true,
  },
});

const emit = defineEmits(['prev', 'next']);
</script>

<template>
  <header class="week-header">
    <button class="nav" @click="emit('prev')" aria-label="Vorige week">‹</button>

    <div class="week-label">
      {{ label }}
    </div>

    <button class="nav" @click="emit('next')" aria-label="Volgende week">›</button>
  </header>
</template>

<style scoped>
.week-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  background: white;
  padding: 1rem;
  border-radius: 12px;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
  margin-bottom: 1rem;
}

.week-label {
  font-weight: bold;
  font-size: 1.2rem;
  color: #333;
}

.nav {
  background: #0070f3;
  color: white;
  border: none;
  border-radius: 8px;
  padding: 0.5rem 1rem;
  font-size: 1rem;
  cursor: pointer;
  transition: background 0.2s;
}

.nav:hover {
  background: #005ac1;
}
</style>

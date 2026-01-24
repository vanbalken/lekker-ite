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
  background: #2a2a2a;
  padding: 1rem;
  border-radius: 12px;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.3);
  margin-bottom: 1rem;
}

.week-label {
  font-weight: bold;
  font-size: 1.2rem;
  color: #e0e0e0;
}

.nav {
  background: #2563eb;
  color: white;
  border: none;
  border-radius: 8px;
  padding: 0.5rem 1rem;
  font-size: 1rem;
  cursor: pointer;
  transition: background 0.2s;
}

.nav:hover {
  background: #1d4ed8;
}
</style>

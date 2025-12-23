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
  align-items: center;
  justify-content: space-between;
  max-width: 500px;
  margin: 0 auto 0.75rem;
  padding: 0.5rem 0.25rem;
}

.week-label {
  font-weight: 600;
  font-size: 1rem;
}

.nav {
  background: none;
  border: none;
  font-size: 1.5rem;
  padding: 0.25rem 0.5rem;
  cursor: pointer;
  color: #333;
}

.nav:active {
  transform: scale(0.95);
}
</style>

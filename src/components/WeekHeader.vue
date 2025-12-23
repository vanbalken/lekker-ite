<script setup>
import { computed } from 'vue';
import dayjs from 'dayjs';
import 'dayjs/locale/nl';

dayjs.locale('nl');

const props = defineProps({
  weekStart: {
    type: Object,
    required: true,
  },
});

const emit = defineEmits(['prev', 'next']);

const weekLabel = computed(() => {
  const start = props.weekStart;
  const end = start.add(6, 'day');

  return `${start.format('D MMM')} – ${end.format('D MMM YYYY')}`;
});
</script>

<template>
  <header class="week-header">
    <button class="nav" @click="emit('prev')" aria-label="Vorige week">‹</button>

    <div class="week-label">
      {{ weekLabel }}
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

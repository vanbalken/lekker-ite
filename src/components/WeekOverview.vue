<script setup>
import { computed } from 'vue';
import dayjs from 'dayjs';
import isoWeek from 'dayjs/plugin/isoWeek';
import 'dayjs/locale/nl';

dayjs.extend(isoWeek);
dayjs.locale('nl');

const props = defineProps({
  weekStart: {
    type: Object,
    required: true,
  },
});

const weekDays = computed(() => {
  return Array.from({ length: 7 }).map((_, i) => {
    const d = props.weekStart.add(i, 'day');
    return {
      date: d.format('YYYY-MM-DD'),
      label: d.format('dddd'),
      display: d.format('DD MMM'),
    };
  });
});
</script>

<template>
  <section class="mealplanner">
    <ul class="week">
      <li v-for="day in weekDays" :key="day.date" class="day">
        <div class="day-left">
          <div class="day-name">{{ day.label }}</div>
          <div class="day-date">{{ day.display }}</div>
        </div>

        <div class="day-right">
          <span class="meal-placeholder">—</span>
        </div>
      </li>
    </ul>
  </section>
</template>

<style scoped>
.mealplanner {
  max-width: 500px;
  margin: 0 auto;
  background: #ffffff;
  border-radius: 12px;
  padding: 0.5rem 0;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
}

.week {
  list-style: none;
  margin: 0;
  padding: 0;
}

.day {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 0.75rem 1rem;
  border-bottom: 1px solid #eee;
}

.day:last-child {
  border-bottom: none;
}

.day-left {
  display: flex;
  flex-direction: column;
}

.day-name {
  font-weight: 600;
  text-transform: capitalize;
}

.day-date {
  font-size: 0.85rem;
  color: #666;
}

.day-right {
  color: #bbb;
  font-size: 0.9rem;
}

.meal-placeholder {
  font-style: italic;
}
</style>

<script setup>
defineProps({
  days: {
    type: Array,
    required: true,
  },
  mealsByDate: {
    type: Object,
    required: true,
  },
});

const emit = defineEmits(['update-meal']);

function onInput(day, event) {
  emit('update-meal', day.date, event.target.value);
}
</script>

<template>
  <section class="mealplanner">
    <ul class="week">
      <li v-for="day in days" :key="day.date" class="day">
        <div class="day-left">
          <div class="day-name">{{ day.label }}</div>
          <div class="day-date">{{ day.display }}</div>
        </div>

        <div class="day-right">
          <input
            type="text"
            class="meal-input"
            placeholder="Maaltijd"
            :value="mealsByDate[day.date]?.meal_title || ''"
            @input="onInput(day, $event)"
          />
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

.meal-input {
  width: 100%;
  max-width: 180px;
  padding: 0.4rem 0.5rem;
  border-radius: 6px;
  border: 1px solid #ddd;
  font-size: 0.9rem;
}

.meal-input:focus {
  outline: none;
  border-color: #999;
}
</style>

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
  background: white;
  padding: 1rem;
  border-radius: 12px;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
}

.week {
  list-style: none;
  padding: 0;
  margin: 0;
}

.day {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 0.75rem 0;
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
  font-weight: bold;
  color: #333;
}

.day-date {
  font-size: 0.9rem;
  color: #666;
}

.meal-input {
  padding: 0.5rem 1rem;
  border: 1px solid #ccc;
  border-radius: 8px;
  font-size: 1rem;
  width: 200px;
  transition: border 0.2s;
}

.meal-input:focus {
  border-color: #0070f3;
  outline: none;
}
</style>

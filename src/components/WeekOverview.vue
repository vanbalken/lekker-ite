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

const emit = defineEmits(['update-local', 'save-meal']);

function onInput(date, event) {
  emit('update-local', date, event.target.value);
}

function onBlur(date) {
  emit('save-meal', date);
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
            @input="onInput(day.date, $event)"
            @blur="onBlur(day.date)"
          />
        </div>
      </li>
    </ul>
  </section>
</template>

<style scoped>
.mealplanner {
  background: #2a2a2a;
  padding: 1rem;
  border-radius: 12px;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.3);
}

.week {
  list-style: none;
  padding: 0;
  margin: 0;
}

.day {
  display: grid;
  grid-template-columns: 1fr;
  gap: 0.5rem;
  padding: 0.75rem 0;
  border-bottom: 1px solid #444;
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
  color: #e0e0e0;
}

.day-date {
  font-size: 0.9rem;
  color: #888;
}

.meal-input {
  width: 100%;
  box-sizing: border-box; /* 🔑 voorkomt overlopen */
  padding: 0.6rem 0.8rem;
  border: 1px solid #444;
  border-radius: 8px;
  font-size: 1rem;
  background: #1a1a1a;
  color: #e0e0e0;
  transition: border 0.2s;
}

.meal-input::placeholder {
  color: #666;
}

.meal-input:focus {
  border-color: #2563eb;
  outline: none;
}

/* =========================
   Desktop layout
   ========================= */
@media (min-width: 768px) {
  .day {
    grid-template-columns: 160px 1fr;
    align-items: center;
    gap: 1rem;
  }

  .day-left {
    flex-direction: column;
  }

  .meal-input {
    max-width: 100%;
    font-size: 1.05rem;
  }
}
</style>

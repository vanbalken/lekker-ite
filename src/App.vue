<script setup>
import { reactive } from 'vue';
import { useAuth } from '@/composables/useAuth';
import { useWeek } from '@/composables/useWeek';

import LoginForm from '@/components/LoginForm.vue';
import WeekHeader from '@/components/WeekHeader.vue';
import WeekOverview from '@/components/WeekOverview.vue';

const { session, logout } = useAuth();
const { weekDays, weekLabel, nextWeek, previousWeek } = useWeek();

// key = planned_date (YYYY-MM-DD)
const mealsByDate = reactive({});

function updateMeal(plannedDate, mealTitle) {
  const title = mealTitle.trim();

  if (!title) {
    // lege input → verwijderen uit state
    delete mealsByDate[plannedDate];
    return;
  }

  mealsByDate[plannedDate] = {
    planned_date: plannedDate,
    meal_title: title,
  };
}
</script>

<template>
  <main class="app">
    <LoginForm v-if="!session" />

    <template v-else>
      <header class="topbar">
        <button class="logout" @click="logout">Logout</button>
      </header>

      <WeekHeader :label="weekLabel" @prev="previousWeek" @next="nextWeek" />

      <WeekOverview :days="weekDays" :meals-by-date="mealsByDate" @update-meal="updateMeal" />
    </template>
  </main>
</template>

<style scoped>
.app {
  width: 100%;
  max-width: 700px;
  margin: 1rem auto;
  font-family: system-ui, sans-serif;
  background: #f7f7f7;
  padding: 1rem;
  border-radius: 12px;
}

/* Voor grotere schermen iets meer padding */
@media (min-width: 768px) {
  .app {
    padding: 2rem;
  }
}

.topbar {
  display: flex;
  justify-content: flex-end;
  margin-bottom: 1rem;
}

.logout {
  padding: 0.5rem 1rem;
  border: none;
  border-radius: 8px;
  background: #0070f3;
  color: white;
  cursor: pointer;
  transition: background 0.2s;
}

.logout:hover {
  background: #005ac1;
}
</style>

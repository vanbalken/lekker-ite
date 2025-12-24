<script setup>
import { reactive, watch } from 'vue';
import { useAuth } from '@/composables/useAuth';
import { useWeek } from '@/composables/useWeek';
import { supabase } from '@/lib/supabase';

import LoginForm from '@/components/LoginForm.vue';
import WeekHeader from '@/components/WeekHeader.vue';
import WeekOverview from '@/components/WeekOverview.vue';

/**
 * Auth & week state
 */
const { session, logout } = useAuth();
const { weekStart, weekDays, weekLabel, nextWeek, previousWeek } = useWeek();

/**
 * Meals state
 * key = planned_date (YYYY-MM-DD)
 */
const mealsByDate = reactive({});

/**
 * Load meals for active week
 */
async function loadMealsForWeek(start, end) {
  const { data, error } = await supabase
    .from('meal_plans')
    .select('*')
    .gte('planned_date', start)
    .lte('planned_date', end);

  if (error) {
    console.error('Load meals failed:', error.message);
    return;
  }

  // clear reactive object
  Object.keys(mealsByDate).forEach((k) => delete mealsByDate[k]);

  data?.forEach((m) => {
    mealsByDate[m.planned_date] = m;
  });
}

/**
 * Watch auth + week changes
 * → single source of truth
 */
watch(
  [() => session.value, () => weekStart.value],
  ([sessionValue, start]) => {
    if (!sessionValue || !start) return;

    const startDate = start.format('YYYY-MM-DD');
    const endDate = start.add(6, 'day').format('YYYY-MM-DD');

    loadMealsForWeek(startDate, endDate);
  },
  { immediate: true },
);

/**
 * Local update (input)
 */
function updateMealLocal(plannedDate, mealTitle) {
  mealsByDate[plannedDate] = {
    planned_date: plannedDate,
    meal_title: mealTitle,
  };
}

/**
 * Save to Supabase (blur)
 */
async function saveMeal(plannedDate) {
  const meal = mealsByDate[plannedDate];
  const title = meal?.meal_title?.trim();

  // empty → delete
  if (!title) {
    delete mealsByDate[plannedDate];

    const { error } = await supabase.from('meal_plans').delete().eq('planned_date', plannedDate);

    if (error) console.error(error.message);
    return;
  }

  // upsert
  const { error } = await supabase.from('meal_plans').upsert(
    {
      planned_date: plannedDate,
      meal_title: title,
    },
    { onConflict: 'planned_date' },
  );

  if (error) console.error(error.message);
}
</script>

<template>
  <main class="app">
    <div v-if="!session" class="login-page">
      <LoginForm />
    </div>

    <div v-else class="app-content">
      <header class="topbar">
        <button class="logout" @click="logout">Logout</button>
      </header>

      <WeekHeader :label="weekLabel" @prev="previousWeek" @next="nextWeek" />

      <WeekOverview
        :days="weekDays"
        :meals-by-date="mealsByDate"
        @update-local="updateMealLocal"
        @save-meal="saveMeal"
      />
    </div>
  </main>
</template>

<style scoped>
/* Volledige pagina achtergrond */
.app {
  font-family: system-ui, sans-serif;
  min-height: 100vh;
  background: #f7f7f7;
}

/* LOGIN LAYOUT */
.login-page {
  min-height: 100vh;
  display: flex;
  align-items: center; /* verticaal */
  justify-content: center; /* horizontaal */
  padding: 1rem; /* voorkomt afsnijden op mobiel */
}

/* APP CONTENT */
.app-content {
  max-width: 700px;
  margin: 0 auto;
  padding: 1rem;
}

@media (min-width: 768px) {
  .app-content {
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
}

.logout:hover {
  background: #005ac1;
}
</style>

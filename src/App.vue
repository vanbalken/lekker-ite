<script setup>
import { reactive } from 'vue';
import { useWeek } from '@/composables/useWeek';
import WeekHeader from '@/components/WeekHeader.vue';
import WeekOverview from '@/components/WeekOverview.vue';

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
    <WeekHeader :label="weekLabel" @prev="previousWeek" @next="nextWeek" />

    <WeekOverview :days="weekDays" :meals-by-date="mealsByDate" @update-meal="updateMeal" />
  </main>
</template>

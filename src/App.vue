<script setup>
import { ref } from 'vue';
import dayjs from 'dayjs';
import isoWeek from 'dayjs/plugin/isoWeek';

import WeekHeader from './components/WeekHeader.vue';
import WeekOverview from './components/WeekOverview.vue';

dayjs.extend(isoWeek);

const currentWeekStart = ref(dayjs().startOf('isoWeek'));

function goToPreviousWeek() {
  currentWeekStart.value = currentWeekStart.value.subtract(1, 'week');
}

function goToNextWeek() {
  currentWeekStart.value = currentWeekStart.value.add(1, 'week');
}
</script>

<template>
  <main class="app">
    <WeekHeader :week-start="currentWeekStart" @prev="goToPreviousWeek" @next="goToNextWeek" />

    <WeekOverview :week-start="currentWeekStart" />
  </main>
</template>

<style>
body {
  margin: 0;
  background: #f7f7f7;
  font-family:
    system-ui,
    -apple-system,
    BlinkMacSystemFont,
    sans-serif;
}

.app {
  padding: 1rem;
}
</style>

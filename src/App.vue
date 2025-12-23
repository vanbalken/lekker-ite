<script setup>
import { useWeek } from '@/composables/useWeek';
import WeekHeader from '@/components/WeekHeader.vue';
import WeekOverview from '@/components/WeekOverview.vue';

const { weekDays, weekLabel, nextWeek, previousWeek } = useWeek();
</script>

<template>
  <main class="app">
    <WeekHeader :label="weekLabel" @prev="previousWeek" @next="nextWeek" />

    <WeekOverview :days="weekDays" />
  </main>
</template>

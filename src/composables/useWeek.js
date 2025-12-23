import { ref, computed } from 'vue';
import dayjs from '@/lib/dayjs';

export function useWeek(initialDate = dayjs()) {
  const weekStart = ref(initialDate.startOf('isoWeek'));

  const weekDays = computed(() => {
    return Array.from({ length: 7 }).map((_, i) => {
      const d = weekStart.value.add(i, 'day');

      return {
        date: d.format('YYYY-MM-DD'),
        label: d.format('dddd'),
        display: d.format('DD MMM'),
        isToday: d.isSame(dayjs(), 'day'),
      };
    });
  });

  const weekLabel = computed(() => {
    const start = weekStart.value;
    const end = start.add(6, 'day');

    return `${start.format('D MMM')} – ${end.format('D MMM YYYY')}`;
  });

  function nextWeek() {
    weekStart.value = weekStart.value.add(1, 'week');
  }

  function previousWeek() {
    weekStart.value = weekStart.value.subtract(1, 'week');
  }

  return {
    weekStart,
    weekDays,
    weekLabel,
    nextWeek,
    previousWeek,
  };
}

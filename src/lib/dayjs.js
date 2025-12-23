import dayjs from 'dayjs';
import isoWeek from 'dayjs/plugin/isoWeek';
import 'dayjs/locale/nl';

dayjs.extend(isoWeek);
dayjs.locale('nl');

export default dayjs;

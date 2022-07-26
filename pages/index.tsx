import { format, getMonth, getWeekOfMonth } from "date-fns";

const DAYS = [
  "Monday",
  "Tuesday",
  "Wednesday",
  "Thursday",
  "Friday",
  "Saturday",
  "Sunday",
];

const monthToDaypi = (ordinalMonth: number) => {
  const idx = ordinalMonth;
  return ordinalMonth > 7
    ? `${DAYS[1]}${DAYS[idx % 7]}`
    : `${DAYS[0]}${DAYS[idx % 7]}`;
};

const weekOfMonthToDaypi = (ordinalWeekOfMonth: number) => {
  return DAYS[ordinalWeekOfMonth - 1];
};

const dateToDaypi = (date: Date) => {
  const monthPart = monthToDaypi(getMonth(date));
  const weekPart = weekOfMonthToDaypi(getWeekOfMonth(date));
  const dayPart = format(date, "eeee");
  return { monthPart, dayPart, weekPart };
};

const Daypi = () => {
  const { monthPart, dayPart, weekPart } = dateToDaypi(new Date());
  return (
    <div className="wrapper">
      <div className="text">
        <span>{monthPart}</span>
        <span>{weekPart}</span>
        <span>{dayPart}</span>
      </div>
    </div>
  );
};

export default Daypi;

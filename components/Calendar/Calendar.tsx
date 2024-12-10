"use client";

import styles from "./Calendar.module.scss";
import classNames from "classnames/bind";
import Day from "@/components/Day/Day";
import { useState } from "react";
import { getMonthByWeek } from "@/utils/calendar";

const cx = classNames.bind(styles);

export default function Calendar() {
  const now = new Date();
  const [days, setDays] = useState(getMonthByWeek(now));

  return (
    <div className={cx("calendar")}>
      <div className={cx("calendar-header")}></div>
      <div className={cx("calendar-body")}>
        {days.map((date) => (
          <Day key={date} date={date} />
        ))}
      </div>
    </div>
  );
}

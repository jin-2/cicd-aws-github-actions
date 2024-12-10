"use client";

import styles from "./Day.module.scss";
import classNames from "classnames/bind";
import { getDate } from "date-fns";

const cx = classNames.bind(styles);

export default function Day({ date }: { date: string }) {
  const dateFormat = new Date(date);
  const day = getDate(dateFormat);

  return (
    <div className={cx("day")}>
      <time dateTime={date}>{day}</time>
    </div>
  );
}

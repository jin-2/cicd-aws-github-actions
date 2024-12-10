import styles from "./page.module.css";
import Calendar from "@/components/Calendar/Calendar";

export default function Home() {
  return (
    <div className={styles.page}>
      <Calendar />
    </div>
  );
}

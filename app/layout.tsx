import type { Metadata } from "next";
import "./globals.css";

export const metadata: Metadata = {
  title: "큰클씨 캘린더",
  description: "캘린더 날짜를 크게 확인하세요.",
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="ko">
      <body>
        {children}
      </body>
    </html>
  );
}

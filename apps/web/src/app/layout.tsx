import "./globals.css";
import React from "react";

export default function RootLayout({ children }: { children: React.ReactNode }): JSX.Element {
  return (
    <html lang="vi">
      <body>{children}</body>
    </html>
  );
}

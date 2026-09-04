import "./globals.css";
import { Inter, Hind_Siliguri } from "next/font/google";

const inter = Inter({
  subsets: ["latin"],
  variable: "--font-inter",
  display: "swap",
});

const hindSiliguri = Hind_Siliguri({
  subsets: ["bengali"],
  weight: ["300", "400", "500", "600", "700"],
  variable: "--font-hind-siliguri",
  display: "swap",
});

export const metadata = {
  title: "Islamic EBook — ইসলামিক জ্ঞানের বিশাল ভাণ্ডার",
  description:
    "Quran, Hadith, Seerah, Dua ও ইসলামের ইতিহাসসহ অসংখ্য ইসলামিক বই পড়ুন — সবকিছু এক জায়গায়, আধুনিক ও শান্তিপূর্ণ পড়ার অভিজ্ঞতায়।",
  keywords: [
    "Islamic EBook",
    "ইসলামিক বই",
    "Quran",
    "Hadith",
    "Seerah",
    "Dua",
    "Islamic App",
    "Digital Library",
  ],
  authors: [{ name: "Islamic EBook" }],
  openGraph: {
    title: "Islamic EBook — ইসলামিক জ্ঞানের ডিজিটাল সঙ্গী",
    description:
      "আধুনিক ও শান্তিপূর্ণ উপায়ে ইসলামিক জ্ঞান অর্জন করুন।",
    type: "website",
  },
};

export default function RootLayout({ children }) {
  return (
    <html lang="bn" className={`${inter.variable} ${hindSiliguri.variable}`}>
      <body className="font-bengali bg-ivory-50 text-forest-950 antialiased">
        {children}
      </body>
    </html>
  );
}

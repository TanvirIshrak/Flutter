"use client";

import { BookOpen, Search, Bookmark, Moon } from "lucide-react";
import Reveal from "@/lib/Reveal";
import { GeometricStar } from "./Patterns";

const features = [
  {
    icon: BookOpen,
    title: "বিস্তৃত ইসলামিক লাইব্রেরি",
    desc:
      "Quran, Hadith, Seerah, Fiqh, Islamic History, Dua সহ বিভিন্ন বিষয়ের বই এক জায়গায়।",
    accent: "bg-gradient-to-br from-forest-700 to-forest-900",
  },
  {
    icon: Search,
    title: "সহজে বই খুঁজুন",
    desc:
      "বিষয়, লেখক বা বইয়ের নাম দিয়ে দ্রুত আপনার প্রয়োজনীয় বই খুঁজে নিন।",
    accent: "bg-gradient-to-br from-gold-300 to-gold-500",
  },
  {
    icon: Bookmark,
    title: "বুকমার্ক ও রিডিং প্রগ্রেস",
    desc:
      "আপনার প্রিয় বই সংরক্ষণ করুন এবং যেখানে শেষ করেছেন সেখান থেকেই আবার পড়া শুরু করুন।",
    accent: "bg-gradient-to-br from-forest-600 to-forest-800",
  },
  {
    icon: Moon,
    title: "শান্তিপূর্ণ পড়ার অভিজ্ঞতা",
    desc:
      "পরিষ্কার ও distraction-free reading interface আপনাকে মনোযোগ দিয়ে পড়তে সাহায্য করবে।",
    accent: "bg-gradient-to-br from-forest-900 to-forest-950",
  },
];

export default function Features() {
  return (
    <section id="features" className="relative section-pad bg-ivory-50 overflow-hidden">
      <GeometricStar className="absolute -top-10 -left-10 opacity-25" size={200} color="#047857" />
      <div className="absolute top-1/2 right-0 w-72 h-72 rounded-full bg-gold-400/5 blur-3xl"></div>

      <div className="relative mx-auto max-w-7xl px-5 md:px-8">
        <Reveal className="text-center max-w-2xl mx-auto mb-14">
          <span className="inline-block text-xs font-semibold tracking-[0.2em] uppercase text-forest-700 mb-4">
            বৈশিষ্ট্য
          </span>
          <h2 className="text-3xl md:text-4xl lg:text-5xl font-bold text-forest-950 leading-tight">
            কেন <span className="text-gradient-forest">Islamic EBook?</span>
          </h2>
          <p className="mt-5 text-forest-900/70 text-base md:text-lg leading-relaxed">
            ইসলামিক জ্ঞান অর্জনকে আরও সহজ, সুন্দর এবং সবার জন্য সহজলভ্য করতে
            আমরা তৈরি করেছি এই প্ল্যাটফর্ম।
          </p>
        </Reveal>

        <div className="grid sm:grid-cols-2 lg:grid-cols-4 gap-5 md:gap-6">
          {features.map((f, i) => {
            const Icon = f.icon;
            return (
              <Reveal key={f.title} delay={i * 80}>
                <div className="group relative h-full bg-white rounded-2xl p-7 shadow-soft border border-forest-900/5 hover:shadow-cardHover hover:-translate-y-1.5 transition-all duration-500 overflow-hidden">
                  {/* Decorative pattern */}
                  <svg
                    className="absolute -right-4 -bottom-4 w-32 h-32 opacity-[0.04] group-hover:opacity-[0.08] transition-opacity"
                    viewBox="0 0 100 100"
                    aria-hidden="true"
                  >
                    <path
                      d="M50 5 L61 39 L95 39 L68 60 L79 95 L50 73 L21 95 L32 60 L5 39 L39 39 Z"
                      fill="#047857"
                    />
                  </svg>

                  <div className={`w-14 h-14 rounded-2xl ${f.accent} flex items-center justify-center shadow-md mb-5`}>
                    <Icon className="w-6 h-6 text-ivory-50" strokeWidth={1.8} />
                  </div>

                  <h3 className="text-lg font-bold text-forest-950 mb-2.5 leading-snug">
                    {f.title}
                  </h3>
                  <p className="text-sm text-forest-900/70 leading-relaxed">
                    {f.desc}
                  </p>
                </div>
              </Reveal>
            );
          })}
        </div>
      </div>
    </section>
  );
}
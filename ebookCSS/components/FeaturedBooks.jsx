"use client";

import { Star, BookOpen } from "lucide-react";
import Reveal from "@/lib/Reveal";
import BookCover from "./BookCover";

const books = [
  {
    title: "আর-রাহীকুল মাখতূম",
    author: "সফিউর রহমান মুবারকপুরী",
    category: "সীরাত",
    rating: 4.9,
    variant: "emerald",
  },
  {
    title: "হিসনুল মুসলিম",
    author: "সাইয়িদ সাবিক",
    category: "আত্মশুদ্ধি",
    rating: 4.8,
    variant: "gold",
  },
  {
    title: "রিয়াদুস সালিহীন",
    author: "ইমাম নববী",
    category: "হাদীস",
    rating: 5.0,
    variant: "midnight",
  },
  {
    title: "তাফসীর ইবনে কাসীর",
    author: "ইমাম ইবনে কাসীর",
    category: "তাফসীর",
    rating: 4.9,
    variant: "emerald",
  },
  {
    title: "সীরাতুন নবী ﷺ",
    author: "ড. আলী মুহাম্মদ আস-সাল্লাবী",
    category: "সীরাত",
    rating: 4.9,
    variant: "gold",
  },
  {
    title: "দোয়া ও যিকির",
    author: "সম্মলিত সংকলন",
    category: "দোয়া",
    rating: 4.7,
    variant: "ivory",
  },
];

export default function FeaturedBooks() {
  return (
    <section
      id="books"
      className="relative section-pad bg-ivory-50 islamic-pattern-soft overflow-hidden"
    >
      <div className="relative mx-auto max-w-7xl px-5 md:px-8">
        <Reveal className="text-center max-w-2xl mx-auto mb-14">
          <span className="inline-block text-xs font-semibold tracking-[0.2em] uppercase text-forest-700 mb-4">
            জনপ্রিয় বই
          </span>
          <h2 className="text-3xl md:text-4xl lg:text-5xl font-bold text-forest-950 leading-tight">
            <span className="text-gradient-forest">জনপ্রিয় ইসলামিক</span> বই
          </h2>
          <p className="mt-5 text-forest-900/70 text-base md:text-lg leading-relaxed">
            পাঠকদের পছন্দের শীর্ষ ইসলামিক বই — সুন্দর কভার, সুগঠিত বিষয়বস্তু।
          </p>
        </Reveal>

        <div className="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-6 gap-5 md:gap-6">
          {books.map((b, i) => (
            <Reveal key={b.title} delay={(i % 3) * 80}>
              <div className="group">
                <BookCover
                  title={b.title}
                  subtitle={b.category}
                  author={b.author}
                  variant={b.variant}
                  size="md"
                />
                <div className="mt-4">
                  <h3 className="font-bold text-forest-950 text-sm md:text-base leading-tight line-clamp-1">
                    {b.title}
                  </h3>
                  <p className="text-xs text-forest-700/80 mt-1 line-clamp-1">{b.author}</p>

                  <div className="mt-2 flex items-center justify-between">
                    <div className="flex items-center gap-1">
                      <Star className="w-3 h-3 fill-gold-400 text-gold-400" />
                      <span className="text-xs font-semibold text-forest-900">
                        {b.rating}
                      </span>
                    </div>
                    <span className="text-[10px] uppercase tracking-wider text-forest-700 bg-forest-900/5 px-2 py-0.5 rounded-full">
                      {b.category}
                    </span>
                  </div>

                  <button className="mt-3 w-full text-xs font-semibold bg-emerald-gradient text-ivory-50 py-2 rounded-lg flex items-center justify-center gap-1.5 opacity-0 group-hover:opacity-100 -translate-y-1 group-hover:translate-y-0 transition-all duration-300">
                    <BookOpen className="w-3.5 h-3.5" /> পড়ুন
                  </button>
                </div>
              </div>
            </Reveal>
          ))}
        </div>
      </div>
    </section>
  );
}
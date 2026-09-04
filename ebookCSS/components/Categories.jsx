"use client";

import {
  BookOpen,
  ScrollText,
  Moon,
  Hand,
  Scale,
  History,
  Heart,
  Sun,
  Users,
  Lightbulb,
} from "lucide-react";
import Reveal from "@/lib/Reveal";

const categories = [
  { icon: BookOpen, name: "কুরআন ও তাফসীর", count: "১২০+ বই", tone: "from-forest-700 to-forest-900" },
  { icon: ScrollText, name: "হাদীস", count: "৮০+ বই", tone: "from-gold-300 to-gold-500" },
  { icon: Moon, name: "সীরাত", count: "৫০+ বই", tone: "from-forest-600 to-forest-800" },
  { icon: Hand, name: "দোয়া ও যিকির", count: "৬০+ বই", tone: "from-amber-400 to-amber-600" },
  { icon: Scale, name: "ফিকহ", count: "৭০+ বই", tone: "from-forest-800 to-forest-950" },
  { icon: History, name: "ইসলামের ইতিহাস", count: "৯০+ বই", tone: "from-forest-700 to-forest-900" },
  { icon: Heart, name: "আত্মশুদ্ধি", count: "৪০+ বই", tone: "from-gold-400 to-gold-600" },
  { icon: Sun, name: "রমজান", count: "৩০+ বই", tone: "from-forest-900 to-forest-950" },
  { icon: Users, name: "পরিবার ও জীবন", count: "৫০+ বই", tone: "from-amber-300 to-gold-500" },
  { icon: Lightbulb, name: "ইসলামিক জ্ঞান", count: "১০০+ বই", tone: "from-forest-600 to-forest-800" },
];

export default function Categories() {
  return (
    <section
      id="categories"
      className="relative section-pad bg-gradient-to-b from-ivory-100 to-ivory-50 islamic-pattern-soft overflow-hidden"
    >
      <div className="mx-auto max-w-7xl px-5 md:px-8">
        <Reveal className="text-center max-w-2xl mx-auto mb-14">
          <span className="inline-block text-xs font-semibold tracking-[0.2em] uppercase text-forest-700 mb-4">
            ক্যাটাগরি
          </span>
          <h2 className="text-3xl md:text-4xl lg:text-5xl font-bold text-forest-950 leading-tight">
            আপনার পছন্দের <span className="text-gradient-forest">বিষয় বেছে নিন</span>
          </h2>
          <p className="mt-5 text-forest-900/70 text-base md:text-lg leading-relaxed">
            বিভিন্ন বিষয়ের উপর সুসংগঠিত ক্যাটাগরি থেকে আপনার পছন্দের বই খুঁজে নিন।
          </p>
        </Reveal>

        <div className="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 lg:grid-cols-5 gap-4 md:gap-5">
          {categories.map((c, i) => {
            const Icon = c.icon;
            return (
              <Reveal key={c.name} delay={(i % 5) * 60}>
                <button
                  type="button"
                  className="group w-full bg-white rounded-2xl p-5 md:p-6 shadow-soft border border-forest-900/5 hover:shadow-cardHover hover:-translate-y-1 hover:border-forest-900/15 transition-all duration-500 text-left"
                >
                  <div className={`w-12 h-12 rounded-xl bg-gradient-to-br ${c.tone} flex items-center justify-center shadow-md mb-4 group-hover:scale-110 transition-transform duration-500`}>
                    <Icon className="w-5 h-5 text-ivory-50" strokeWidth={1.8} />
                  </div>
                  <h3 className="font-bold text-forest-950 text-sm md:text-[15px] leading-snug mb-1">
                    {c.name}
                  </h3>
                  <p className="text-xs text-forest-700/70">{c.count}</p>
                </button>
              </Reveal>
            );
          })}
        </div>
      </div>
    </section>
  );
}
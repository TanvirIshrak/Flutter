"use client";

import { Sunrise, ScrollText, Hand, Lightbulb } from "lucide-react";
import Reveal from "@/lib/Reveal";

const items = [
  {
    icon: Sunrise,
    label: "আজকের আয়াত",
    title: "প্রতিদিন একটি আয়াত",
    body: "placeholder content — placeholder ayah excerpt placeholder",
    footer: "— placeholder reference",
    tone: "from-forest-700 to-forest-900",
  },
  {
    icon: ScrollText,
    label: "আজকের হাদীস",
    title: "প্রতিদিন একটি হাদীস",
    body: "placeholder content — placeholder hadith excerpt placeholder",
    footer: "— placeholder narrator & source",
    tone: "from-gold-300 to-gold-500",
  },
  {
    icon: Hand,
    label: "আজকের দোয়া",
    title: "প্রতিদিন একটি দোয়া",
    body: "placeholder content — placeholder dua excerpt placeholder",
    footer: "— placeholder reference",
    tone: "from-forest-800 to-forest-950",
  },
  {
    icon: Lightbulb,
    label: "আজকের শিক্ষা",
    title: "প্রতিদিন একটি শিক্ষা",
    body: "placeholder content — placeholder lesson excerpt placeholder",
    footer: "— placeholder source",
    tone: "from-amber-400 to-amber-600",
  },
];

export default function DailyKnowledge() {
  return (
    <section
      id="daily"
      className="relative section-pad bg-gradient-to-br from-forest-900 via-forest-800 to-forest-950 text-ivory-50 overflow-hidden"
    >
      {/* Decorative pattern */}
      <div className="absolute inset-0 islamic-pattern opacity-30 pointer-events-none"></div>
      <div className="absolute top-0 right-0 w-96 h-96 rounded-full bg-gold-400/10 blur-3xl"></div>

      <div className="relative mx-auto max-w-7xl px-5 md:px-8">
        <Reveal className="text-center max-w-2xl mx-auto mb-14">
          <span className="inline-block text-xs font-semibold tracking-[0.2em] uppercase text-gold-300 mb-4">
            দৈনিক জ্ঞান
          </span>
          <h2 className="text-3xl md:text-4xl lg:text-5xl font-bold leading-tight">
            প্রতিদিন <span className="text-gradient-gold">কিছু শিখুন</span>
          </h2>
          <p className="mt-5 text-ivory-50/70 text-base md:text-lg leading-relaxed">
            প্রতিদিনের জন্য নির্বাচিত আয়াত, হাদীস, দোয়া ও শিক্ষা — একটি শান্তিপূর্ণ ও
            অর্থবহ যাত্রা।
          </p>
        </Reveal>

        <div className="grid sm:grid-cols-2 lg:grid-cols-4 gap-5 md:gap-6">
          {items.map((it, i) => {
            const Icon = it.icon;
            return (
              <Reveal key={it.label} delay={i * 80}>
                <div className="group h-full bg-white/5 backdrop-blur-md border border-white/10 rounded-2xl p-6 hover:bg-white/10 hover:border-gold-400/30 transition-all duration-500">
                  <div className={`w-12 h-12 rounded-xl bg-gradient-to-br ${it.tone} flex items-center justify-center shadow-md mb-5`}>
                    <Icon className="w-5 h-5 text-ivory-50" strokeWidth={1.8} />
                  </div>

                  <p className="text-xs font-semibold tracking-wider uppercase text-gold-300 mb-2">
                    {it.label}
                  </p>
                  <h3 className="text-lg font-bold leading-snug mb-3">{it.title}</h3>
                  <p className="text-sm text-ivory-50/70 leading-relaxed mb-4">
                    {it.body}
                  </p>
                  <p className="text-xs text-ivory-50/50 italic">{it.footer}</p>

                  <div className="mt-5 pt-4 border-t border-white/10 text-xs text-gold-300 font-semibold flex items-center gap-1 group-hover:gap-2 transition-all">
                    আরও জানুন <span>→</span>
                  </div>
                </div>
              </Reveal>
            );
          })}
        </div>

        <p className="text-center text-xs text-ivory-50/40 mt-10 italic">
          * সকল কন্টেন্ট placeholder হিসেবে দেখানো হয়েছে। প্রকাশিত কন্টেন্ট
          নির্ভরযোগ্য সূত্র থেকে যাচাই করা হবে।
        </p>
      </div>
    </section>
  );
}
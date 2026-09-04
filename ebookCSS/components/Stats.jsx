"use client";

import { BookOpen, FolderTree, Clock, Globe } from "lucide-react";
import Reveal from "@/lib/Reveal";

const stats = [
  {
    icon: BookOpen,
    value: "৫০০+",
    label: "ইসলামিক বই",
    desc: "সমৃদ্ধ লাইব্রেরি",
    tone: "from-forest-700 to-forest-900",
  },
  {
    icon: FolderTree,
    value: "১০+",
    label: "বিষয়ভিত্তিক ক্যাটাগরি",
    desc: "বিভিন্ন বিষয়ে",
    tone: "from-gold-300 to-gold-500",
  },
  {
    icon: Clock,
    value: "২৪/৭",
    label: "জ্ঞানচর্চার সুযোগ",
    desc: "যেকোনো সময়",
    tone: "from-forest-600 to-forest-800",
  },
  {
    icon: Globe,
    value: "যেকোনো জায়গায়",
    label: "অফলাইন রিডিং",
    desc: "নেটওয়ার্ক ছাড়াই",
    tone: "from-forest-900 to-forest-950",
  },
];

export default function Stats() {
  return (
    <section className="relative section-pad bg-ivory-100 islamic-pattern">
      <div className="mx-auto max-w-7xl px-5 md:px-8">
        <Reveal className="text-center max-w-2xl mx-auto mb-14">
          <span className="inline-block text-xs font-semibold tracking-[0.2em] uppercase text-forest-700 mb-4">
            আমাদের সম্পর্কে
          </span>
          <h2 className="text-3xl md:text-4xl lg:text-5xl font-bold text-forest-950 leading-tight">
            আপনার <span className="text-gradient-forest">ইসলামিক জ্ঞানচর্চার</span>
            <br />
            ডিজিটাল সঙ্গী
          </h2>
          <p className="mt-5 text-forest-900/70 text-base md:text-lg leading-relaxed">
            Islamic EBook আপনাকে সহজ, সুন্দর এবং আধুনিক উপায়ে ইসলামিক বই পড়ার
            সুযোগ দেয়। আপনার হাতের মুঠোয় একটি সম্পূর্ণ লাইব্রেরি।
          </p>
        </Reveal>

        <div className="grid grid-cols-2 lg:grid-cols-4 gap-4 md:gap-6">
          {stats.map((s, i) => {
            const Icon = s.icon;
            return (
              <Reveal key={s.label} delay={i * 80}>
                <div className="group relative bg-white rounded-2xl p-6 md:p-7 shadow-soft border border-forest-900/5 hover:shadow-cardHover hover:-translate-y-1 transition-all duration-500 overflow-hidden">
                  {/* Subtle gold corner */}
                  <div className="absolute -top-8 -right-8 w-24 h-24 rounded-full bg-gold-400/10 group-hover:scale-150 transition-transform duration-700"></div>

                  <div className={`w-12 h-12 md:w-14 md:h-14 rounded-xl bg-gradient-to-br ${s.tone} flex items-center justify-center shadow-md mb-5`}>
                    <Icon className="w-5 h-5 md:w-6 md:h-6 text-ivory-50" strokeWidth={1.8} />
                  </div>

                  <div className="text-2xl md:text-3xl font-bold text-forest-950 mb-1.5">
                    {s.value}
                  </div>
                  <div className="font-semibold text-forest-900 text-sm md:text-base leading-snug">
                    {s.label}
                  </div>
                  <div className="text-xs text-forest-700/70 mt-1">{s.desc}</div>
                </div>
              </Reveal>
            );
          })}
        </div>
      </div>
    </section>
  );
}
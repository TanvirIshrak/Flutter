"use client";

import { Check } from "lucide-react";
import Reveal from "@/lib/Reveal";
import { PhoneMockupReader } from "./PhoneMockup";
import { GeometricStar } from "./Patterns";

const features = [
  "পরিষ্কার Reading Interface",
  "Dark Mode সুবিধা",
  "Font Size Control",
  "Bookmark ও নোট",
  "Reading Progress সংরক্ষণ",
  "Offline Reading সুবিধা",
  "সহজ Navigation",
];

export default function ReadingExperience() {
  return (
    <section
      id="reading"
      className="relative section-pad bg-gradient-to-br from-ivory-100 via-ivory-50 to-forest-900/5 overflow-hidden"
    >
      <GeometricStar className="absolute -bottom-10 -right-10 opacity-20" size={260} color="#C9A961" />

      <div className="relative mx-auto max-w-7xl px-5 md:px-8">
        <div className="grid lg:grid-cols-2 gap-12 lg:gap-16 items-center">
          {/* Phone mockup */}
          <Reveal className="flex justify-center order-2 lg:order-1">
            <div className="relative">
              <div className="absolute inset-0 bg-emerald-gradient rounded-full blur-3xl opacity-20 scale-75"></div>
              <PhoneMockupReader />
            </div>
          </Reveal>

          {/* Right text */}
          <Reveal delay={150} className="order-1 lg:order-2">
            <span className="inline-block text-xs font-semibold tracking-[0.2em] uppercase text-forest-700 mb-4">
              পড়ার অভিজ্ঞতা
            </span>
            <h2 className="text-3xl md:text-4xl lg:text-5xl font-bold text-forest-950 leading-tight">
              পড়ুন <span className="text-gradient-forest">নিজের মতো করে</span>
            </h2>
            <p className="mt-5 text-forest-900/70 text-base md:text-lg leading-relaxed">
              আমাদের পাঠক-বান্ধব interface আপনাকে একটি শান্তিপূর্ণ ও distraction-free
              পড়ার পরিবেশ দেয়। আপনার পছন্দমতো font, theme ও layout কাস্টমাইজ করুন।
            </p>

            <ul className="mt-8 space-y-3.5">
              {features.map((feat, i) => (
                <li key={i} className="flex items-start gap-3 group">
                  <span className="mt-0.5 w-6 h-6 rounded-full bg-emerald-gradient flex items-center justify-center shrink-0 shadow-sm group-hover:scale-110 transition-transform">
                    <Check className="w-3.5 h-3.5 text-ivory-50" strokeWidth={3} />
                  </span>
                  <span className="text-forest-900 font-medium">{feat}</span>
                </li>
              ))}
            </ul>

            <div className="mt-9 inline-flex items-center gap-3 bg-white border border-forest-900/10 rounded-2xl px-5 py-3 shadow-soft">
              <div className="flex -space-x-2">
                {["#047857", "#C9A961", "#064E3B", "#047857"].map((c, i) => (
                  <div
                    key={i}
                    className="w-8 h-8 rounded-full border-2 border-white flex items-center justify-center text-ivory-50 text-[10px] font-bold"
                    style={{ backgroundColor: c }}
                  >
                    ★
                  </div>
                ))}
              </div>
              <div className="text-sm">
                <div className="font-bold text-forest-950">৯৫% পাঠক সন্তুষ্ট</div>
                <div className="text-xs text-forest-700">অভিজ্ঞতা মূল্যায়ন</div>
              </div>
            </div>
          </Reveal>
        </div>
      </div>
    </section>
  );
}
"use client";

import { Download, Compass, BookOpen } from "lucide-react";
import Reveal from "@/lib/Reveal";

const steps = [
  {
    n: "01",
    icon: Download,
    title: "অ্যাপ ডাউনলোড করুন",
    desc:
      "আপনার Android বা iOS ডিভাইসে Islamic EBook অ্যাপটি ইনস্টল করুন — মাত্র কয়েক সেকেন্ডে।",
    color: "bg-emerald-gradient",
  },
  {
    n: "02",
    icon: Compass,
    title: "বই নির্বাচন করুন",
    desc:
      "আপনার পছন্দের বিষয় বা ক্যাটাগরি থেকে পছন্দের ইসলামিক বই খুঁজে নিন।",
    color: "bg-gradient-to-br from-gold-300 to-gold-500",
  },
  {
    n: "03",
    icon: BookOpen,
    title: "পড়া শুরু করুন",
    desc:
      "যেকোনো সময়, যেকোনো জায়গা থেকে আপনার ইসলামিক বই পড়ুন — জ্ঞান অর্জন করুন।",
    color: "bg-gradient-to-br from-forest-700 to-forest-900",
  },
];

export default function HowItWorks() {
  return (
    <section
      id="how"
      className="relative section-pad bg-ivory-50 overflow-hidden"
    >
      <div className="absolute top-1/4 -left-20 w-80 h-80 rounded-full bg-forest-900/5 blur-3xl"></div>

      <div className="relative mx-auto max-w-7xl px-5 md:px-8">
        <Reveal className="text-center max-w-2xl mx-auto mb-16">
          <span className="inline-block text-xs font-semibold tracking-[0.2em] uppercase text-forest-700 mb-4">
            কীভাবে কাজ করে?
          </span>
          <h2 className="text-3xl md:text-4xl lg:text-5xl font-bold text-forest-950 leading-tight">
            মাত্র <span className="text-gradient-forest">৩টি সহজ ধাপে</span>
            <br />
            শুরু করুন আপনার জ্ঞানচর্চা
          </h2>
          <p className="mt-5 text-forest-900/70 text-base md:text-lg leading-relaxed">
            ইসলামিক জ্ঞান অর্জন এখন আরও সহজ। মাত্র কয়েক মিনিটে আপনার পড়া শুরু করুন।
          </p>
        </Reveal>

        <div className="relative grid md:grid-cols-3 gap-6 md:gap-8">
          {/* Connecting line on desktop */}
          <div className="hidden md:block absolute top-14 left-[16%] right-[16%] h-0.5 bg-gradient-to-r from-forest-700 via-gold-400 to-forest-900 opacity-20"></div>

          {steps.map((s, i) => {
            const Icon = s.icon;
            return (
              <Reveal key={s.n} delay={i * 120}>
                <div className="relative h-full bg-white rounded-3xl p-7 md:p-8 shadow-soft border border-forest-900/5 hover:shadow-cardHover hover:-translate-y-1 transition-all duration-500 text-center">
                  {/* Big number */}
                  <div className="absolute -top-6 left-1/2 -translate-x-1/2">
                    <div className={`w-14 h-14 rounded-full ${s.color} flex items-center justify-center text-ivory-50 shadow-card border-4 border-ivory-50`}>
                      <Icon className="w-6 h-6" strokeWidth={2} />
                    </div>
                  </div>

                  <div className="pt-10">
                    <div className="text-5xl md:text-6xl font-black text-forest-900/10 mb-2">
                      {s.n}
                    </div>
                    <h3 className="text-xl font-bold text-forest-950 mb-3">
                      {s.title}
                    </h3>
                    <p className="text-forest-900/70 text-sm leading-relaxed">
                      {s.desc}
                    </p>
                  </div>
                </div>
              </Reveal>
            );
          })}
        </div>
      </div>
    </section>
  );
}
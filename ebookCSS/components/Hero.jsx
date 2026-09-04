"use client";

import { Download, Play, ArrowRight, Sparkles } from "lucide-react";
import Reveal from "@/lib/Reveal";
import { PhoneMockupHero } from "./PhoneMockup";
import { GeometricStar, ArchPattern } from "./Patterns";

export default function Hero() {
  return (
    <section
      id="home"
      className="relative pt-28 md:pt-36 pb-16 md:pb-24 overflow-hidden bg-hero-gradient"
      style={{ backgroundSize: "200% 200%" }}
    >
      {/* Background ornaments */}
      <div className="absolute inset-0 islamic-pattern-soft opacity-50 pointer-events-none"></div>
      <div className="absolute top-20 -left-20 w-72 h-72 rounded-full bg-forest-900/5 blur-3xl"></div>
      <div className="absolute bottom-0 -right-32 w-96 h-96 rounded-full bg-gold-400/10 blur-3xl"></div>

      <GeometricStar className="absolute top-32 right-10 hidden lg:block opacity-50" size={140} color="#047857" />
      <ArchPattern className="absolute -bottom-10 left-1/2 -translate-x-1/2 w-[600px] opacity-20 hidden md:block" />

      <div className="relative mx-auto max-w-7xl px-5 md:px-8">
        <div className="grid lg:grid-cols-2 gap-12 lg:gap-8 items-center">
          {/* Left */}
          <div className="text-center lg:text-left">
            <Reveal>
              <span className="inline-flex items-center gap-2 bg-white border border-forest-900/10 rounded-full px-4 py-1.5 shadow-soft text-forest-800 text-xs font-semibold">
                <Sparkles className="w-3.5 h-3.5 text-gold-500" />
                আধুনিক ইসলামিক ডিজিটাল লাইব্রেরি
              </span>
            </Reveal>

            <Reveal delay={120}>
              <h1 className="mt-6 text-4xl sm:text-5xl lg:text-6xl xl:text-7xl font-bold leading-[1.1] tracking-tight text-forest-950">
                ইসলামিক জ্ঞানের
                <br />
                বিশাল ভাণ্ডার{" "}
                <span className="relative inline-block">
                  <span className="text-gradient-gold">এখন আপনার</span>
                  <svg
                    className="absolute -bottom-2 left-0 w-full"
                    viewBox="0 0 300 12"
                    fill="none"
                  >
                    <path
                      d="M2 8 Q150 2 298 8"
                      stroke="#C9A961"
                      strokeWidth="2"
                      stroke-linecap="round"
                      fill="none"
                    />
                  </svg>
                </span>
                <br />
                হাতের মুঠোয়
              </h1>
            </Reveal>

            <Reveal delay={220}>
              <p className="mt-6 text-base md:text-lg text-forest-900/70 max-w-xl mx-auto lg:mx-0 leading-relaxed">
                Quran, Hadith, Seerah, Dua, Islamic History এবং অসংখ্য ইসলামিক
                বই পড়ুন — সবকিছু এক জায়গায়, আপনার নিজের গতিতে। একটি শান্তিপূর্ণ
                ও আধুনিক পড়ার অভিজ্ঞতায়।
              </p>
            </Reveal>

            <Reveal delay={320}>
              <div className="mt-8 flex flex-col sm:flex-row items-center gap-3 justify-center lg:justify-start">
                <a href="#download" className="btn-primary group">
                  <Download className="w-4 h-4" />
                  অ্যাপ ডাউনলোড করুন
                  <ArrowRight className="w-4 h-4 transition-transform group-hover:translate-x-0.5" />
                </a>
                <a href="#books" className="btn-secondary group">
                  <Play className="w-4 h-4 fill-forest-900" />
                  বইগুলো দেখুন
                </a>
              </div>
            </Reveal>

            <Reveal delay={420}>
              <div className="mt-10 flex items-center gap-6 justify-center lg:justify-start text-sm">
                <div className="flex items-center -space-x-2">
                  {["#047857", "#065F46", "#C9A961", "#064E3B"].map((c, i) => (
                    <div
                      key={i}
                      className="w-9 h-9 rounded-full border-2 border-ivory-50 flex items-center justify-center text-ivory-50 text-xs font-bold"
                      style={{ backgroundColor: c }}
                    >
                      {["আ", "ব", "র", "ম"][i]}
                    </div>
                  ))}
                </div>
                <div className="text-forest-900/70">
                  <div className="flex items-center gap-1 text-gold-500">
                    {[1, 2, 3, 4, 5].map((s) => (
                      <span key={s}>★</span>
                    ))}
                    <span className="ml-1 text-forest-900 font-semibold">4.9</span>
                  </div>
                  <div className="text-xs">১০,০০০+ পাঠকের আস্থা</div>
                </div>
              </div>
            </Reveal>
          </div>

          {/* Right — Phone mockup */}
          <Reveal delay={300} className="relative flex justify-center lg:justify-end">
            <div className="absolute inset-0 bg-emerald-gradient rounded-full blur-3xl opacity-20 scale-75"></div>
            <PhoneMockupHero />
            {/* Floating elements */}
            <FloatingChip
              className="absolute top-8 -left-2 lg:-left-8"
              title="৫০০+"
              subtitle="ইসলামিক বই"
              tone="white"
            />
            <FloatingChip
              className="absolute bottom-20 -right-2 lg:-right-6"
              title="২৪/৭"
              subtitle="পড়ুন যেকোনো সময়"
              tone="green"
            />
          </Reveal>
        </div>
      </div>
    </section>
  );
}

function FloatingChip({ className = "", title, subtitle, tone = "white" }) {
  const bg = tone === "green" ? "bg-emerald-gradient text-ivory-50" : "bg-white text-forest-900";
  return (
    <div
      className={`${bg} ${className} rounded-2xl shadow-card px-4 py-3 backdrop-blur animate-float-slow border border-forest-900/5`}
    >
      <div className="font-bold text-lg">{title}</div>
      <div className="text-xs opacity-80">{subtitle}</div>
    </div>
  );
}
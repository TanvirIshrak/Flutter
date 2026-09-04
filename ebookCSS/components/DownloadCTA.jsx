"use client";

import { Download, Apple } from "lucide-react";
import Reveal from "@/lib/Reveal";
import { PhoneMockupHero } from "./PhoneMockup";
import { GeometricStar } from "./Patterns";

export default function DownloadCTA() {
  return (
    <section
      id="download"
      className="relative section-pad bg-ivory-100 overflow-hidden"
    >
      <div className="absolute inset-0 islamic-pattern opacity-40"></div>
      <GeometricStar className="absolute top-10 right-10 opacity-30 hidden lg:block" size={180} color="#C9A961" />

      <div className="relative mx-auto max-w-7xl px-5 md:px-8">
        <div className="relative bg-emerald-gradient rounded-[2rem] md:rounded-[3rem] overflow-hidden shadow-card p-8 md:p-14 lg:p-20">
          {/* Decorative pattern overlay */}
          <div className="absolute inset-0 opacity-20 islamic-pattern"></div>
          <div className="absolute -top-32 -right-32 w-96 h-96 rounded-full bg-gold-400/20 blur-3xl"></div>
          <div className="absolute -bottom-32 -left-32 w-96 h-96 rounded-full bg-forest-700/40 blur-3xl"></div>

          <div className="relative grid lg:grid-cols-2 gap-12 items-center">
            <div className="text-center lg:text-left">
              <Reveal>
                <span className="inline-flex items-center gap-2 bg-white/10 border border-white/20 rounded-full px-4 py-1.5 text-xs font-semibold text-gold-300 tracking-wide">
                  <span className="w-1.5 h-1.5 rounded-full bg-gold-400 animate-pulse"></span>
                  এখনই ডাউনলোড করুন
                </span>
              </Reveal>

              <Reveal delay={120}>
                <h2 className="mt-5 text-3xl md:text-4xl lg:text-5xl xl:text-6xl font-bold text-ivory-50 leading-tight">
                  আজ থেকেই শুরু হোক
                  <br />
                  আপনার{" "}
                  <span className="text-gradient-gold">ইসলামিক জ্ঞানচর্চা</span>
                </h2>
              </Reveal>

              <Reveal delay={220}>
                <p className="mt-5 text-ivory-50/80 text-base md:text-lg leading-relaxed max-w-lg mx-auto lg:mx-0">
                  হাজারো ইসলামিক বই ও জ্ঞান এখন আপনার হাতের মুঠোয়। আজই ডাউনলোড করুন
                  এবং শুরু করুন আপনার আধ্যাত্মিক যাত্রা।
                </p>
              </Reveal>

              <Reveal delay={320}>
                <div className="mt-8 flex flex-col sm:flex-row items-center gap-3 justify-center lg:justify-start">
                  <a
                    href="#"
                    className="inline-flex items-center gap-3 bg-ivory-50 text-forest-950 font-semibold px-6 py-3.5 rounded-2xl hover:bg-white hover:scale-[1.02] transition-all shadow-card"
                  >
                    <Download className="w-5 h-5" />
                    <div className="text-left leading-tight">
                      <div className="text-[10px] uppercase tracking-wider text-forest-900/60">
                        Google Play এ
                      </div>
                      <div className="text-base font-bold">Android ডাউনলোড</div>
                    </div>
                  </a>
                  <a
                    href="#"
                    className="inline-flex items-center gap-3 bg-forest-950/40 text-ivory-50 font-semibold px-6 py-3.5 rounded-2xl border border-ivory-50/20 hover:bg-forest-950/60 hover:scale-[1.02] transition-all"
                  >
                    <Apple className="w-5 h-5" />
                    <div className="text-left leading-tight">
                      <div className="text-[10px] uppercase tracking-wider text-ivory-50/60">
                        App Store এ
                      </div>
                      <div className="text-base font-bold">iOS ডাউনলোড</div>
                    </div>
                  </a>
                </div>
              </Reveal>

              <Reveal delay={420}>
                <div className="mt-8 flex items-center gap-6 justify-center lg:justify-start text-ivory-50/70 text-xs">
                  <span className="flex items-center gap-1.5">
                    <span className="w-1.5 h-1.5 rounded-full bg-gold-400"></span>
                    ফ্রি ডাউনলোড
                  </span>
                  <span className="flex items-center gap-1.5">
                    <span className="w-1.5 h-1.5 rounded-full bg-gold-400"></span>
                    ১০০% নিরাপদ
                  </span>
                  <span className="flex items-center gap-1.5">
                    <span className="w-1.5 h-1.5 rounded-full bg-gold-400"></span>
                    ৫ লক্ষ+ ডাউনলোড
                  </span>
                </div>
              </Reveal>
            </div>

            {/* Phone */}
            <Reveal delay={300} className="hidden lg:flex justify-center">
              <div className="relative">
                <PhoneMockupHero />
              </div>
            </Reveal>
          </div>
        </div>
      </div>
    </section>
  );
}
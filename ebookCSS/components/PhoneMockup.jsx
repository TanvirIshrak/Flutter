"use client";

import {
  Search,
  Bell,
  Star,
  ChevronRight,
  Play,
  BookOpen,
  Bookmark,
  Headphones,
  MoreVertical,
  Share2,
  Settings,
  Heart,
  Clock,
  Filter,
  SkipBack,
  SkipForward,
  Pause,
  Type,
  ListMusic,
  Globe,
  X as XIcon,
  Volume2,
} from "lucide-react";

/* iOS-style status bar */
function StatusBar({ tone = "light" }) {
  const color = tone === "dark" ? "text-ivory-50" : "text-forest-900";
  return (
    <div className={`h-8 flex items-center justify-between px-6 pt-2.5 text-[10px] font-semibold ${color}`}>
      <span className="tracking-wide">9:41</span>
      <div className="flex items-center gap-1">
        <span className="flex gap-0.5 items-end">
          <span className="w-0.5 h-1 bg-current rounded-sm"></span>
          <span className="w-0.5 h-1.5 bg-current rounded-sm"></span>
          <span className="w-0.5 h-2 bg-current rounded-sm"></span>
          <span className="w-0.5 h-2.5 bg-current rounded-sm"></span>
        </span>
        <svg viewBox="0 0 16 12" className="w-3 h-2.5 fill-current"><path d="M8 11.5C7.2 11.5 6.5 11 6.1 10.2L8 1.2L9.9 10.2C9.5 11 8.8 11.5 8 11.5ZM4 8C3.6 7.4 3.3 6.7 3.3 6L8 0.5L12.7 6C12.7 6.7 12.4 7.4 12 8H4Z"/></svg>
        <span className="w-5 h-2.5 border border-current rounded-sm relative">
          <span className="absolute inset-0.5 bg-current rounded-[1px]"></span>
          <span className="absolute -right-1 top-1/2 -translate-y-1/2 w-0.5 h-1 bg-current rounded-r"></span>
        </span>
      </div>
    </div>
  );
}

/* Inline book cover thumbnail */
function BookCoverMini({ variant = "emerald", title = "", small = false }) {
  const styles = {
    emerald: "bg-gradient-to-br from-forest-700 to-forest-900",
    gold: "bg-gradient-to-br from-gold-300 to-gold-500",
    midnight: "bg-gradient-to-br from-forest-900 to-black",
    ivory: "bg-gradient-to-br from-ivory-50 to-ivory-200",
  };
  const textColors = {
    emerald: "text-gold-300",
    gold: "text-forest-900",
    midnight: "text-gold-300",
    ivory: "text-forest-900",
  };
  return (
    <div
      className={`${small ? "w-9 h-12" : "w-14 h-[72px]"} ${styles[variant]} rounded-md shadow-md flex flex-col items-center justify-center p-1 relative overflow-hidden shrink-0`}
    >
      <span className="absolute inset-0.5 border border-ivory-50/20 rounded-[3px]"></span>
      <span className={`text-[6px] font-bold leading-tight text-center ${textColors[variant]} line-clamp-2 px-0.5 relative z-10`}>
        {title}
      </span>
      <span className={`absolute top-1 left-1/2 -translate-x-1/2 w-1 h-1 rounded-full ${textColors[variant]} opacity-60`}></span>
    </div>
  );
}

/* Realistic Islamic EBook app phone mockup */
export function PhoneMockupHero() {
  return (
    <div className="phone-frame animate-float">
      <div className="phone-screen w-[280px] h-[580px] sm:w-[300px] sm:h-[620px]">
        <div className="h-full flex flex-col bg-gradient-to-b from-ivory-50 to-ivory-100 relative">
          <StatusBar />

          {/* Header */}
          <div className="px-5 pt-2 pb-3">
            <div className="flex items-center justify-between mb-4">
              <div>
                <p className="text-[10px] text-forest-700 font-medium">আসসালামু আলাইকুম 👋</p>
                <h3 className="text-[15px] font-bold text-forest-900 leading-tight">আব্দুল্লাহ</h3>
              </div>
              <div className="flex items-center gap-2">
                <button className="relative w-9 h-9 rounded-full bg-white border border-forest-900/5 flex items-center justify-center shadow-soft">
                  <Bell className="w-3.5 h-3.5 text-forest-800" />
                  <span className="absolute top-1.5 right-1.5 w-1.5 h-1.5 bg-red-500 rounded-full"></span>
                </button>
                <div className="w-9 h-9 rounded-full bg-emerald-gradient flex items-center justify-center text-ivory-50 text-[11px] font-bold shadow-soft ring-2 ring-white">
                  আ
                </div>
              </div>
            </div>

            {/* Search */}
            <div className="flex items-center gap-2 bg-white rounded-2xl px-3.5 py-2.5 border border-forest-900/10 shadow-soft">
              <Search className="w-4 h-4 text-forest-700" />
              <span className="text-[12px] text-forest-700/50 flex-1">বই, লেখক বা বিষয় খুঁজুন...</span>
              <button className="w-6 h-6 rounded-md bg-forest-900/5 flex items-center justify-center">
                <Filter className="w-3 h-3 text-forest-700" />
              </button>
            </div>
          </div>

          {/* Featured */}
          <div className="px-5 mb-3">
            <div className="flex items-center justify-between mb-2">
              <h4 className="text-[12px] font-bold text-forest-900 flex items-center gap-1.5">
                <span className="w-1 h-3.5 bg-gold-400 rounded-full"></span>
                আজকের নির্বাচিত
              </h4>
              <span className="text-[10px] text-forest-700 font-semibold">সব দেখুন →</span>
            </div>
            <div className="relative rounded-2xl overflow-hidden bg-emerald-gradient p-3.5 shadow-card">
              <div className="absolute -right-6 -bottom-6 w-28 h-28 rounded-full bg-white/10"></div>
              <div className="absolute -right-2 top-8 w-16 h-16 rounded-full bg-gold-400/20 blur-xl"></div>
              <div className="absolute right-3 top-3 text-[8px] text-gold-300 font-bold tracking-[0.2em] bg-forest-950/40 px-1.5 py-0.5 rounded">
                FEATURED
              </div>
              <div className="flex items-start gap-3 relative z-10">
                <BookCoverMini variant="emerald" title="তাফসীর ইবনে কাসীর" />
                <div className="flex-1 min-w-0 pt-0.5">
                  <p className="text-[9px] text-gold-300 mb-0.5 font-semibold uppercase tracking-wider">
                    কুরআন ও তাফসীর
                  </p>
                  <h5 className="text-[12px] font-bold text-ivory-50 leading-tight mb-1.5">
                    তাফসীর ইবনে কাসীর
                  </h5>
                  <p className="text-[9px] text-ivory-50/60 mb-1.5">ইমাম ইবনে কাসীর</p>
                  <div className="flex items-center gap-1 mb-2">
                    {[1, 2, 3, 4, 5].map((s) => (
                      <Star key={s} className="w-2.5 h-2.5 fill-gold-300 text-gold-300" />
                    ))}
                    <span className="text-[9px] text-ivory-50/80 ml-1 font-semibold">4.9 (২.৪k)</span>
                  </div>
                  <div className="flex items-center gap-1.5">
                    <button className="text-[10px] bg-ivory-50 text-forest-900 px-2.5 py-1 rounded-md font-bold flex items-center gap-1">
                      <Play className="w-2.5 h-2.5 fill-forest-900" /> পড়ুন
                    </button>
                    <button className="text-[10px] bg-white/15 text-ivory-50 px-2 py-1 rounded-md font-semibold flex items-center gap-1 border border-white/20">
                      <Headphones className="w-2.5 h-2.5" /> শুনুন
                    </button>
                  </div>
                </div>
              </div>
            </div>
          </div>

          {/* Continue reading */}
          <div className="px-5 mb-3">
            <div className="flex items-center justify-between mb-2">
              <h4 className="text-[12px] font-bold text-forest-900 flex items-center gap-1.5">
                <span className="w-1 h-3.5 bg-gold-400 rounded-full"></span>
                পড়া চালিয়ে যান
              </h4>
              <ChevronRight className="w-3.5 h-3.5 text-forest-700" />
            </div>
            <div className="bg-white rounded-xl p-2.5 shadow-soft flex items-center gap-2.5 border border-forest-900/5">
              <BookCoverMini variant="gold" title="হিসনুল" small />
              <div className="flex-1 min-w-0">
                <p className="text-[11px] font-semibold text-forest-900 truncate">হিসনুল মুসলিম</p>
                <p className="text-[9px] text-forest-700/70 mb-1.5">সাইয়িদ সাবিক • অধ্যায় ৭</p>
                <div className="flex items-center gap-2">
                  <div className="flex-1 h-1 bg-forest-900/10 rounded-full overflow-hidden">
                    <div className="h-full w-[64%] bg-emerald-gradient rounded-full"></div>
                  </div>
                  <span className="text-[9px] font-bold text-forest-700">৬৪%</span>
                </div>
              </div>
            </div>
          </div>

          {/* Categories grid */}
          <div className="px-5 flex-1">
            <div className="flex items-center justify-between mb-2">
              <h4 className="text-[12px] font-bold text-forest-900 flex items-center gap-1.5">
                <span className="w-1 h-3.5 bg-gold-400 rounded-full"></span>
                ক্যাটাগরি
              </h4>
              <span className="text-[10px] text-forest-700 font-semibold">আরও</span>
            </div>
            <div className="grid grid-cols-4 gap-2">
              {[
                { name: "কুরআন", icon: "📖", tone: "from-forest-700 to-forest-900" },
                { name: "হাদীস", icon: "📜", tone: "from-gold-300 to-gold-500" },
                { name: "সীরাত", icon: "🕌", tone: "from-forest-600 to-forest-800" },
                { name: "দোয়া", icon: "🤲", tone: "from-amber-400 to-amber-600" },
              ].map((c) => (
                <div key={c.name} className="bg-white rounded-xl p-2 border border-forest-900/5 text-center shadow-soft">
                  <div className={`w-8 h-8 mx-auto rounded-lg bg-gradient-to-br ${c.tone} flex items-center justify-center text-[14px] mb-1.5 shadow-sm`}>
                    {c.icon}
                  </div>
                  <span className="text-[10px] font-semibold text-forest-900">{c.name}</span>
                </div>
              ))}
            </div>
          </div>

          {/* Bottom nav */}
          <div className="mx-3 mb-3 mt-2 bg-white rounded-2xl shadow-card border border-forest-900/5 flex items-center justify-around py-2.5 relative">
            <span className="absolute -top-1 left-1/2 -translate-x-1/2 w-8 h-1 bg-forest-900/10 rounded-full"></span>
            {[
              { label: "হোম", Icon: null, active: true },
              { Icon: BookOpen, label: "বই", active: false },
              { Icon: Search, label: "খুঁজুন", active: false },
              { Icon: Bookmark, label: "সংরক্ষিত", active: false },
              { label: "প্রো", Icon: null, active: false },
            ].map((it, i) => (
              <div key={i} className="flex flex-col items-center gap-0.5 px-2">
                <div className={`w-7 h-7 rounded-lg flex items-center justify-center ${
                  it.active ? "bg-emerald-gradient text-ivory-50 shadow-sm" : "text-forest-700/60"
                }`}>
                  {it.Icon ? (
                    <it.Icon className="w-4 h-4" strokeWidth={2} />
                  ) : (
                    <span className="text-[11px] font-bold">{it.label[0]}</span>
                  )}
                </div>
                <span className={`text-[8.5px] ${it.active ? "text-forest-900 font-bold" : "text-forest-700/60 font-medium"}`}>
                  {it.label}
                </span>
              </div>
            ))}
          </div>
        </div>
      </div>
    </div>
  );
}

/* Reading experience phone mockup */
export function PhoneMockupReader() {
  return (
    <div className="phone-frame animate-float-slow">
      <div className="phone-screen w-[280px] h-[580px] sm:w-[300px] sm:h-[620px] relative overflow-hidden">
        <div className="h-full flex flex-col bg-ivory-100">
          <StatusBar />

          {/* Reader header */}
          <div className="px-5 pb-3 flex items-center justify-between border-b border-forest-900/10 bg-ivory-50">
            <div className="flex items-center gap-2.5">
              <button className="w-7 h-7 rounded-lg bg-white border border-forest-900/10 flex items-center justify-center shadow-sm">
                <span className="text-[13px] font-bold text-forest-900">‹</span>
              </button>
              <div className="flex items-center gap-2">
                <BookCoverMini variant="midnight" title="সীরাত" small />
                <div>
                  <p className="text-[9px] text-forest-700 font-medium">অধ্যায় ৩ / ১২</p>
                  <h4 className="text-[12px] font-bold text-forest-900 leading-tight">সালাতের ফযীলত</h4>
                </div>
              </div>
            </div>
            <div className="flex items-center gap-1.5">
              <button className="w-7 h-7 rounded-lg bg-white border border-forest-900/10 flex items-center justify-center shadow-sm">
                <Type className="w-3.5 h-3.5 text-forest-900" />
              </button>
              <button className="w-7 h-7 rounded-lg bg-white border border-forest-900/10 flex items-center justify-center shadow-sm">
                <MoreVertical className="w-3.5 h-3.5 text-forest-900" />
              </button>
            </div>
          </div>

          {/* Reading content */}
          <div className="flex-1 px-5 py-4 overflow-hidden bg-gradient-to-b from-ivory-50 to-ivory-100">
            <p className="text-[8px] text-gold-500 font-bold tracking-[0.25em] mb-3 uppercase">
              — পড়া চলছে —
            </p>
            <p className="text-[12.5px] leading-[1.7] text-forest-900 mb-3">
              সালাত ইসলামের দ্বিতীয় রুকন এবং প্রতিদিন পাঁচবার আদায়কৃত একটি অত্যন্ত
              গুরুত্বপূর্ণ ইবাদত।
            </p>
            <p className="text-[11.5px] leading-[1.7] text-forest-900/85 mb-3">
              রাসূলুল্লাহ ﷺ বলেছেন, সালাত ইসলামের স্তম্ভসমূহের মধ্যে সর্বপ্রথম। যে
              ব্যক্তি সালাতকে সংরক্ষণ করে, সে দীনকে সংরক্ষণ করে।
            </p>

            <div className="bg-gold-50 border-r-2 border-l-0 border-gold-400 p-3 rounded-l-md mb-3 text-right">
              <div className="flex items-center justify-between mb-1">
                <span className="text-[8px] text-gold-700 font-bold uppercase tracking-wider">✦ Arabic</span>
                <span className="text-[8px] text-gold-700/70">সহীহ বুখারী</span>
              </div>
              <p className="text-[14px] text-forest-950 leading-loose" dir="rtl">
                بُنِيَ الإِسْلاَمُ عَلَى خَمْسٍ شَهَادَةِ أَنْ لاَ إِلَهَ إِلاَّ اللَّهُ
              </p>
            </div>

            <p className="text-[11.5px] leading-[1.7] text-forest-900/85 mb-3">
              ইসলামের ভিত্তি পাঁচটি বিষয়ের উপর — সাক্ষ্য দেওয়া যে আল্লাহ ছাড়া কোনো
              ইলাহ নেই এবং মুহাম্মদ ﷺ আল্লাহর রাসূল...
            </p>

            <div className="bg-forest-900 text-ivory-50 px-3 py-2.5 rounded-lg mb-3">
              <p className="text-[10.5px] leading-relaxed italic">
                &ldquo;যে ব্যক্তি সালাতকে সংরক্ষণ করে, সে দীনকে সংরক্ষণ করে।&rdquo;
              </p>
            </div>
          </div>

          {/* Bottom player controls */}
          <div className="border-t border-forest-900/10 px-4 py-3 bg-white">
            <div className="mb-2.5">
              <div className="relative h-1 bg-forest-900/10 rounded-full overflow-hidden">
                <div className="h-full w-[42%] bg-emerald-gradient rounded-full"></div>
                <span className="absolute top-1/2 left-[42%] -translate-y-1/2 -translate-x-1/2 w-3 h-3 bg-white border-2 border-forest-700 rounded-full shadow-sm"></span>
              </div>
              <div className="flex items-center justify-between mt-1 text-[9px] text-forest-700/70 font-medium">
                <span>০৪:১২</span>
                <span>পৃষ্ঠা ২৪ / ৫৮</span>
                <span>১০:০৩</span>
              </div>
            </div>

            <div className="flex items-center justify-between">
              <button className="w-8 h-8 flex items-center justify-center text-forest-900/70">
                <Bookmark className="w-4 h-4" />
              </button>
              <button className="w-8 h-8 flex items-center justify-center text-forest-900/70">
                <SkipBack className="w-4 h-4 fill-forest-900" />
              </button>
              <button className="w-11 h-11 rounded-full bg-emerald-gradient flex items-center justify-center text-ivory-50 shadow-card">
                <Pause className="w-4 h-4 fill-ivory-50" />
              </button>
              <button className="w-8 h-8 flex items-center justify-center text-forest-900/70">
                <SkipForward className="w-4 h-4 fill-forest-900" />
              </button>
              <button className="w-8 h-8 flex items-center justify-center text-forest-900/70">
                <Settings className="w-4 h-4" />
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}

/* Book detail screen */
export function PhoneMockupBookDetail() {
  return (
    <div className="phone-frame animate-float">
      <div className="phone-screen w-[260px] h-[540px] sm:w-[280px] sm:h-[580px] relative overflow-hidden">
        <div className="h-full flex flex-col bg-ivory-50">
          <StatusBar />

          <div className="relative h-44 bg-gradient-to-br from-forest-800 via-forest-900 to-forest-950 overflow-hidden">
            <div className="absolute inset-0 islamic-pattern opacity-30"></div>
            <div className="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 w-28 h-40 rounded-lg shadow-2xl">
              <div className="w-full h-full bg-gradient-to-br from-gold-300 via-gold-400 to-gold-600 rounded-lg relative" style={{ transform: "rotateY(-18deg) rotateX(5deg)", transformStyle: "preserve-3d" }}>
                <div className="absolute left-0 top-0 bottom-0 w-2 bg-gradient-to-b from-gold-600 to-gold-700 rounded-l-lg"></div>
                <div className="absolute inset-0 flex flex-col items-center justify-center text-forest-900 p-3">
                  <p className="text-[7px] tracking-widest uppercase opacity-70 mb-1">কুরআন ও তাফসীর</p>
                  <p className="text-[9px] font-bold text-center leading-tight">তাফসীর ইবনে কাসীর</p>
                </div>
              </div>
            </div>
            <div className="absolute top-3 left-3 right-3 flex items-center justify-between">
              <button className="w-8 h-8 rounded-full bg-white/20 backdrop-blur flex items-center justify-center">
                <span className="text-ivory-50 text-sm">‹</span>
              </button>
              <div className="flex gap-2">
                <button className="w-8 h-8 rounded-full bg-white/20 backdrop-blur flex items-center justify-center">
                  <Heart className="w-3.5 h-3.5 text-ivory-50" />
                </button>
                <button className="w-8 h-8 rounded-full bg-white/20 backdrop-blur flex items-center justify-center">
                  <Share2 className="w-3.5 h-3.5 text-ivory-50" />
                </button>
              </div>
            </div>
          </div>

          <div className="flex-1 px-4 pt-4 overflow-hidden">
            <div className="flex items-center gap-1.5 mb-2">
              <span className="text-[9px] px-2 py-0.5 rounded-full bg-gold-100 text-gold-700 font-bold">কুরআন ও তাফসীর</span>
              <span className="text-[9px] px-2 py-0.5 rounded-full bg-forest-900/5 text-forest-700 font-semibold flex items-center gap-1">
                <Globe className="w-2.5 h-2.5" /> বাংলা
              </span>
            </div>
            <h2 className="text-[18px] font-bold text-forest-950 leading-tight mb-1">তাফসীর ইবনে কাসীর</h2>
            <p className="text-[11px] text-forest-700 mb-2.5">ইমাম ইবনে কাসীর</p>
            <div className="flex items-center gap-3 mb-3">
              <div className="flex items-center gap-1">
                {[1, 2, 3, 4, 5].map((s) => (
                  <Star key={s} className="w-3 h-3 fill-gold-400 text-gold-400" />
                ))}
                <span className="text-[10px] font-bold ml-1">4.9</span>
              </div>
              <span className="text-[10px] text-forest-700/70">২,৪৫৩ রিভিউ</span>
              <span className="text-[10px] text-forest-700/70">৪,৮২০ পাঠক</span>
            </div>

            <div className="flex items-center gap-3 mb-4">
              <button className="flex-1 bg-emerald-gradient text-ivory-50 text-[11px] font-bold py-2.5 rounded-xl flex items-center justify-center gap-1.5 shadow-card">
                <Play className="w-3 h-3 fill-ivory-50" /> পড়া শুরু করুন
              </button>
              <button className="w-10 h-10 rounded-xl border-2 border-forest-900/15 flex items-center justify-center">
                <Headphones className="w-4 h-4 text-forest-900" />
              </button>
            </div>

            <div className="grid grid-cols-3 gap-2 mb-3">
              {[
                { Icon: Settings, label: "পৃষ্ঠা", val: "১,৮৪০" },
                { Icon: Clock, label: "সময়", val: "১২ ঘন্টা" },
                { Icon: ListMusic, label: "অধ্যায়", val: "১১৪" },
              ].map((it) => (
                <div key={it.label} className="bg-white rounded-xl p-2 border border-forest-900/5 text-center">
                  <it.Icon className="w-3.5 h-3.5 mx-auto text-forest-700 mb-1" />
                  <p className="text-[9px] text-forest-700/70">{it.label}</p>
                  <p className="text-[10px] font-bold text-forest-900">{it.val}</p>
                </div>
              ))}
            </div>

            <p className="text-[10px] text-forest-900/70 leading-relaxed line-clamp-3">
              কুরআনুল কারীমের একটি বিখ্যাত ও প্রামাণিক তাফসীর গ্রন্থ। ইমাম ইবনু
              কাসীর (৭০১ হি.) রচিত এই গ্রন্থে আসবাবে নুযূল, সাহাবীদের বর্ণনা ও
              পূর্ববর্তী মুফাসসিরগণের বক্তব্য সংকলিত হয়েছে...
            </p>
          </div>

          <div className="border-t border-forest-900/10 p-3 bg-white">
            <div className="flex items-center justify-between bg-ivory-100 rounded-xl px-3 py-2">
              <div>
                <p className="text-[9px] text-forest-700/70">মূল্য</p>
                <p className="text-[14px] font-bold text-forest-950">৳ ৩৫০</p>
              </div>
              <button className="bg-emerald-gradient text-ivory-50 text-[11px] font-bold px-4 py-2 rounded-lg">
                কিনুন
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}

/* Audio player screen */
export function PhoneMockupAudio() {
  return (
    <div className="phone-frame animate-float-slow">
      <div className="phone-screen w-[260px] h-[420px] sm:w-[280px] sm:h-[460px] relative overflow-hidden">
        <div className="h-full flex flex-col bg-gradient-to-b from-forest-900 via-forest-950 to-black text-ivory-50">
          <StatusBar tone="dark" />
          <button className="absolute top-12 left-4 w-8 h-8 rounded-full bg-white/10 backdrop-blur flex items-center justify-center z-10">
            <XIcon className="w-3.5 h-3.5" />
          </button>
          <button className="absolute top-12 right-4 w-8 h-8 rounded-full bg-white/10 backdrop-blur flex items-center justify-center z-10">
            <MoreVertical className="w-3.5 h-3.5" />
          </button>

          <div className="px-8 pt-16">
            <div className="relative aspect-square rounded-2xl overflow-hidden shadow-2xl bg-gradient-to-br from-gold-300 via-gold-400 to-gold-600">
              <div className="absolute inset-0 islamic-pattern opacity-30"></div>
              <div className="absolute inset-0 flex flex-col items-center justify-center text-forest-900 p-4">
                <p className="text-[8px] tracking-[0.3em] uppercase opacity-70 mb-2">অডিও বই</p>
                <p className="text-[11px] font-bold text-center leading-tight">হিসনুল<br />মুসলিম</p>
              </div>
            </div>
          </div>

          <div className="px-6 pt-5 text-center">
            <p className="text-[10px] text-gold-300 uppercase tracking-wider font-semibold mb-1">এখন বাজছে</p>
            <h3 className="text-[15px] font-bold leading-tight">হিসনুল মুসলিম</h3>
            <p className="text-[11px] text-ivory-50/60 mt-0.5">সাইয়িদ সাবিক</p>
          </div>

          <div className="px-6 pt-4">
            <div className="relative h-1 bg-ivory-50/15 rounded-full overflow-hidden">
              <div className="h-full w-[38%] bg-gold-400 rounded-full"></div>
            </div>
            <div className="flex justify-between mt-1 text-[9px] text-ivory-50/55">
              <span>১৪:৩২</span>
              <span>৩৭:১৮</span>
            </div>
          </div>

          <div className="px-6 pt-3 flex items-center justify-around">
            <button className="w-9 h-9 flex items-center justify-center text-ivory-50/70">
              <Volume2 className="w-4 h-4" />
            </button>
            <button className="w-9 h-9 flex items-center justify-center text-ivory-50">
              <SkipBack className="w-5 h-5 fill-ivory-50" />
            </button>
            <button className="w-14 h-14 rounded-full bg-gold-gradient flex items-center justify-center text-forest-900 shadow-glow-gold">
              <Pause className="w-5 h-5 fill-forest-900" />
            </button>
            <button className="w-9 h-9 flex items-center justify-center text-ivory-50">
              <SkipForward className="w-5 h-5 fill-ivory-50" />
            </button>
            <button className="w-9 h-9 flex items-center justify-center text-ivory-50/70">
              <ListMusic className="w-4 h-4" />
            </button>
          </div>

          <div className="mt-auto px-6 py-4 pb-6 flex items-center justify-center gap-2 text-[10px] text-ivory-50/45">
            <Headphones className="w-3 h-3" /> কুরআনের আলো • অধ্যায় ৭
          </div>
        </div>
      </div>
    </div>
  );
}

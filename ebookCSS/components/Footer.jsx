"use client";

import { Facebook, Instagram, Youtube, Mail, ArrowUp } from "lucide-react";
import Logo from "./Logo";

const linkGroups = [
  {
    title: "প্ল্যাটফর্ম",
    links: [
      { label: "হোম", href: "#home" },
      { label: "বইসমূহ", href: "#books" },
      { label: "ক্যাটাগরি", href: "#categories" },
      { label: "বৈশিষ্ট্য", href: "#features" },
    ],
  },
  {
    title: "কোম্পানি",
    links: [
      { label: "আমাদের সম্পর্কে", href: "#about" },
      { label: "যোগাযোগ", href: "#" },
      { label: "প্রাইভেসি পলিসি", href: "#" },
      { label: "টার্মস অফ সার্ভিস", href: "#" },
    ],
  },
  {
    title: "সম্পদ",
    links: [
      { label: "দৈনিক জ্ঞান", href: "#daily" },
      { label: "কীভাবে কাজ করে", href: "#how" },
      { label: "FAQ", href: "#" },
      { label: "সাপোর্ট", href: "#" },
    ],
  },
];

const socials = [
  { icon: Facebook, label: "Facebook" },
  { icon: Instagram, label: "Instagram" },
  { icon: Youtube, label: "YouTube" },
];

export default function Footer() {
  const year = new Date().getFullYear();
  return (
    <footer id="about" className="relative bg-forest-950 text-ivory-50 overflow-hidden">
      {/* Subtle pattern */}
      <div className="absolute inset-0 islamic-pattern opacity-10 pointer-events-none"></div>
      <div className="absolute top-0 left-1/2 -translate-x-1/2 w-[800px] h-px bg-gradient-to-r from-transparent via-gold-400/30 to-transparent"></div>

      <div className="relative mx-auto max-w-7xl px-5 md:px-8 pt-16 md:pt-20 pb-8">
        <div className="grid lg:grid-cols-12 gap-12 lg:gap-8 pb-12 border-b border-ivory-50/10">
          {/* Brand */}
          <div className="lg:col-span-5">
            <Logo variant="light" />
            <p className="mt-5 text-ivory-50/70 text-sm leading-relaxed max-w-md">
              জ্ঞান অর্জন করুন, ইমানকে সমৃদ্ধ করুন। আধুনিক ও শান্তিপূর্ণ উপায়ে
              ইসলামিক জ্ঞান অর্জনের জন্য আপনার বিশ্বস্ত ডিজিটাল সঙ্গী।
            </p>

            <div className="mt-6 flex items-center gap-3">
              {socials.map((s) => {
                const Icon = s.icon;
                return (
                  <a
                    key={s.label}
                    href="#"
                    aria-label={s.label}
                    className="w-10 h-10 rounded-full bg-ivory-50/5 hover:bg-gold-400/20 border border-ivory-50/10 hover:border-gold-400/40 flex items-center justify-center transition-all duration-300 group"
                  >
                    <Icon className="w-4 h-4 text-ivory-50/70 group-hover:text-gold-300" />
                  </a>
                );
              })}
            </div>

            <div className="mt-7 inline-flex items-center gap-2.5 bg-ivory-50/5 border border-ivory-50/10 rounded-full px-4 py-2.5">
              <Mail className="w-4 h-4 text-gold-400" />
              <span className="text-sm text-ivory-50/80">support@islamic-ebook.app</span>
            </div>
          </div>

          {/* Links */}
          <div className="lg:col-span-7 grid grid-cols-2 sm:grid-cols-3 gap-8">
            {linkGroups.map((group) => (
              <div key={group.title}>
                <h4 className="font-bold text-ivory-50 mb-5 text-sm tracking-wide uppercase">
                  {group.title}
                </h4>
                <ul className="space-y-3">
                  {group.links.map((l) => (
                    <li key={l.label}>
                      <a
                        href={l.href}
                        className="text-sm text-ivory-50/65 hover:text-gold-300 transition-colors"
                      >
                        {l.label}
                      </a>
                    </li>
                  ))}
                </ul>
              </div>
            ))}
          </div>
        </div>

        {/* Bottom */}
        <div className="flex flex-col md:flex-row items-center justify-between gap-4 pt-8 text-sm text-ivory-50/55">
          <p>© {year} Islamic EBook. সর্বস্বত্ব সংরক্ষিত।</p>
          <div className="flex items-center gap-5">
            <a href="#" className="hover:text-gold-300 transition-colors">প্রাইভেসি</a>
            <a href="#" className="hover:text-gold-300 transition-colors">শর্তাবলী</a>
            <button
              onClick={() => window.scrollTo({ top: 0, behavior: "smooth" })}
              className="inline-flex items-center gap-1.5 text-ivory-50/70 hover:text-gold-300 transition-colors"
            >
              <ArrowUp className="w-3.5 h-3.5" /> উপরে যান
            </button>
          </div>
        </div>
      </div>
    </footer>
  );
}
"use client";

import { useEffect, useState } from "react";
import Link from "next/link";
import { Menu, X, Download } from "lucide-react";
import Logo from "./Logo";

const navItems = [
  { label: "হোম", href: "#home" },
  { label: "বইসমূহ", href: "#books" },
  { label: "ক্যাটাগরি", href: "#categories" },
  { label: "প্রকাশ করুন", href: "#publish" },
  { label: "আমাদের সম্পর্কে", href: "#about" },
];

export default function Navbar() {
  const [scrolled, setScrolled] = useState(false);
  const [open, setOpen] = useState(false);

  useEffect(() => {
    const onScroll = () => setScrolled(window.scrollY > 16);
    onScroll();
    window.addEventListener("scroll", onScroll, { passive: true });
    return () => window.removeEventListener("scroll", onScroll);
  }, []);

  useEffect(() => {
    document.body.style.overflow = open ? "hidden" : "";
  }, [open]);

  return (
    <>
      <header
        className={`fixed top-0 inset-x-0 z-50 transition-all duration-500 ${
          scrolled ? "py-3" : "py-5"
        }`}
      >
        <div className="mx-auto max-w-7xl px-5 md:px-8">
          <nav
            className={`flex items-center justify-between rounded-2xl px-4 md:px-6 py-3 transition-all duration-500 ${
              scrolled
                ? "bg-white/85 backdrop-blur-xl shadow-soft border border-forest-900/5"
                : "bg-transparent"
            }`}
          >
            <Logo />

            <ul className="hidden lg:flex items-center gap-1">
              {navItems.map((item) => (
                <li key={item.href}>
                  <Link
                    href={item.href}
                    className="px-4 py-2 text-[15px] font-medium text-forest-900/80 hover:text-forest-900 rounded-lg hover:bg-forest-900/5 transition-colors"
                  >
                    {item.label}
                  </Link>
                </li>
              ))}
            </ul>

            <div className="hidden lg:flex items-center gap-3">
              <Link
                href="#download"
                className="btn-primary text-sm"
              >
                <Download className="w-4 h-4" />
                অ্যাপ ডাউনলোড করুন
              </Link>
            </div>

            <button
              onClick={() => setOpen(true)}
              className="lg:hidden p-2 rounded-lg text-forest-900 hover:bg-forest-900/5"
              aria-label="Open menu"
            >
              <Menu className="w-6 h-6" />
            </button>
          </nav>
        </div>
      </header>

      {/* Mobile drawer */}
      <div
        className={`fixed inset-0 z-[60] transition-opacity duration-300 ${
          open ? "opacity-100 pointer-events-auto" : "opacity-0 pointer-events-none"
        }`}
      >
        <div
          className="absolute inset-0 bg-forest-950/60 backdrop-blur-sm"
          onClick={() => setOpen(false)}
        />
        <div
          className={`absolute right-0 top-0 bottom-0 w-[88%] max-w-sm bg-ivory-50 shadow-2xl transition-transform duration-500 ${
            open ? "translate-x-0" : "translate-x-full"
          }`}
        >
          <div className="flex items-center justify-between p-5 border-b border-forest-900/10">
            <Logo size="sm" />
            <button
              onClick={() => setOpen(false)}
              className="p-2 rounded-lg hover:bg-forest-900/5"
              aria-label="Close menu"
            >
              <X className="w-6 h-6 text-forest-900" />
            </button>
          </div>
          <ul className="p-5 space-y-1">
            {navItems.map((item) => (
              <li key={item.href}>
                <Link
                  href={item.href}
                  onClick={() => setOpen(false)}
                  className="block px-4 py-3.5 text-base font-medium text-forest-900 rounded-xl hover:bg-forest-900/5 transition-colors"
                >
                  {item.label}
                </Link>
              </li>
            ))}
          </ul>
          <div className="p-5 pt-2">
            <Link
              href="#download"
              onClick={() => setOpen(false)}
              className="btn-primary w-full justify-center"
            >
              <Download className="w-4 h-4" />
              অ্যাপ ডাউনলোড করুন
            </Link>
          </div>
        </div>
      </div>
    </>
  );
}

"use client";

import Link from "next/link";

export default function Logo({ variant = "dark", size = "md" }) {
  const textColor = variant === "dark" ? "text-forest-900" : "text-ivory-50";
  const subColor = variant === "dark" ? "text-forest-700" : "text-gold-300";

  const dim = size === "sm" ? "h-9 w-9" : size === "lg" ? "h-12 w-12" : "h-10 w-10";
  const titleSize = size === "sm" ? "text-base" : size === "lg" ? "text-xl" : "text-lg";
  const subSize = size === "sm" ? "text-[10px]" : "text-[11px]";

  return (
    <Link href="/" className="flex items-center gap-2.5 group">
      <div className={`${dim} relative shrink-0`}>
        <svg viewBox="0 0 40 40" className="w-full h-full" xmlns="http://www.w3.org/2000/svg">
          <defs>
            <linearGradient id="logoGrad" x1="0%" y1="0%" x2="100%" y2="100%">
              <stop offset="0%" stopColor="#047857" />
              <stop offset="100%" stopColor="#064E3B" />
            </linearGradient>
          </defs>
          <rect x="2" y="2" width="36" height="36" rx="10" fill="url(#logoGrad)" />
          {/* Open book */}
          <path
            d="M10 14 Q14 12 20 14 Q26 12 30 14 L30 26 Q26 24 20 26 Q14 24 10 26 Z"
            fill="#FCFBF7"
            opacity="0.95"
          />
          <path d="M20 14 L20 26" stroke="#047857" strokeWidth="1" />
          {/* Crescent */}
          <path
            d="M32 9 Q35 12 32 15 Q34 12 32 9 Z"
            fill="#C9A961"
          />
          {/* Star */}
          <circle cx="34.5" cy="7.5" r="1.3" fill="#C9A961" />
        </svg>
      </div>
      <div className="flex flex-col leading-tight">
        <span className={`${titleSize} font-bold ${textColor} tracking-tight`}>
          Islamic <span className="text-gradient-forest" style={variant === "light" ? { WebkitTextFillColor: "#FCFBF7" } : {}}>EBook</span>
        </span>
        <span className={`${subSize} ${subColor} font-medium tracking-wider uppercase`}>
          ইসলামিক ই-বুক
        </span>
      </div>
    </Link>
  );
}

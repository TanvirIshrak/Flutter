"use client";

import { BookOpen } from "lucide-react";

/* Generic original Islamic-inspired book covers — no copyrighted artwork */
const COVERS = {
  emerald: {
    bg: "bg-gradient-to-br from-forest-700 via-forest-800 to-forest-900",
    accent: "text-gold-300",
    ornamentColor: "rgba(201,169,97,0.35)",
  },
  gold: {
    bg: "bg-gradient-to-br from-gold-300 via-gold-400 to-gold-500",
    accent: "text-forest-900",
    ornamentColor: "rgba(6,78,59,0.25)",
  },
  ivory: {
    bg: "bg-gradient-to-br from-ivory-50 via-ivory-100 to-ivory-200",
    accent: "text-forest-900",
    ornamentColor: "rgba(6,78,59,0.18)",
  },
  midnight: {
    bg: "bg-gradient-to-br from-forest-900 via-forest-950 to-black",
    accent: "text-gold-300",
    ornamentColor: "rgba(201,169,97,0.4)",
  },
};

export default function BookCover({
  title,
  subtitle,
  author,
  variant = "emerald",
  size = "md",
  className = "",
}) {
  const c = COVERS[variant] || COVERS.emerald;
  const heights = {
    sm: "h-32",
    md: "h-44",
    lg: "h-56",
    xl: "h-64",
  };

  return (
    <div
      className={`relative w-full ${heights[size]} rounded-lg overflow-hidden ${c.bg} ${className} shadow-md group-hover:shadow-cardHover transition-shadow duration-500`}
    >
      {/* Ornamental frame */}
      <svg
        className="absolute inset-3 w-[calc(100%-1.5rem)] h-[calc(100%-1.5rem)]"
        viewBox="0 0 100 140"
        preserveAspectRatio="none"
        aria-hidden="true"
      >
        <rect
          x="0.5"
          y="0.5"
          width="99"
          height="139"
          fill="none"
          stroke={c.ornamentColor}
          strokeWidth="0.6"
        />
        <rect
          x="3"
          y="3"
          width="94"
          height="134"
          fill="none"
          stroke={c.ornamentColor}
          strokeWidth="0.4"
        />
        {/* Top ornament */}
        <path
          d="M30 8 Q50 4 70 8 M50 8 L50 14"
          stroke={c.ornamentColor}
          strokeWidth="0.6"
          fill="none"
        />
        {/* Bottom ornament */}
        <path
          d="M30 132 Q50 136 70 132 M50 132 L50 126"
          stroke={c.ornamentColor}
          strokeWidth="0.6"
          fill="none"
        />
        {/* Corner motifs */}
        <circle cx="6" cy="6" r="2" fill={c.ornamentColor} />
        <circle cx="94" cy="6" r="2" fill={c.ornamentColor} />
        <circle cx="6" cy="134" r="2" fill={c.ornamentColor} />
        <circle cx="94" cy="134" r="2" fill={c.ornamentColor} />
      </svg>

      {/* Center decorative */}
      <div className="absolute inset-0 flex items-center justify-center opacity-30">
        <Star8 color={c.ornamentColor} />
      </div>

      {/* Content */}
      <div className="relative h-full flex flex-col items-center justify-between py-4 px-3 text-center">
        <div className={`text-[10px] tracking-[0.3em] font-semibold ${c.accent} opacity-80 uppercase`}>
          {subtitle || "ইসলামিক গ্রন্থ"}
        </div>

        <div className="flex-1 flex flex-col items-center justify-center px-2">
          {variant !== "gold" && variant !== "ivory" && (
            <BookOpen className={`w-5 h-5 ${c.accent} mb-2 opacity-80`} strokeWidth={1.5} />
          )}
          <h4
            className={`${c.accent} font-bold text-sm leading-tight`}
            style={{ fontFamily: "var(--font-hind-siliguri)" }}
          >
            {title}
          </h4>
        </div>

        <div className={`text-[10px] ${c.accent} opacity-80 font-medium`}>
          {author}
        </div>
      </div>

      {/* Spine highlight */}
      <div className="absolute left-0 top-0 bottom-0 w-1 bg-black/15"></div>
      <div className="absolute left-1 top-0 bottom-0 w-px bg-white/15"></div>
    </div>
  );
}

function Star8({ color }) {
  return (
    <svg width="60" height="60" viewBox="0 0 60 60" fill="none">
      <g stroke={color} strokeWidth="0.8" fill="none">
        <path d="M30 5 L35 25 L55 30 L35 35 L30 55 L25 35 L5 30 L25 25 Z" />
        <path d="M30 15 L33 27 L45 30 L33 33 L30 45 L27 33 L15 30 L27 27 Z" />
      </g>
    </svg>
  );
}

"use client";

/* Decorative Islamic geometric SVG accents */
export function GeometricStar({ className = "", size = 120, color = "#047857" }) {
  return (
    <svg
      className={className}
      width={size}
      height={size}
      viewBox="0 0 100 100"
      fill="none"
      xmlns="http://www.w3.org/2000/svg"
      aria-hidden="true"
    >
      <g stroke={color} strokeWidth="0.7" fill="none" opacity="0.5">
        <circle cx="50" cy="50" r="40" />
        <circle cx="50" cy="50" r="30" />
        <circle cx="50" cy="50" r="20" />
        <path d="M50 10 L60 40 L90 50 L60 60 L50 90 L40 60 L10 50 L40 40 Z" />
        <path d="M50 20 L60 40 L80 50 L60 60 L50 80 L40 60 L20 50 L40 40 Z" />
        <circle cx="50" cy="50" r="6" fill={color} fillOpacity="0.15" />
      </g>
    </svg>
  );
}

export function ArchPattern({ className = "" }) {
  return (
    <svg
      className={className}
      viewBox="0 0 200 200"
      fill="none"
      xmlns="http://www.w3.org/2000/svg"
      aria-hidden="true"
    >
      <g stroke="#047857" strokeWidth="0.8" fill="none" opacity="0.35">
        <path d="M20 180 L20 100 Q20 20 100 20 Q180 20 180 100 L180 180" />
        <path d="M40 180 L40 110 Q40 40 100 40 Q160 40 160 110 L160 180" />
        <path d="M60 180 L60 120 Q60 60 100 60 Q140 60 140 120 L140 180" />
        <path d="M80 180 L80 130 Q80 80 100 80 Q120 80 120 130 L120 180" />
        <circle cx="100" cy="110" r="4" fill="#047857" fillOpacity="0.6" />
      </g>
    </svg>
  );
}

export function CrescentStar({ className = "", size = 24 }) {
  return (
    <svg
      className={className}
      width={size}
      height={size}
      viewBox="0 0 24 24"
      fill="none"
      xmlns="http://www.w3.org/2000/svg"
      aria-hidden="true"
    >
      <path
        d="M12 2L13.5 8.5L20 10L13.5 11.5L12 18L10.5 11.5L4 10L10.5 8.5L12 2Z"
        fill="currentColor"
      />
    </svg>
  );
}

export function CornerOrnament({ className = "" }) {
  return (
    <svg
      className={className}
      width="80"
      height="80"
      viewBox="0 0 80 80"
      fill="none"
      xmlns="http://www.w3.org/2000/svg"
      aria-hidden="true"
    >
      <g stroke="#C9A961" strokeWidth="1" fill="none" opacity="0.7">
        <path d="M2 2 L40 2 M2 2 L2 40" />
        <path d="M2 2 Q20 2 20 20 Q20 2 38 2" />
        <circle cx="20" cy="20" r="3" fill="#C9A961" />
        <path d="M30 2 L30 10 M2 30 L10 30" />
      </g>
    </svg>
  );
}

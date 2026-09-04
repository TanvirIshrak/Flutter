/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./app/**/*.{js,jsx,ts,tsx}",
    "./components/**/*.{js,jsx,ts,tsx}",
  ],
  theme: {
    extend: {
      colors: {
        forest: {
          50: "#F0FDF4",
          100: "#DCFCE7",
          200: "#BBF7D0",
          300: "#86EFAC",
          400: "#4ADE80",
          500: "#22C55E",
          600: "#16A34A",
          700: "#047857",
          800: "#065F46",
          900: "#064E3B",
          950: "#022C22",
        },
        gold: {
          50: "#FBF7EE",
          100: "#F5ECD3",
          200: "#EBD7A5",
          300: "#DEBC73",
          400: "#C9A961",
          500: "#B08D3F",
          600: "#8E6E2F",
          700: "#6B5122",
          800: "#4A3818",
        },
        ivory: {
          50: "#FCFBF7",
          100: "#F8F7F2",
          200: "#F1EFE6",
          300: "#E8E5D6",
        },
      },
      fontFamily: {
        sans: ["var(--font-inter)", "system-ui", "sans-serif"],
        bengali: ["var(--font-hind-siliguri)", "var(--font-inter)", "system-ui", "sans-serif"],
        serif: ["Georgia", "serif"],
      },
      boxShadow: {
        "soft": "0 4px 20px -2px rgba(6, 78, 59, 0.08)",
        "card": "0 8px 30px -6px rgba(6, 78, 59, 0.1)",
        "cardHover": "0 20px 50px -10px rgba(6, 78, 59, 0.18)",
        "phone": "0 30px 60px -15px rgba(6, 78, 59, 0.35), 0 0 0 12px #1a1a1a, 0 0 0 14px #2a2a2a",
      },
      animation: {
        "float": "float 6s ease-in-out infinite",
        "float-slow": "float 9s ease-in-out infinite",
        "fade-up": "fadeUp 0.7s ease-out forwards",
        "fade-in": "fadeIn 0.8s ease-out forwards",
        "gradient-shift": "gradientShift 12s ease infinite",
        "pulse-soft": "pulseSoft 4s ease-in-out infinite",
      },
      keyframes: {
        float: {
          "0%, 100%": { transform: "translateY(0px)" },
          "50%": { transform: "translateY(-14px)" },
        },
        fadeUp: {
          "0%": { opacity: "0", transform: "translateY(24px)" },
          "100%": { opacity: "1", transform: "translateY(0)" },
        },
        fadeIn: {
          "0%": { opacity: "0" },
          "100%": { opacity: "1" },
        },
        gradientShift: {
          "0%, 100%": { backgroundPosition: "0% 50%" },
          "50%": { backgroundPosition: "100% 50%" },
        },
        pulseSoft: {
          "0%, 100%": { opacity: "0.5" },
          "50%": { opacity: "0.9" },
        },
      },
      backgroundImage: {
        "hero-gradient": "linear-gradient(135deg, #FCFBF7 0%, #F1EFE6 50%, #F8F7F2 100%)",
        "emerald-gradient": "linear-gradient(135deg, #064E3B 0%, #047857 100%)",
        "gold-gradient": "linear-gradient(135deg, #DEBC73 0%, #C9A961 50%, #B08D3F 100%)",
      },
    },
  },
  plugins: [],
};

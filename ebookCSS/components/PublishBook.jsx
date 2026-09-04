"use client";

import { useState } from "react";
import {
  Layers,
  Globe,
  FileText,
  DollarSign,
  Headphones,
  Upload,
  Music,
  CheckCircle2,
  X,
} from "lucide-react";
import Reveal from "@/lib/Reveal";
import { GeometricStar } from "./Patterns";

const categories = [
  "কুরআন ও তাফসীর",
  "হাদীস",
  "সীরাত",
  "দোয়া ও যিকির",
  "ফিকহ",
  "ইসলামের ইতিহাস",
  "আত্মশুদ্ধি",
  "রমজান",
  "পরিবার ও জীবন",
  "ইসলামিক জ্ঞান",
];

const languages = ["বাংলা", "ইংরেজি", "আরবি", "উর্দু", "তুর্কি"];

function Field({ label, icon: Icon, children }) {
  return (
    <div>
      <label className="block text-sm font-semibold text-forest-900 mb-2">
        {label}
      </label>
      <div className="relative">
        {Icon && (
          <Icon className="absolute left-4 top-1/2 -translate-y-1/2 w-4 h-4 text-forest-700/60 pointer-events-none z-10" />
        )}
        {children}
      </div>
    </div>
  );
}

function inputClass(extra = "") {
  return `w-full bg-white border border-forest-900/10 rounded-xl py-3 pr-4 text-sm text-forest-950 placeholder:text-forest-700/40 focus:outline-none focus:border-forest-700 focus:ring-2 focus:ring-forest-700/20 transition-all ${extra}`;
}

export default function PublishBook() {
  const [form, setForm] = useState({
    title: "",
    author: "",
    description: "",
    category: "",
    language: "",
    pages: "",
    price: "",
    audioLength: "",
  });
  const [pdfFile, setPdfFile] = useState(null);
  const [audioFile, setAudioFile] = useState(null);
  const [success, setSuccess] = useState(false);

  const update = (k) => (e) => setForm({ ...form, [k]: e.target.value });

  const onSubmit = (e) => {
    e.preventDefault();
    setSuccess(true);
    setTimeout(() => setSuccess(false), 4000);
  };

  return (
    <section
      id="publish"
      className="relative section-pad bg-ivory-50 overflow-hidden"
    >
      <div className="absolute inset-0 islamic-pattern-soft opacity-50 pointer-events-none"></div>
      <div className="absolute top-1/3 -right-32 w-96 h-96 rounded-full bg-forest-900/5 blur-3xl"></div>
      <GeometricStar
        className="absolute bottom-10 left-10 opacity-20 hidden lg:block"
        size={160}
        color="#C9A961"
      />

      <div className="relative mx-auto max-w-7xl px-5 md:px-8">
        <div className="grid lg:grid-cols-12 gap-10 lg:gap-14 items-start">
          {/* Left intro */}
          <Reveal className="lg:col-span-5">
            <span className="inline-block text-xs font-semibold tracking-[0.2em] uppercase text-forest-700 mb-4">
              প্রকাশ করুন
            </span>
            <h2 className="text-3xl md:text-4xl lg:text-5xl font-bold text-forest-950 leading-tight">
              আপনার{" "}
              <span className="text-gradient-forest">ইসলামিক বই</span>
              <br />
              প্রকাশ করুন
            </h2>
            <p className="mt-5 text-forest-900/70 text-base md:text-lg leading-relaxed">
              আপনার লেখা, জ্ঞান বা অনুবাদ Islamic EBook প্ল্যাটফর্মে প্রকাশ করুন এবং
              লক্ষ লক্ষ পাঠকের কাছে পৌঁছে যান। সহজ ও আধুনিক প্রকাশনা প্রক্রিয়া।
            </p>

            <ul className="mt-7 space-y-4">
              {[
                "সহজ ও দ্রুত প্রকাশনা",
                "PDF ও অডিও আপলোড সুবিধা",
                "বিস্তৃত পাঠক নেটওয়ার্ক",
                "স্বচ্ছ রয়্যালটি ব্যবস্থা",
              ].map((it) => (
                <li key={it} className="flex items-start gap-3">
                  <span className="mt-0.5 w-5 h-5 rounded-full bg-emerald-gradient flex items-center justify-center shrink-0 shadow-sm">
                    <CheckCircle2 className="w-3 h-3 text-ivory-50" strokeWidth={3} />
                  </span>
                  <span className="text-forest-900 font-medium">{it}</span>
                </li>
              ))}
            </ul>

            <div className="mt-8 bg-gradient-to-br from-gold-50 to-ivory-100 border border-gold-400/30 rounded-2xl p-5">
              <div className="text-xs font-semibold text-gold-700 uppercase tracking-wider mb-1">
                প্রকাশকদের জন্য
              </div>
              <p className="text-sm text-forest-900/80 leading-relaxed">
                আপনার বই প্রকাশের পর আমাদের সম্পাদকীয় দল একটি সংক্ষিপ্ত পর্যালোচনা
                করবে এবং ৪৮ ঘণ্টার মধ্যে প্রকাশ করা হবে।
              </p>
            </div>
          </Reveal>

          {/* Form card */}
          <Reveal delay={150} className="lg:col-span-7">
            <form
              onSubmit={onSubmit}
              className="bg-white rounded-3xl shadow-card border border-forest-900/5 p-6 md:p-8 lg:p-10"
            >
              {/* Header */}
              <div className="mb-7 pb-6 border-b border-forest-900/10">
                <h3 className="text-xl font-bold text-forest-950">
                  নতুন বই প্রকাশ করুন
                </h3>
                <p className="text-sm text-forest-900/65 mt-1">
                  বইয়ের তথ্য পূরণ করুন এবং আপনার ফাইল আপলোড করুন
                </p>
              </div>

              {/* Basic */}
              <div className="grid sm:grid-cols-2 gap-4">
                <Field label="বইয়ের শিরোনাম">
                  <input
                    type="text"
                    placeholder="যেমন: রিয়াদুস সালিহীন"
                    value={form.title}
                    onChange={update("title")}
                    className={inputClass("pl-4")}
                  />
                </Field>
                <Field label="লেখকের নাম">
                  <input
                    type="text"
                    placeholder="যেমন: ইমাম নববী"
                    value={form.author}
                    onChange={update("author")}
                    className={inputClass("pl-4")}
                  />
                </Field>
              </div>

              <div className="mt-4">
                <label className="block text-sm font-semibold text-forest-900 mb-2">
                  সংক্ষিপ্ত বিবরণ
                </label>
                <textarea
                  rows={3}
                  placeholder="আপনার বই সম্পর্কে সংক্ষেপে লিখুন..."
                  value={form.description}
                  onChange={update("description")}
                  className="w-full bg-white border border-forest-900/10 rounded-xl py-3 px-4 text-sm text-forest-950 placeholder:text-forest-700/40 focus:outline-none focus:border-forest-700 focus:ring-2 focus:ring-forest-700/20 transition-all resize-none"
                />
              </div>

              {/* Classification */}
              <div className="mt-8">
                <div className="flex items-center gap-2 mb-4">
                  <span className="text-xs font-bold uppercase tracking-[0.2em] text-blue-600">
                    ক্যাটাগরাইজেশন
                  </span>
                  <span className="flex-1 h-px bg-blue-600/20" />
                </div>

                <div className="grid sm:grid-cols-2 gap-4">
                  <Field label="ক্যাটাগরি" icon={Layers}>
                    <select
                      value={form.category}
                      onChange={update("category")}
                      className={`${inputClass("pl-11 appearance-none cursor-pointer")} ${!form.category && "text-forest-700/40"}`}
                    >
                      <option value="">ক্যাটাগরি নির্বাচন করুন</option>
                      {categories.map((c) => (
                        <option key={c} value={c}>
                          {c}
                        </option>
                      ))}
                    </select>
                  </Field>
                  <Field label="ভাষা" icon={Globe}>
                    <select
                      value={form.language}
                      onChange={update("language")}
                      className={`${inputClass("pl-11 appearance-none cursor-pointer")} ${!form.language && "text-forest-700/40"}`}
                    >
                      <option value="">ভাষা নির্বাচন করুন</option>
                      {languages.map((l) => (
                        <option key={l} value={l}>
                          {l}
                        </option>
                      ))}
                    </select>
                  </Field>
                  <Field label="পৃষ্ঠা সংখ্যা" icon={FileText}>
                    <input
                      type="number"
                      min="1"
                      placeholder="যেমন: ৪২০"
                      value={form.pages}
                      onChange={update("pages")}
                      className={inputClass("pl-11")}
                    />
                  </Field>
                  <Field label="মূল্য (৳)" icon={DollarSign}>
                    <input
                      type="number"
                      min="0"
                      placeholder="যেমন: ৩৫০"
                      value={form.price}
                      onChange={update("price")}
                      className={inputClass("pl-11")}
                    />
                  </Field>
                </div>
              </div>

              {/* Media */}
              <div className="mt-8">
                <div className="flex items-center gap-2 mb-4">
                  <span className="text-xs font-bold uppercase tracking-[0.2em] text-blue-600">
                    মিডিয়া ফাইল
                  </span>
                  <span className="flex-1 h-px bg-blue-600/20" />
                </div>

                <Field label="অডিও দৈর্ঘ্য (যেমন: ১ ঘণ্টা ৩০ মিনিট)" icon={Headphones}>
                  <input
                    type="text"
                    placeholder="১ ঘণ্টা ৩০ মিনিট"
                    value={form.audioLength}
                    onChange={update("audioLength")}
                    className={inputClass("pl-11")}
                  />
                </Field>

                {/* Book PDF */}
                <div className="mt-4">
                  <label className="block text-sm font-semibold text-forest-900 mb-2">
                    বই PDF
                  </label>
                  <div className="border-2 border-dashed border-blue-500/40 rounded-xl p-5 bg-blue-50/40">
                    <div className="flex items-center gap-3 mb-3">
                      <div className="w-9 h-9 rounded-lg bg-blue-100 flex items-center justify-center">
                        <FileText className="w-4 h-4 text-blue-600" />
                      </div>
                      <div className="flex-1 min-w-0">
                        <p className="text-sm font-semibold text-forest-950 truncate">
                          {pdfFile ? pdfFile.name : "কোনো ফাইল নির্বাচিত হয়নি"}
                        </p>
                        <p className="text-xs text-forest-700/60">PDF ফরম্যাট</p>
                      </div>
                      {pdfFile && (
                        <button
                          type="button"
                          onClick={() => setPdfFile(null)}
                          className="text-forest-700/60 hover:text-red-500 transition-colors"
                          aria-label="Remove file"
                        >
                          <X className="w-4 h-4" />
                        </button>
                      )}
                    </div>
                    <label className="cursor-pointer inline-flex items-center gap-2 bg-blue-600 hover:bg-blue-700 text-white text-sm font-semibold px-5 py-2.5 rounded-xl transition-colors">
                      <Upload className="w-4 h-4" />
                      PDF বেছে নিন
                      <input
                        type="file"
                        accept="application/pdf"
                        className="hidden"
                        onChange={(e) => setPdfFile(e.target.files?.[0] || null)}
                      />
                    </label>
                  </div>
                </div>

                {/* Choose Audio button row (matches reference) */}
                <div className="mt-4">
                  <label className="block text-sm font-semibold text-forest-900 mb-2">
                    অডিও ফাইল (ঐচ্ছিক)
                  </label>
                  <div className="flex flex-col sm:flex-row gap-3">
                    <label className="flex-1 cursor-pointer inline-flex items-center justify-center gap-2 bg-white border border-blue-500/40 hover:border-blue-500 text-blue-600 text-sm font-semibold py-2.5 rounded-xl transition-colors">
                      <Upload className="w-4 h-4" />
                      Choose PDF
                      <input
                        type="file"
                        accept="application/pdf"
                        className="hidden"
                        onChange={(e) => setPdfFile(e.target.files?.[0] || null)}
                      />
                    </label>
                    <label className="flex-1 cursor-pointer inline-flex items-center justify-center gap-2 bg-white border border-blue-500/40 hover:border-blue-500 text-blue-600 text-sm font-semibold py-2.5 rounded-xl transition-colors">
                      <Music className="w-4 h-4" />
                      Choose Audio
                      <input
                        type="file"
                        accept="audio/*"
                        className="hidden"
                        onChange={(e) => setAudioFile(e.target.files?.[0] || null)}
                      />
                    </label>
                  </div>
                  {audioFile && (
                    <div className="mt-2 flex items-center gap-2 text-xs text-forest-700">
                      <Music className="w-3.5 h-3.5" />
                      <span className="truncate">{audioFile.name}</span>
                      <button
                        type="button"
                        onClick={() => setAudioFile(null)}
                        className="ml-auto text-forest-700/60 hover:text-red-500"
                      >
                        <X className="w-3.5 h-3.5" />
                      </button>
                    </div>
                  )}
                </div>
              </div>

              {/* Actions */}
              <div className="mt-8 flex flex-col gap-3">
                <button
                  type="submit"
                  className="w-full bg-emerald-gradient hover:shadow-cardHover text-ivory-50 font-semibold py-3.5 rounded-xl shadow-card transition-all hover:-translate-y-0.5"
                >
                  বই প্রকাশ করুন
                </button>
                <button
                  type="button"
                  onClick={() => {
                    setForm({
                      title: "",
                      author: "",
                      description: "",
                      category: "",
                      language: "",
                      pages: "",
                      price: "",
                      audioLength: "",
                    });
                    setPdfFile(null);
                    setAudioFile(null);
                  }}
                  className="w-full bg-white border-2 border-red-400 hover:bg-red-50 text-red-500 font-semibold py-3.5 rounded-xl transition-colors"
                >
                  বাতিল করুন
                </button>
              </div>

              {success && (
                <div className="mt-4 flex items-center gap-2 bg-forest-900/5 border border-forest-900/10 rounded-xl px-4 py-3 text-sm text-forest-900 animate-fade-in">
                  <CheckCircle2 className="w-4 h-4 text-forest-700" />
                  আপনার বই সফলভাবে জমা দেওয়া হয়েছে। ধন্যবাদ!
                </div>
              )}
            </form>
          </Reveal>
        </div>
      </div>
    </section>
  );
}
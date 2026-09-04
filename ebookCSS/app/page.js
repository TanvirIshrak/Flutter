import Navbar from "@/components/Navbar";
import Hero from "@/components/Hero";
import Stats from "@/components/Stats";
import Features from "@/components/Features";
import Categories from "@/components/Categories";
import HowItWorks from "@/components/HowItWorks";
import ReadingExperience from "@/components/ReadingExperience";
import FeaturedBooks from "@/components/FeaturedBooks";
import DailyKnowledge from "@/components/DailyKnowledge";
import PublishBook from "@/components/PublishBook";
import DownloadCTA from "@/components/DownloadCTA";
import Footer from "@/components/Footer";

export default function Page() {
  return (
    <>
      <Navbar />
      <main>
        <Hero />
        <Stats />
        <Features />
        <Categories />
        <HowItWorks />
        <ReadingExperience />
        <FeaturedBooks />
        <DailyKnowledge />
        <PublishBook />
        <DownloadCTA />
      </main>
      <Footer />
    </>
  );
}
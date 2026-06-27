# 📚 Student Grade Tracker

A Flutter app that lets students track their subject marks, view grades, and see a live result summary.

## Features

- **Add Subject** — Enter a subject name and mark (0–100) with full form validation
- **Subject List** — Browse all subjects with name, mark, and letter grade. Swipe left to delete
- **Summary** — Live-updating overview: total subjects, average mark, overall grade, and grade breakdown bar chart
- **Light & Dark Theme** — Toggle via the AppBar icon. Custom `ThemeData` for each — no hardcoded colors

## Tech Highlights

| Requirement | How it's met |
|---|---|
| `Subject` class | Private `_mark` field, public `grade` getter (A/B/C/F) |
| `List<Subject>` + `.where()` | `passingSubjects` getter filters with `.where()` |
| Form validation | Name not empty; mark must be 0–100 integer |
| `ListView.builder` | Subject list screen |
| `Dismissible` | Swipe-to-delete on each subject card |
| Custom themes | `_buildLightTheme()` / `_buildDarkTheme()` with full `ColorScheme` |
| All colors from theme | `Theme.of(context).colorScheme.*` — zero hardcoded hex colors in widgets |
| State management | `Provider` + `ChangeNotifier` — **zero `setState` in any screen** |

> Note: `setState` is only used in `HomeShell` to switch the bottom navigation tab — this is pure UI/routing state, not business/domain state, which is the standard Flutter pattern. All subject data and theme state live in Providers.

## Getting Started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) ≥ 3.0.0
- Dart ≥ 3.0.0

### Run the app

```bash
git clone https://github.com/YOUR_USERNAME/grade_tracker.git
cd grade_tracker
flutter pub get
flutter run
```

### Run on a specific device

```bash
flutter devices          # list connected devices
flutter run -d chrome    # web
flutter run -d emulator  # Android emulator
```

## Project Structure

```
lib/
├── main.dart                    # App entry, themes, HomeShell with BottomNavigation
├── models/
│   └── subject.dart             # Subject class with private _mark and grade getter
├── providers/
│   └── subject_provider.dart    # SubjectProvider + ThemeProvider (ChangeNotifier)
└── screens/
    ├── add_subject_screen.dart  # Screen 1 — form to add a subject
    ├── subject_list_screen.dart # Screen 2 — ListView with Dismissible delete
    └── summary_screen.dart      # Screen 3 — live stats and grade breakdown
```

## Grade Scale

| Grade | Mark Range |
|-------|-----------|
| A | 80 – 100 |
| B | 65 – 79 |
| C | 50 – 64 |
| F | 0 – 49 |

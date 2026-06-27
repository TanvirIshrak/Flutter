# Grade Tracking (Flutter)

A simple Flutter app for students to manage subjects and marks, view calculated grades, and see a live overall result summary.

## Features
- **Add Subject** form with validation (name required, mark 0–100)
- **Subject List** with swipe-to-delete (Dismissible)
- **Summary** screen showing total subjects, average mark, and overall grade
- **Light/Dark theme toggle** in the AppBar
- **Provider** for all app state (no `setState` used)

## App Behavior
- Each subject has a grade based on its mark:
  - **A+**: ≥ 80
  - **A**: ≥ 75
  - **A-**: ≥ 70
  - **B**: ≥ 65
  - **B-**: ≥ 60
  - **C**: ≥ 55
  - **C-**: ≥ 50
  - **D**: ≥ 45
  - **D-**: ≥ 40
  - **F**: < 40
- Summary updates immediately when subjects are added/removed.

## Project Structure (main parts)
- `lib/models/subject.dart`
- `lib/state/subject_provider.dart`
- `lib/screens/add_subject_screen.dart`
- `lib/screens/subject_list_screen.dart`
- `lib/screens/summary_screen.dart`

## How to Run
1. Ensure Flutter is installed.
2. From the project root:
   ```bash
   flutter pub get
   flutter run
   ```

## Notes
- Theme colors are derived from `Theme.of(context)` / `ColorScheme`.
- The subject store is managed via `ChangeNotifier` + `Provider`.


#!/usr/bin/env bash
# Run this after cloning / in the project root to set up the git repo

set -e

cd "$(dirname "$0")"

echo "Initializing git repository..."
git init
git add pubspec.yaml .gitignore README.md

# Commit 1 — project scaffold
git commit -m "feat: initialize Flutter project with Provider dependency

- Add pubspec.yaml with flutter + provider ^6.1.2
- Add .gitignore for Flutter/Dart/IDE artifacts
- Add README with feature table and run instructions"

git add lib/models/subject.dart lib/providers/subject_provider.dart

# Commit 2 — core logic
git commit -m "feat: add Subject model and SubjectProvider with grade logic

- Subject class: private _mark field, public grade getter (A/B/C/F)
- SubjectProvider: add/remove subjects, .where() for passingSubjects,
  averageMark, overallGrade computed live
- ThemeProvider: toggles light/dark ThemeMode"

git add lib/main.dart lib/screens/

# Commit 3 — UI
git commit -m "feat: build 3 screens, BottomNavigationBar, and theme toggle

- main.dart: custom light + dark ThemeData (no hardcoded colors),
  MaterialApp with themeMode from Provider, HomeShell with
  NavigationBar switching between 3 screens
- AddSubjectScreen: validated form (name not empty, mark 0-100)
- SubjectListScreen: ListView.builder with Dismissible swipe-delete
- SummaryScreen: live totals, average, overall grade, grade breakdown

No setState in any screen — all state via Provider."

echo ""
echo "✅ Git repo initialized with 3 commits."
echo ""
echo "To push to GitHub:"
echo "  gh repo create grade_tracker --public --source=. --push"
echo "  # OR"
echo "  git remote add origin https://github.com/YOUR_USERNAME/grade_tracker.git"
echo "  git branch -M main"
echo "  git push -u origin main"

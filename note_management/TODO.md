# TODO - Notes Management App (Flutter + Cloud Firestore)

## Plan
- Add Firestore dependencies
- Initialize Firebase
- Implement Notes model + Firestore CRUD service
- Build UI screens: Notes List + Add/Edit

## Steps
1. Update `pubspec.yaml` with `firebase_core` and `cloud_firestore` dependencies.
2. Create `lib/models/note.dart`.
3. Create `lib/services/firestore_note_service.dart` implementing CRUD.
4. Create `lib/screens/notes_list_screen.dart`.
5. Create `lib/screens/add_edit_note_screen.dart`.
6. Refactor `lib/main.dart` to initialize Firebase and set navigation.
7. Run `flutter pub get` and (if possible) `flutter analyze` / `flutter test`.
8. Provide run instructions + note about adding Firebase config files (google-services.json / GoogleService-Info.plist).


# 📱 WhatsApp Clone — Flutter & Dart

A detailed WhatsApp UI clone built entirely with **Flutter** and **Dart**, featuring:

- 🌈 Beautiful teal-green gradients across splash, login, app bar, FABs, and avatars.
- 💬 Fully working **send / receive** of text messages (with auto-reply simulation).
- 👤 Profile screen, status tab, calls tab, and communities tab.
- 📲 Works as a standalone Android APK — install it on **any phone**.

---

## 🖼️ App Structure

```
lib/
├── main.dart
├── data/         dummy_data.dart
├── models/       message.dart, chat.dart, status.dart, call_log.dart
├── providers/    chat_provider.dart   (send/receive + state)
├── screens/      splash, login, home, chats_tab, status_tab,
│                 calls_tab, community_tab, chat_screen, profile_screen
├── theme/        app_theme.dart       (gradients + colors)
└── widgets/      gradient_avatar, gradient_app_bar,
                  gradient_fab, message_bubble
```

---

## 🚀 How to RUN this app on any phone (APK install)

### Option A — Build the APK yourself (recommended)

> **Prerequisite:** Install **Flutter SDK** (≥ 3.10) and **Android Studio** on your PC.
> Download Flutter from <https://docs.flutter.dev/get-started/install>.

1. **Open a terminal** inside this project folder:

   ```bash
   cd whatsapp_clone
   ```

2. **Get dependencies:**

   ```bash
   flutter pub get
   ```

3. **Connect your Android phone** to the PC via USB
   (enable *Developer Options → USB Debugging* on the phone).
   Or skip this if you just want the APK.

4. **Build a release APK:**

   ```bash
   flutter build apk --release
   ```

5. The APK will be created at:

   ```
   build/app/outputs/flutter-apk/app-release.apk
   ```

6. **Copy `app-release.apk` to your phone** (USB / WhatsApp / email / Google Drive),
   tap it and allow *Install from unknown sources*. Done — message any contact 🎉.

### Option B — Run on a connected phone (debug)

```bash
flutter run
```

The app installs and hot-reloads live.

---

## 📥 "Download segment" — Hosting the APK

Since this is a **source** repository (not a hosted binary), you have two simple ways to
share the APK:

1. **GitHub Releases** (best for free public download):
   - Build the APK as shown above.
   - Create a GitHub release for this repo and upload `app-release.apk`.
   - Share the link → anyone can download and install on any phone.

2. **Direct cloud link:**
   - Upload `app-release.apk` to Google Drive / Dropbox / your own server.
   - Anyone with the link taps **Download → Install**.

Once installed, the app runs completely offline — no server needed because chats are
stored in-memory with a friendly auto-reply so you can demo message send/receive
immediately on any device.

---

## ✨ Features

| Feature                       | Status |
|-------------------------------|--------|
| Gradient splash screen        | ✅     |
| Login screen (name input)     | ✅     |
| 4-tab home (Chats/Status/Calls/Communities) | ✅ |
| Chat list with unread badges  | ✅     |
| Story / Status row            | ✅     |
| Chat detail with bubbles      | ✅     |
| Send message (sent → delivered → read ticks) | ✅ |
| Auto-reply simulation         | ✅     |
| Online / typing indicators    | ✅     |
| Profile / contact info screen | ✅     |
| Gradient avatars + FABs       | ✅     |

---

## 🧩 How messaging works

`ChatProvider.sendMessage(chatId, text)`:

1. Adds your message to the chat (status = `sent`).
2. After 600 ms → status becomes `delivered`.
3. After 800 ms more → status becomes `read` (blue double tick).
4. After 1.2 s more → a friendly auto-reply is appended to the same chat.

Everything is reactive — UI updates instantly through `provider`.

---

## 🛠️ Built with

- **Flutter 3.x** (Material 3)
- **Dart 3.x**
- **provider** for state management
- **intl** for date/time formatting

---

## 📄 License

Free to use for learning and personal projects.

Happy messaging! 💚

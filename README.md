# flutterwithgetx

A new Flutter project using GetX for state management and routing.

---

## 🚀 Getting Started

This project is a starting point for a Flutter application.

### 📚 Useful Flutter Resources

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)
- [Flutter Documentation](https://docs.flutter.dev/): Tutorials, samples, mobile development guides, and full API reference.

---

## 🔐 Environment Configuration with `.env`

This project uses [`flutter_dotenv`](https://pub.dev/packages/flutter_dotenv) to manage environment variables across platforms.

### 📄 Sample `.env` File

```env
API_BASE_URL=https://api.example.com
APP_NAME=Ohaz
SUPPORT_EMAIL=support@ohaz.com
```

---

### 🖥️ Create `.env` File on Different OS

#### 🪟 Windows

##### 🧭 File Explorer

1. Go to the project root directory.
2. Right-click → **New** → **Text Document**.
3. Rename the file to `.env` (remove `.txt` if present).
4. Enable file extensions from **View → File name extensions** if needed.
5. Open and paste the sample content above.

##### 💻 Command Prompt

```bash
cd your_flutter_project_path
echo API_BASE_URL=https://api.example.com > .env
echo APP_NAME=Ohaz >> .env
echo SUPPORT_EMAIL=support@ohaz.com >> .env
```

---

#### 🍏 macOS

##### 💻 Terminal

```bash
cd your_flutter_project_path
touch .env
echo "API_BASE_URL=https://api.example.com" >> .env
echo "APP_NAME=Ohaz" >> .env
echo "SUPPORT_EMAIL=support@ohaz.com" >> .env
```

##### 🧭 Finder

1. Run `open .` in Terminal to open the folder.
2. Press `Cmd + Shift + .` to view hidden files.
3. Create `.env` and edit using TextEdit or VSCode.

---

#### 🐧 Linux

##### 💻 Terminal

```bash
cd your_flutter_project_path
touch .env
echo "API_BASE_URL=https://api.example.com" >> .env
echo "APP_NAME=Ohaz" >> .env
echo "SUPPORT_EMAIL=support@ohaz.com" >> .env
```

---

### ⚙️ Using `.env` in Flutter

#### 1. Load `.env` in `main.dart`

```dart
await dotenv.load(fileName: ".env");
```

Make sure this runs **before** `runApp()`.

#### 2. Access Variables

```dart
import 'package:flutter_dotenv/flutter_dotenv.dart';

final baseUrl = dotenv.env['API_BASE_URL'];
```

---

### 🛡️ Security Tip

Add `.env` to your `.gitignore` to avoid committing sensitive information:

```gitignore
.env
```

> 💡 Tip: Consider adding a `.env.example` with placeholder values for collaborators.

---

## ⚙️ Code Generation with FlutterGen

This project uses [`FlutterGen`](https://pub.dev/packages/flutter_gen) for type-safe access to assets, fonts, and more.

### 🛠️ Setup

In your `pubspec.yaml`:

```yaml
dev_dependencies:
  flutter_gen_runner: ^5.3.1
  build_runner: ^2.4.6

flutter_gen:
  output: lib/gen/
  integrations:
    flutter_svg: true
```

> ⚠️ Use the latest versions from [pub.dev](https://pub.dev/packages/flutter_gen).

---

### 🔨 Generate Code

```bash
dart run build_runner build
```

This generates files such as `Assets.gen.dart` inside `lib/gen/`.

---

### 🔄 Watch for Changes

Run this to regenerate automatically on file changes:

```bash
dart run build_runner watch
```

---

### 🧼 Clean and Rebuild (Optional)

```bash
dart run build_runner clean
dart run build_runner build
```

---

### 📂 Accessing Assets with FlutterGen

#### ❌ Old Way:

```dart
Image.asset('assets/images/logo.png');
```

#### ✅ Recommended Way:

```dart
import 'package:your_project_name/gen/assets.gen.dart';

Image.asset(Assets.images.logo.path);
```

### ✅ Benefits

- IDE Autocomplete
- Compile-time safety
- Reduced typos

---

Now you're all set with `.env` configuration and asset management using FlutterGen. Happy coding! 🎯

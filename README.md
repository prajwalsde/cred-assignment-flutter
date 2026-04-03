# 📱 CRED Stack Assignment

![Flutter](https://img.shields.io/badge/Flutter-3.9.2+-blue?style=flat-square&logo=flutter)
![Dart](https://img.shields.io/badge/Dart-3.9.2+-blue?style=flat-square&logo=dart)
![License](https://img.shields.io/badge/License-MIT-green?style=flat-square)
![Build Status](https://img.shields.io/badge/Build-Passing-brightgreen?style=flat-square)

A high-performance Flutter application showcasing **Clean Architecture** with a bill payment dashboard featuring dynamic state management using **BLoC pattern**. The app displays a list of bills with real-time status updates and custom UI animations.

## 📋 Table of Contents

- [Features](#features)
- [Architecture](#-architecture--tech-stack)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Project Structure](#-project-structure)
- [Usage](#usage)
- [Testing](#-testing)
- [Contributing](#contributing)
- [License](#license)

## ✨ Features

- ✅ **Clean Architecture** - Separation of concerns with Data, Logic, and Presentation layers
- ✅ **BLoC State Management** - Predictable state transitions using `flutter_bloc`
- ✅ **Responsive UI** - Material Design 3 with custom bill cards
- ✅ **Dynamic Bill Listing** - Display bills with status badges (Due Today, Overdue, etc.)
- ✅ **Mock Data** - Built-in mock API with configurable data sets
- ✅ **Error Handling** - Comprehensive error states and user-friendly messages
- ✅ **Unit & Widget Tests** - Full test coverage for business logic and UI
- ✅ **TypeSafe** - Null-safe Dart with Equatable models

## 🏗 Architecture & Tech Stack

The project follows **Clean Architecture** with strict separation of concerns:

```
┌─────────────────────────────────────────┐
│      Presentation Layer (UI)            │
│  Screens, Widgets, State Management     │
├─────────────────────────────────────────┤
│      Logic Layer (Business Logic)       │
│  BLoC/Cubit, State Classes              │
├─────────────────────────────────────────┤
│      Data Layer (Repositories)          │
│  Models, Repositories, API Calls        │
└─────────────────────────────────────────┘
```

### **Core Technologies**

| Technology | Purpose |
|-----------|---------|
| `flutter_bloc` | State management with Cubit |
| `equatable` | Value equality for models |
| `http` | Network requests |
| `google_fonts` | Custom typography |
| `flutter_test` | Unit and widget testing |

### **Key Features**

- **State Management:** BLoC/Cubit with predictable state transitions (Loading → Loaded → Error)
- **Error Handling:** Comprehensive error states with user-friendly messages
- **Responsive Design:** Works seamlessly on mobile devices
- **Material Design 3:** Modern UI components and theming

## Prerequisites

Ensure you have the following installed:

- **Flutter:** 3.9.2 or higher ([Install Flutter](https://flutter.dev/docs/get-started/install))
- **Dart:** 3.9.2 or higher (bundled with Flutter)
- **Git:** ([Install Git](https://git-scm.com/))

Verify your setup:
```bash
flutter --version
dart --version
```

## Installation

### 1. Clone the Repository

```bash
git clone https://github.com/yourusername/cred_assignment.git
cd cred_assignment
```

### 2. Install Dependencies

```bash
flutter pub get
```

### 3. Get Flutter Packages

```bash
flutter pub upgrade
```

## 📂 Project Structure

```
lib/
├── data/
│   ├── models/
│   │   └── bill_model.dart           # Bill data model with JSON serialization
│   └── repositories/
│       └── bill_repository.dart      # API calls and data fetching logic
├── logic/
│   └── cubit/
│       ├── bill_cubit.dart           # State management logic
│       └── bill_state.dart           # State definitions (Initial, Loading, Loaded, Error)
├── presentation/
│   ├── screens/
│   │   └── home_screen.dart          # Main bill list screen
│   └── widgets/
│       └── bill_card.dart            # Reusable bill card component
└── main.dart                         # App entry point & theme configuration

test/
└── widget_test.dart                  # Widget and unit tests
```

## Usage

### Running the App

**Development:**
```bash
flutter run
```

**Release (iOS):**
```bash
flutter run --release -t lib/main.dart
```

**Release (Android):**
```bash
flutter run --release
```

### Building for Distribution

**Android APK:**
```bash
flutter build apk --release
```

**iOS IPA:**
```bash
flutter build ios --release
```

**Web:**
```bash
flutter build web --release
```

## 🧪 Testing

Run all tests:
```bash
flutter test
```

Run tests with coverage:
```bash
flutter test --coverage
```

View coverage report:
```bash
lcov --list coverage/lcov.info
```

**Test Coverage Includes:**
- ✅ BLoC state transitions
- ✅ Repository data fetching
- ✅ Model JSON serialization
- ✅ Widget rendering

## 📦 Project Dependencies

```yaml
dependencies:
  flutter: sdk: flutter
  flutter_bloc: ^8.1.3
  equatable: ^2.0.5
  http: ^1.2.0
  google_fonts: ^6.1.0

dev_dependencies:
  flutter_test: sdk: flutter
  flutter_lints: ^5.0.0
```

## 🤖 AI Usage Declaration

Generative AI tools were used for:
1. Mathematical formula optimization for UI physics
2. Layout debugging and Z-index issue resolution
3. JSON serialization boilerplate generation

## Contributing

Contributions are welcome! Please follow these steps:

1. **Fork the repository**
2. **Create a feature branch** (`git checkout -b feature/AmazingFeature`)
3. **Commit changes** (`git commit -m 'Add AmazingFeature'`)
4. **Push to branch** (`git push origin feature/AmazingFeature`)
5. **Open a Pull Request**

### Code Style

- Follow [Dart Style Guide](https://dart.dev/guides/language/effective-dart/style)
- Use meaningful variable and function names
- Add comments for complex logic
- Format code: `dart format .`
- Lint: `flutter analyze`

## 📝 License

This project is licensed under the **MIT License** - see the [LICENSE](LICENSE) file for details.

## 👨‍💻 Author

**Prajwal Jadhav**
- GitHub: [@yourusername](https://github.com/yourusername)
- Email: your.email@example.com

## 🙏 Acknowledgments

- Flutter and Dart teams for excellent documentation
- `flutter_bloc` community for state management patterns
- Inspired by CRED's modern UI design principles

---

<div align="center">

**[⬆ back to top](#-cred-stack-assignment)**

Made with ❤️ by Prajwal Jadhav

</div>
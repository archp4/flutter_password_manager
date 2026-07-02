# LockIt

A secure and user-friendly password manager designed to keep your credentials safe on your local device. With LockIt, you can effortlessly store, organize, and access your passwords, all while enjoying a seamless and intuitive experience.

## Tech Stack
- **Framework**: Flutter
- **Language**: Dart
- **Local Database**: sqflite
- **State Management**: Provider
- **Local Persistence**: shared_preferences, path_provider
- **Security & Auth**: local_auth (Biometric Authentication)
- **File & Permissions**: file_picker, permission_handler
- **UI & UX**: features_tour, flutter_animated_button, dropdown_button2, chips_choice, cupertino_icons
- **Utilities**: url_launcher

## Key Features
- **Local Storage with SQLite**: Your passwords are securely stored on your device using SQLite, ensuring that your sensitive information remains under your control.
- **Robust Local Authentication**: Protect your data with advanced local authentication methods, adding an extra layer of security to your stored passwords.
- **Light/Dark Theme Options**: Customize your app experience with light and dark themes, catering to your visual preferences and enhancing usability in various lighting conditions.
- **Data Backup and Restore**: Easily back up your password data and restore it when needed, providing peace of mind and data continuity across devices.
- **Organize with Sorting and Favorites**: Sort your passwords by type or mark them as favorites for quick access, streamlining your password management process.
- **Cross-Platform Compatibility**: Fully compatible with Android, iOS, Windows, Linux, macOS, and Web.
- **Interactive Onboarding**: A guided user experience using features_tour to help new users get started.

## Directory Structure
```text
lib/
├── helpers/             # Utility functions and helper classes
├── models/              # Data models (e.g., PasswordData, Theme)
├── pages/               # UI screens (home, password, onboarding, search, etc.)
└── widgets/             # Reusable UI components
```

## Getting Started
To get started with this project, follow the steps below:

1. Clone the repository
2. Install dependencies:
   ```bash
   flutter pub get
   ```
3. Run the application:
   ```bash
   flutter run
   ```

---

## About LockIt

**LockIt** is a secure and user-friendly password manager designed to keep your credentials safe on your local device. With LockIt, you can effortlessly store, organize, and access your passwords, all while enjoying a seamless and intuitive experience.

<!-- ![App Pics](https://previewed.app/template/CFA62417) -->

LockIt is developed by **[Arch Patel](https://archpatel.live)**, a dedicated software developer with a solid foundation in Information Technology. Arch’s expertise includes creating simple, intuitive, and responsive user interfaces that help users accomplish tasks efficiently.

With a passion for designing and coding beautifully simple solutions, Arch ensures that LockIt not only meets your security needs but also provides an enjoyable user experience.

**Experience the perfect blend of security and simplicity with LockIt, your reliable companion for password management.**

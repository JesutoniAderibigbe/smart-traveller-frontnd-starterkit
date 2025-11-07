# 🚀 Smart Traveller Mobile Starter Toolkit

Welcome to the **Smart Traveller Mobile Starter Toolkit** — a foundational Flutter project setup designed for rapid development, clean architecture, and a scalable code structure. This repository provides a well-organized, production-ready starting point for a travel-themed mobile application.

The goal of this starter kit is to minimize boilerplate and setup time, allowing developers to focus on building features. It comes pre-configured with essential packages for mapping, API calls, animations, and navigation, all structured within a clean and maintainable architecture.

---

## 🏗️ Project Structure

The project follows a standard Flutter project structure, with a detailed breakdown of the `lib` directory for clear separation of concerns.

```
.
├── android/              # Android-specific files and configurations
├── assets/               # Static assets like images, fonts, and animations
│   └── images/
│       └── maps_animation.json
├── ios/                  # iOS-specific files and configurations
├── lib/                  # Main application code
│   ├── main.dart         # Entry point of the application
│   └── src/
│       ├── components/   # Reusable UI widgets (e.g., buttons, loaders, custom cards)
│       ├── constants/    # App-wide constants like colors, themes, and styles
│       ├── models/       # Data models for representing business objects (e.g., Trip, User)
│       ├── routes/       # Navigation and routing logic using go_router
│       ├── services/     # Business logic, API clients, and external service integrations
│       └── ui/           # Application screens and UI-specific widgets
├── linux/                # Linux-specific files and configurations
├── macos/                # macOS-specific files and configurations
├── test/                 # Unit, widget, and integration tests
├── web/                  # Web-specific files for a Flutter web build
├── windows/              # Windows-specific files and configurations
├── .gitignore            # Files and folders to be ignored by Git
├── pubspec.yaml          # Project metadata and dependencies
└── README.md             # This file
```

### Explanation of `lib/src` Directories

-   **`components/`**: Contains reusable widgets that are shared across multiple screens, such as `CustomButton`, `LoadingIndicator`, or `TripCard`.
-   **`constants/`**: A centralized place for application-wide constants. This includes `app_theme.dart` for theme data and `color_constant.dart` for the color palette.
-   **`models/`**: Defines the data structures of the application. For example, you might have a `trip.dart` model to represent a user's journey.
-   **`routes/`**: Manages all aspects of navigation. The `routes.dart` file configures `go_router` to handle screen transitions and deep linking.
-   **`services/`**: The brain of your application's business logic. This is where you'll interact with APIs, databases, and other external services.
-   **`ui/`**: Contains the application's screens. Each major feature or screen should have its own subdirectory (e.g., `ui/home/`, `ui/trip_details/`).

---

## ⚙️ Installed Packages and Their Use Cases

Below is an explanation of each dependency and why it’s included in the toolkit:

| Package | Version | Purpose |
|-------------------|---------|----------------------------------------------------------------------------------------------------------------|
| **cupertino_icons** | ^1.0.8 | Provides iOS-style icons for a native look and feel on Apple devices. |
| **lottie** | ^3.3.1 | Renders beautiful and complex animations from JSON files, perfect for onboarding, loading, or success screens. |
| **firebase_core** | ^4.2.1 | The core package to initialize and connect the Flutter app to Firebase services. |
| **flutter_animate** | ^4.5.2 | Simplifies adding stunning, high-performance animations and transitions with minimal code. |
| **flutter_map** | ^8.2.2 | A versatile and customizable map library for displaying interactive maps. |
| **latlong2** | ^0.9.1 | Provides latitude/longitude utilities, essential for map-related calculations and features. |
| **http** | ^1.5.0 | A standard, lightweight HTTP client for making API calls to external REST endpoints. |
| **go_router** | ^17.0.0 | A declarative, URL-based routing system that simplifies navigation, deep linking, and state management for routes. |
| **google_fonts** | ^6.3.2 | Allows easy integration of Google Fonts for consistent and beautiful typography across the app. |

---

## 🚀 Getting Started

To get this project up and running, follow these steps:

1.  **Clone the Repository**
    ```bash
    git clone <your-repository-url>
    cd smart_travller_frontend_starter
    ```

2.  **Install Dependencies**
    ```bash
    flutter pub get
    ```

3.  **Run the App**
    ```bash
    flutter run
    ```

---

## 🧩 Recommended Usage Flow

1.  **Initialize Firebase**
    Set up your Firebase project and configure it in your `main.dart` using `WidgetsFlutterBinding.ensureInitialized()` and `Firebase.initializeApp()`.

2.  **Define Routes**
    Use `go_router` to define all your app's navigation paths in the `src/routes/` directory for a clean and centralized routing system.

3.  **Build Reusable Components**
    Create all reusable UI elements (like buttons, text fields, or custom cards) in the `src/components/` directory to ensure a consistent design system.

4.  **Manage Data and Logic**
    - Define your data structures and models in `src/models/`.
    - Implement your business logic, such as API calls or database interactions, in the `src/services/` directory.

5.  **Create UI Screens**
    Develop your app's screens and layouts in the `src/ui/` directory, organizing them into subfolders by feature (e.g., `ui/trips/`, `ui/profile/`).

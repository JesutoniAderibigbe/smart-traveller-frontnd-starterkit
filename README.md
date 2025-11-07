# 🚀 Smart Traveller Mobile Starter Toolkit

Welcome to the **Mobile Developer Starter Pack Toolkit** — a foundational Flutter project setup designed for rapid development, clean architecture, and scalable code structure.  

This toolkit is ideal for developers building fintech or utility apps (like Paystack mobile experiences), and it emphasizes structure, clarity, and modern Flutter conventions.

---

## 🏗️ Code Structure

The project follows a **modular folder architecture** for scalability and clean separation of concerns:

```

lib/
│
└── src/
├── components/ # Reusable UI widgets (buttons, loaders, cards, etc.)
├── constants/ # Static values (colors, sizes, API URLs, text styles)
├── models/ # Data models and entity definitions
├── services/ # API calls, authentication, and Firebase services
└── ui/ # Screens, views, and layouts (organized by feature)


This structure helps maintain clarity between **presentation**, **data**, and **logic layers**, ensuring easier testing, reusability, and scaling.

---

## ⚙️ Installed Packages and Their Use Cases

Below is an explanation of each dependency and why it’s included in the toolkit:

| Package | Version | Purpose |
|----------|----------|----------|
| **cupertino_icons** | ^1.0.8 | Provides iOS-style icons and widgets for consistent cross-platform design. |
| **go_router** | ^16.2.5 | A declarative, URL-based routing system for Flutter. Handles navigation, deep links, and shell routes elegantly. |
| **google_fonts** | ^6.3.2 | Makes it easy to use Google Fonts directly in your app for better typography and branding. |
| **lottie** | ^3.3.1 | Adds beautiful vector animations in JSON format (from After Effects or LottieFiles). Useful for onboarding and success screens. |
| **flutter_animate** | ^4.5.2 | Simplifies adding smooth animations and transitions with minimal code. Perfect for polished UI effects. |
| **flutter_map** | ^8.2.2 | A lightweight, customizable map library built on top of Leaflet for displaying interactive maps. |
| **latlong2** | ^0.9.1 | Provides latitude/longitude utilities for map features (used with `flutter_map`). |
| **url_launcher** | ^6.3.2 | Opens external URLs, phone numbers, or email clients directly from the app. |
| **firebase_core** | ^4.2.0 | Initializes and connects the Flutter app to Firebase services. It’s required for all other Firebase integrations. |
| **cloud_functions** | ^6.0.3 | Enables calling Firebase Cloud Functions directly from Flutter. Great for serverless backend logic or Paystack-like transaction verification. |
| **firebase_auth** | ^6.1.1 | Provides user authentication and management with Firebase (email, phone, Google, etc.). |
| **http** | ^1.5.0 | Lightweight HTTP client for REST API calls, used for connecting to external endpoints. |

---

## 🧩 Recommended Usage Flow

1. **Initialize Firebase**  
   Set up Firebase in your `main.dart` using `WidgetsFlutterBinding.ensureInitialized()` and `Firebase.initializeApp()`.

2. **Routing with go_router**  
   Define app routes in a single file, like `app_router.dart`, for clean and declarative navigation.

3. **UI Components**  
   Keep all reusable UI elements in `src/components/` — for instance, `PrimaryButton`, `AppLoader`, or `EmptyStateWidget`.

4. **Models and Services**  
   - Use `src/models/` for your data representations (e.g., `UserModel`, `TransactionModel`).
   - Use `src/services/` for network calls, Firebase logic, or business logic classes (like authentication or payment services).

5. **UI Layer**  
   - Each screen (Login, Dashboard, etc.) resides in `src/ui/`.
   - Group related screens into feature folders: `ui/auth/`, `ui/home/`, etc.

---

## 💡 Example Folder Tree





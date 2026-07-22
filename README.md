# 🚀 Flutter Core Packages Demo & Practice

A practical implementation repository demonstrating six essential Flutter packages frequently used in production app development. Each package includes a minimal, functional example showing how to wire it up and use it effectively.

---

## 📌 Packages & Implementations

### 1. 🧭 GoRouter (`go_router`)
* **Purpose:** Declarative, URL-based navigation and routing for Flutter applications.
* **Key Features:** Supports nested routes, path parameters, query parameters, redirects, and route guards.
* **Why it matters:** Provides a cleaner, maintainable, and structured routing architecture compared to basic `Navigator.push`.

---

### 2. 🌐 Dio (`dio`)
* **Purpose:** A powerful, feature-rich HTTP client for handling API operations.
* **Key Features:** Interceptors (for logging and attaching auth tokens), global error handling, file downloading, and custom timeouts.
* **Why it matters:** Standardizes backend service interactions and simplifies network error handling.

---

### 3. 🔒 FlutterSecureStorage (`flutter_secure_storage`)
* **Purpose:** Encrypted storage for sensitive user data such as authentication tokens, passwords, and API keys.
* **Key Features:** Uses native platform storage — Android KeyStore and iOS Keychain.
* **Implementation:** Basic operations including `write`, `read`, `delete`, and `deleteAll`.

---

### 4. 🧩 GetIt (`get_it`)
* **Purpose:** A lightweight service locator used for Dependency Injection (DI).
* **Key Features:** Registers singletons, lazy singletons, and factory objects.
* **Why it matters:** Allows accessing services, repositories, and controllers anywhere in the app without passing dependencies through the widget tree.

---

### 5. 🖼️ Flutter SVG (`flutter_svg`)
* **Purpose:** Renders Scalable Vector Graphics (SVG) images cleanly in the Flutter UI.
* **Key Features:** Crisply renders assets without pixelation at any screen density.
* **Implementation:** Usage of `SvgPicture.asset` for local vectors and `SvgPicture.network` for remote images.

---

### 6. 📱 Device Preview (`device_preview`)
* **Purpose:** Previews your application on multiple device screen sizes and platforms simultaneously.
* **Key Features:** Simulates light/dark modes, custom resolutions, font scaling, and device orientations within a single emulator or browser window.
* **Why it matters:** Speeds up testing for responsive UI design without launching multiple emulators.

---

## 🛠️ Getting Started

### Prerequisites
* [Flutter SDK](https://docs.flutter.dev/get-started/install) (v3.0.0 or higher)
* Android Studio / VS Code
* An active emulator or physical device

### Installation & Setup

1. **Clone the repository:**
   ```bash
   git clone [https://github.com/tf-muneeb/flutter-packages.git](https://github.com/tf-muneeb/flutter-packages.git)
   cd flutter-packages
   ```
   
2. **Fetch project dependencies:**
   ```bash
   flutter pub get
   ```
   
3. **Run the app:**
   ```bash
   flutter run
   ```

## ✅ Package Checklist

- [x] **GoRouter** — Basic declarative routing set up
- [x] **Dio** — Real HTTP API request executed with interceptors
- [x] **FlutterSecureStorage** — Stored, read, and deleted secure key-value pairs
- [x] **GetIt** — Registered and retrieved global service instances
- [x] **Flutter_SVG** — Rendered local vector asset and network SVG
- [x] **Device_Preview** — Tested UI responsiveness across multiple screen profiles

---

## 📄 License

This project is created for educational and practice purposes.

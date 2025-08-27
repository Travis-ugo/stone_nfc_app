# Tag Play

**Tag Play** is a mobile application that lets users scan NFC tags to instantly play associated videos, track their viewing history, and manage their profile. The app is built using Flutter, making it available for both Android and iOS devices.

---

## What is Tag Play?

Tag Play is designed to make video content easily accessible through NFC (Near Field Communication) technology. By simply tapping your phone on a special NFC tag, the app will fetch and play a video linked to that tag. This is useful for interactive marketing, museums, events, or any scenario where you want to connect physical objects to digital video content.

---

## Key Features

- **Scan NFC Tags:** Instantly play a video by scanning an NFC tag.
- **Manual Token Entry:** If you don’t have an NFC tag, you can manually enter a code to access the video.
- **Watch History:** The app keeps track of videos you’ve watched.
- **Profile Management:** Manage your user profile and preferences.
- **Error Handling:** If you scan an invalid or unregistered tag, the app will show a clear error message.

---

## How Does It Work?

1. **Scan or Enter a Token:** Tap your phone on an NFC tag, or enter a code manually.
2. **Fetch Video:** The app checks its database (hosted on Firestore) to find the video linked to that tag or code.
3. **Play Video:** If a video is found, it plays instantly. If not, you’ll see an error message.
4. **Track History:** Every video you watch is saved to your personal watch history.

---

## Project Structure

- **lib/**  
  The main app code, including screens, business logic, and services.
- **assets/**  
  Images, icons, and fonts used in the app.
- **android/** and **ios/**  
  Platform-specific setup for Android and iOS.
- **packages/**  
  This folder contains reusable building blocks (called "packages") that power the app’s features.  
  Each package is like a mini-library with a specific responsibility.  
  - **authentication_repository/**: Handles user login and authentication.
  - **cache/**: Manages temporary data storage for faster access.
  - **form_inputs/**: Provides reusable form validation logic (e.g., for email and password fields).
  - **storage_repository/**: The heart of the app’s data layer. It connects to the cloud database (Firestore), manages videos, NFC tokens, user profiles, and watch history.

---

## The Packages Folder (Why It Matters)

The `packages` folder is where the app’s core logic lives, separated into focused modules. This makes the app easier to maintain, test, and expand. For example:

- If you want to change how users log in, you’d look in `authentication_repository`.
- If you want to add new types of data or change how videos are stored, you’d look in `storage_repository`.

Each package can be updated independently, making the app more robust and flexible.

---

## How to Use the App

1. **Install the app** on your phone (Android or iOS).
2. **Open the app** and log in or create a profile.
3. **Scan an NFC tag** (or enter a code) to watch a video.
4. **View your watch history** or update your profile at any time.

---

## Error Handling

If you scan a tag or enter a code that doesn’t exist in the system, the app will show a friendly error message so you know what went wrong.

---

## Quickstart for Developers

If you’re a developer and want to run or contribute to this project, follow these steps:

1. **Install Flutter:**  
   [Flutter installation guide](https://docs.flutter.dev/get-started/install)
2. **Clone the repository:**
   ```bash
   git clone <repo-url>
   cd tag_play
   ```
3. **Install dependencies:**
   ```bash
   flutter pub get
   ```
4. **Set up Firebase:**
   - Add your own `google-services.json` (Android) and `GoogleService-Info.plist` (iOS) in the respective folders if you want to use your own Firebase project.
5. **Run the app:**
   ```bash
   flutter run
   ```
6. **Explore the `packages/` folder** for reusable modules and business logic.

---

## For More Information

- Each package in the `packages/` folder has its own README for more technical details.
- If you have any questions or need help, please contact the project maintainer.

---

This README should help anyone—technical or not—understand what Tag Play is, how it works, and how to get started. If you need a more detailed setup or have specific questions, feel free to ask!

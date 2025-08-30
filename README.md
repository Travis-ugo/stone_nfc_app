# Tag Play

**Tag Play** is a mobile application that lets users scan NFC tags to instantly play associated videos, track their viewing history, and manage their profile. The app is built using Flutter, making it available for both Android and iOS devices. Flutter is a free tool from Google that allows developers to create apps that work on multiple platforms with the same code, so the app looks and feels natural on your phone whether you're using Android or iPhone.

This README is designed to be easy to understand, even if you're not a developer. We'll explain everything in simple terms, step by step, including how the app works behind the scenes with Firebase (a cloud service from Google), how videos and data are stored, and how you can manually add videos if needed. If something seems technical, we'll break it down—no coding knowledge required.

---

## What is Tag Play?

Tag Play is an app that connects physical NFC tags (small stickers or chips that your phone can "tap" to read) with digital videos. Imagine sticking an NFC tag on a poster, product, or museum exhibit. When someone taps their phone on it, the app automatically plays a linked video. This is great for things like marketing campaigns, educational tours, events, or sharing fun content in creative ways.

The app doesn't just play videos—it also remembers what you've watched (your "watch history"), lets you manage your personal profile (like updating your name or email), and handles errors gracefully (e.g., if the tag isn't linked to a video, it shows a friendly message like "Sorry, no video found for this tag").

Everything is powered by Firebase, which is like a secure online storage and database system. It handles user logins, stores videos, keeps track of data, and makes sure everything is safe and accessible from anywhere.

---

## Key Features

- **Scan NFC Tags:** Tap your phone on an NFC tag to play the linked video right away. NFC stands for Near Field Communication—it's the same tech used for contactless payments or sharing contacts.
- **Manual Token Entry:** If you don't have an NFC tag handy, you can type in a 10-character code (made of letters and numbers) to access the video manually.
- **Watch History:** The app saves a list of videos you've watched, so you can go back and review them later.
- **Profile Management:** Create an account, log in (using email/password or Google Sign-In), and edit your details.
- **Error Handling:** If something goes wrong—like scanning an invalid tag—the app shows a clear message explaining the issue, so you're not left confused.
- **Video Upload from App:** From your phone, you can pick a video, upload it to the cloud, and link it to a new NFC tag code (the app generates this code automatically).
- **Manual Video Upload Option:** If you prefer, you can upload videos directly through the Firebase website (we'll explain how below), but you'll need to create the 10-character code yourself.

---

## How Does It Work?

Here's a simple breakdown of what happens when you use the app:

1. **Scan or Enter a Token:** You tap your phone on an NFC tag (which has a hidden 10-character code stored on it), or you type the code in manually. The app reads this code.
2. **Fetch Video:** The app sends the code to Firebase Firestore (think of Firestore as an online database, like a spreadsheet in the cloud). Firestore checks if there's a video link tied to that code.
3. **Play Video:** If a match is found, the app pulls the video from Firebase Storage (a secure file storage service) and plays it using a built-in video player. It also saves this to your watch history in Firestore.
4. **Track History and Profile:** Your user data, like watch history and profile info, is stored securely in Firestore under your account. Authentication (login) is handled by Firebase Auth, which keeps your info safe with passwords or Google login.

Behind the scenes:
- Videos are stored in Firebase Storage as files, and only a "link" (URL) to the video is saved in Firestore along with the 10-character token.
- When you upload a video from the app, it automatically creates a thumbnail (a small preview image), generates a random 10-character token (e.g., "A1B2C3D4E5" using letters A-Z and numbers 0-9), and saves everything to Firestore.
- NFC tags store this token. When scanned, the app uses it to look up the video.

If you're wondering about privacy: All data is tied to user accounts, and Firebase uses encryption to keep things secure. Only logged-in users can access their own history and profile.

---

## Understanding Firebase: The Backend of the App

Since you're not a developer, let's explain Firebase like this: It's a set of online tools from Google that act as the "brain" and "storage" for the app. No servers or complicated setups needed—everything runs in the cloud.

- **Firebase Authentication (Auth):** This handles logins. Users can sign up with email/password or use Google Sign-In. It ensures only authorized people access their data.
- **Firebase Firestore:** This is like a big online database. It stores:
  - User profiles (e.g., name, email).
  - NFC video models (details about each video, like its title, link, and the 10-character token).
  - Watch history (a list of videos each user has viewed, with dates).
- **Firebase Storage:** This is where the actual video files are uploaded and kept. It's secure and fast for streaming videos.

The app connects to Firebase automatically when you use it. If you have access to the Firebase console (the web dashboard at console.firebase.google.com), you can see and manage this data manually.

### Manual Video Upload: Step-by-Step Guide

Normally, you upload videos through the mobile app, which handles everything automatically (uploading the file, creating a thumbnail, generating a token, and saving to Firestore). But if you want to upload videos manually (e.g., from your computer), here's how. This is useful for bulk uploads or testing without the app.

**Important Note:** Manual upload means you'll have to create the 10-character token yourself. The token is what links the NFC tag to the video—it's stored on the tag and used by the app to find the video. If you generate a duplicate token, it might overwrite existing data, so make it unique.

#### Step 1: Access the Firebase Console
- Go to [console.firebase.google.com](https://console.firebase.google.com) in your web browser.
- Sign in with the Google account that owns the Firebase project for Tag Play. (If you don't have access, ask the project owner to invite you as an editor.)
- Select the "Tag Play" project from the list.

#### Step 2: Upload the Video File to Firebase Storage
- In the left menu, click "Storage" (it looks like a folder icon).
- You'll see a file browser. If there's a folder like "videos" or similar, navigate into it. If not, you can upload directly to the root.
- Click the "Upload file" button (blue button at the top).
- Choose your video file from your computer (e.g., MP4 format is best for compatibility).
- Wait for the upload to finish. Once done, click on the file name to see details.
- Copy the "Download URL" (this is the link to the video). It will look something like: https://firebasestorage.googleapis.com/v0/b/your-project.appspot.com/o/your-video.mp4?alt=media&token=some-token
- Note: The app also needs a thumbnail. If you don't have one, you can create a simple image (e.g., a screenshot from the video) using free tools like Paint or online editors. Upload it the same way to Storage, and copy its Download URL too.

#### Step 3: Generate a 10-Character Token
- The token is a unique code of exactly 10 characters, using uppercase letters (A-Z) and numbers (0-9). No special characters.
- Make it random to avoid duplicates. For example:
  - Use a random generator tool online (search for "random alphanumeric generator" and set it to 10 characters, letters + numbers).
  - Or make one up: e.g., "X7Y2Z9A4B1".
- Write it down—you'll need it for Firestore and to program the NFC tag.

#### Step 4: Add the Video Details to Firestore
- In the left menu, click "Firestore Database" (it looks like a database icon).
- If not already created, you might see collections like "videos" or "nfc_tokens". (Collections are like folders for data.)
- Click "Create document" in the appropriate collection (ask the developer if unsure—likely "videos" or "nfc_videos").
- Fill in the fields:
  - Use the token as the document ID (this makes it easy to look up).
  - Add fields like:
    - "video_url": Paste the Download URL from Storage.
    - "thumbnail_url": Paste the thumbnail's Download URL (if available; otherwise, leave blank or use a default image URL).
    - "title": Give the video a name (optional, e.g., "Welcome Video").
    - "description": A short note (optional).
    - "created_at": The current date/time (Firestore can auto-generate timestamps).
- Click "Save". Now the video is linked to the token in the database.

#### Step 5: Program the NFC Tag (If Using One)
- You'll need an NFC writer app on your phone (e.g., "NFC Tools" from the app store—free versions available).
- Open the NFC writer app.
- Choose to write a "Text" record.
- Enter the 10-character token as the text.
- Tap your phone on the blank NFC tag to write it.
- Now, when someone scans this tag with Tag Play, it will read the token and play the linked video.

#### Downsides of Manual Upload
- No automatic thumbnail: You'll have to create and upload one yourself.
- Manual token generation: Risk of duplicates if not careful (check Firestore for existing tokens).
- No compression: The app might compress videos for faster loading—manual uploads skip this, so large files could be slow.
- If you mess up, you might need to delete and re-upload. Always test by entering the token manually in the app.

If you run into issues, take screenshots of error messages and share them with the developer.

---

## Project Structure

The app's files are organized into folders to keep things tidy. You don't need to touch these unless you're curious, but here's a simple explanation:

- **lib/**  
  This is the heart of the app's code. It includes screens (what you see on your phone), logic (how things work), and connections to Firebase.
- **assets/**  
  Pictures, icons, and fonts that make the app look nice.
- **android/** and **ios/**  
  Setup files specific to Android and iPhone—Flutter handles the rest.
- **packages/**  
  These are like reusable toolkits. Each one does a specific job:
  - **authentication_repository/**: Manages logins and user accounts using Firebase Auth.
  - **cache/**: Temporarily stores data on your phone for quicker loading (e.g., remembering your profile).
  - **form_inputs/**: Helps with forms, like checking if your email is valid when signing up.
  - **storage_repository/**: Connects to Firebase Firestore and Storage to save/retrieve videos, tokens, history, and user data.

---

## The Packages Folder (Why It Matters)

Think of the `packages` folder as modular building blocks. They're separated so if one part needs fixing (e.g., changing how logins work), it doesn't break the whole app. For non-developers, this just means the app is built to be reliable and easy to update.

Each package uses dependencies (pre-made tools from the Flutter community). For example:
- The main app uses things like `video_player` to play videos, `nfc_manager` to read NFC tags, and `firebase_core` to connect to Firebase.
- The auth package handles Google Sign-In and Firebase logins.
- The storage package deals with uploading files and querying the database.

Full list of tools (dependencies) is in the pubspec.yaml files (configuration files), but you don't need to worry about them unless setting up for development.

---

## 📂 Folder Structure


   ```plaintext
   tag_play/
   ├── 📱 android/                # Android-specific setup
   ├── 🍏 ios/                     # iOS-specific setup
   ├── 🎨 assets/                  # Images, icons, fonts, etc.
   │   ├── images/
   │   ├── icons/
   │   └── fonts/
   ├── 💻 lib/                     # Main application code
   │   ├── core/                   # Core utilities, constants, themes
   │   ├── data/                   # Data sources, repositories
   │   ├── domain/                 # Entities, use cases (business logic)
   │   ├── presentation/           # UI layer (widgets, screens, blocs)
   │   │   ├── app/                # App entry, routes, main bloc observer
   │   │   ├── home/               # Home screen
   │   │   ├── scan/               # NFC scanning + manual token entry
   │   │   ├── video/              # Video player & watch history
   │   │   └── profile/            # User profile management
   │   └── main.dart               # Application entry point
   ├── 📦 packages/                 # Reusable packages (mini-libraries)
   │   ├── authentication_repository/
   │   ├── cache/
   │   ├── form_inputs/
   │   └── storage_repository/
   ├── 🧪 test/                     # Unit & widget tests
   └── 📜 pubspec.yaml              # Flutter dependencies & assets config


---

## How to Use the App

1. **Install the App:** Download it from the app store (once published) or get a test version from the developer.
2. **Open and Log In:** Launch the app, create an account or sign in with Google.
3. **Scan or Enter:** Tap an NFC tag or type a code to play a video.
4. **Explore:** Check your history or edit your profile via the menu.

The app asks for permissions like camera (for video upload) or NFC (for scanning)—grant them when prompted.

---

## Error Handling

Common issues:
- "No video found": The token isn't in Firestore—check manual uploads.
- Login problems: Reset password via Firebase email.
- Slow videos: Ensure files aren't too large; use the app's upload for compression.

---

## Quickstart for Developers (Optional)

If someone with coding skills wants to work on this:

1. Install Flutter: Follow [this guide](https://docs.flutter.dev/get-started/install).
2. Clone the repo: `git clone <repo-url>` then `cd tag_play`.
3. Get dependencies: `flutter pub get`.
4. Set up Firebase: Add your config files (google-services.json for Android, GoogleService-Info.plist for iOS).
5. Run: `flutter run`.
6. For packages: Each has its own pubspec.yaml with tools like `firebase_auth` for logins.

---

## For More Information

- Check package READMEs for details.
- Firebase docs: [firebase.google.com/docs](https://firebase.google.com/docs) (start with overviews).
- If stuck, contact the maintainer with specifics.

This covers everything—from basics to manual processes. If you follow these steps, you shouldn't need more questions!
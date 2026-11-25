# 🔐 GitHub Secrets Setup Guide for Android App Signing

To build a signed release APK or App Bundle in GitHub Actions, add these **4 Repository Secrets** to your GitHub repository.

---

## 📌 Step 1: Open GitHub Secrets Settings
1. Open your repository on GitHub.
2. Navigate to **Settings** (tab at the top of the repo).
3. In the left sidebar, click **Secrets and variables** ➡️ **Actions**.
4. Click the green button: **New repository secret**.

---

## 🔑 Step 2: Add the 4 Required Secrets
### 1. `KEYSTORE_BASE64`
The full binary content of your `.jks` or `.keystore` file encoded as a Base64 string.

* **On Windows (PowerShell):**
  ```powershell
  [Convert]::ToBase64String([IO.File]::ReadAllBytes("path\to\your-keystore.jks")) | Set-Clipboard
  ```
  *(The base64 string is now in your clipboard! Paste it directly into the Secret value).*

* **On macOS / Linux (Terminal):**
  ```bash
  base64 -w 0 path/to/your-keystore.jks | pbcopy
  # or:
  base64 -w 0 path/to/your-keystore.jks
  ```

---

### 2. `KEYSTORE_PASSWORD`
The master password used to protect your keystore file.

---

### 3. `KEY_ALIAS`
The alias name given to your key when you generated it (e.g. `upload` or `key0`).

---

### 4. `KEY_PASSWORD`
The private key password (often identical to the keystore password).

---

## 🛠️ Step 3: Ensure your `android/app/build.gradle` reads `key.properties`
Make sure your `android/app/build.gradle` (or `build.gradle.kts`) configures release signing from `key.properties`:

```groovy
def keystoreProperties = new Properties()
def keystorePropertiesFile = rootProject.file('key.properties')
if (keystorePropertiesFile.exists()) {
    keystoreProperties.load(new FileInputStream(keystorePropertiesFile))
}

android {
    ...
    signingConfigs {
        release {
            keyAlias = keystoreProperties['keyAlias']
            keyPassword = keystoreProperties['keyPassword']
            storeFile = keystoreProperties['storeFile'] ? file(keystoreProperties['storeFile']) : null
            storePassword = keystoreProperties['storePassword']
        }
    }
    buildTypes {
        release {
            signingConfig = signingConfigs.release
            ...
        }
    }
}
```

> 💡 **Security Tip:** Ensure that `key.properties` and `*.jks` are listed in your `.gitignore` so private keys are never committed to your public/private repo!

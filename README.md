# eazyTravel

Flutter mobile application for **public transport ticket search and digital ticket management**, developed as a semester project for the **Human–Computer Interaction (HCI)** course at **NTUA ECE**.

The project focuses on building a simple, intuitive transportation experience while integrating mobile-device capabilities such as **QR/barcode scanning, NFC and OCR**.

## Contributors

**Nikolaos Kassaris**

**Kontsantinos Vougias**


## Overview

eazyTravel allows users to:

* Search for a trip using departure, destination and date
* View and select available route options
* Book and store electronic tickets
* Access purchased tickets from a dedicated screen
* Scan QR codes and barcodes
* Interact with NFC/NDEF tags
* Capture and recognize text using the device camera
* Manage permissions and application settings

The application was built as an **HCI-oriented prototype**, with emphasis on usability, navigation, feedback and interaction with physical transportation infrastructure.

## Tech Stack

* **Flutter**
* **Dart**
* **Material Design**
* **Google ML Kit Text Recognition**
* **Camera API**
* **NFC / NDEF**
* **QR & Barcode Scanning**
* **Notification Permissions**

## Main Features

### Trip Search

Users enter:

* departure
* destination
* travel date

The application validates the input and presents available trip alternatives.

### Ticket Booking

Users can select a route and create a digital ticket containing the selected journey information.

Tickets are available through the **My Tickets** section.

### QR & Barcode Scanning

Camera-based scanning is supported through:

* `qr_code_scanner`
* `flutter_barcode_scanner`

This functionality demonstrates how the application could interact with station or ticket identifiers.

### NFC

The project supports interaction with compatible **NDEF NFC tags** using Flutter NFC plugins.

The prototype includes NFC discovery and read/write functionality.

### Camera & OCR

The application uses:

* `camera`
* `google_mlkit_text_recognition`

to capture images and extract text through OCR.

This demonstrates an alternative input method for information available in the user's physical environment.

## HCI Focus

The application was designed around common usability principles such as:

* clear navigation
* visible system feedback
* form validation
* prevention of invalid actions
* familiar Material Design components
* recognition rather than recall
* interaction through multiple input methods

The project explores interaction across three layers:

```text
User
  ↓
Flutter Mobile Interface
  ↓
Camera / QR / NFC / OCR
  ↓
Physical Transport Environment
```

## Architecture

The project uses a lightweight Flutter architecture based primarily on:

* `StatefulWidget`
* `setState()`
* `Navigator`
* local domain models

Core models include:

```dart
class Trip {
  String departure;
  String destination;
  String date;
}
```

and:

```dart
class Ticket extends Trip {
  String info;
}
```

The architecture intentionally remains simple because the project is an academic prototype focused primarily on interaction design and mobile functionality.

## Project Structure

```text
lib/
├── main.dart       # Main application, search flow, QR/barcode scanning
├── page.dart       # Available trips and booking flow
├── page2.dart      # Navigation, settings and permissions
├── page3.dart      # My Tickets
├── camera.dart     # Camera and OCR
├── nfc.dart        # NFC/NDEF functionality
└── TOSpage.dart    # Terms of Service interaction
```

## Key Dependencies

```yaml
camera
google_mlkit_text_recognition
nfc_manager
flutter_nfc_kit
qr_code_scanner
flutter_barcode_scanner
notification_permissions
intl
```

## Getting Started

Clone the repository:

```bash
git clone https://github.com/Kassaris/flutter-eazytravel-hci-ntua.git
cd flutter-eazytravel-hci-ntua
```

Install dependencies:

```bash
flutter pub get
```

##Installation
Prerequisites

Before running the project, install:

Flutter SDK
Dart SDK
Android Studio and/or Visual Studio Code
Android SDK for Android development
Xcode for iOS development on macOS
Git

Because this is an older academic Flutter project, the repository's pubspec.yaml specifies the Dart SDK constraint:

sdk: '>=2.19.2 <3.0.0'

Therefore, running the project with a substantially newer Flutter/Dart toolchain may require dependency and source-code updates.

Clone the Repository
git clone https://github.com/Kassaris/flutter-eazytravel-hci-ntua.git

Move into the project:

cd flutter-eazytravel-hci-ntua
Install Dependencies

Run:

flutter pub get

To inspect the environment:

flutter doctor

Resolve any Android/iOS SDK issues reported by Flutter before continuing.

## Running the Application

Connect a physical device or start an emulator.

Check available devices:

flutter devices

Then run:

flutter run

For a specific device:

flutter run -d <device-id>

## Hardware Requirements

Some features require a physical device:

* **Camera** for QR/barcode scanning and OCR
* **NFC-enabled device** for NFC interactions

Emulators may not fully support these capabilities.

## Current Limitations

This repository is an academic prototype and does not currently include:

* a live public-transport API
* real payment processing
* user authentication
* persistent ticket storage
* production-grade backend infrastructure

Available trip options are demonstration data rather than live transport information.

## Possible Improvements

Future development could include:

* integration with a real public-transport API
* persistent local or cloud storage
* user authentication
* secure payment processing
* real-time journey updates
* digital QR ticket generation
* maps and route visualization
* improved accessibility
* modern state management such as Riverpod or BLoC
* automated unit, widget and integration testing

## Academic Context

Developed for the **Human–Computer Interaction course at the National Technical University of Athens — School of Electrical and Computer Engineering**.

The project combines conventional mobile UI design with hardware-based interactions to explore how users can search, obtain and manage public-transport tickets through a single mobile application.

## Disclaimer

eazyTravel is an **educational prototype** and is not connected to an official transportation provider.

It should not be used for real ticket purchases, payments or ticket validation.

---

**Built with Flutter & Dart — HCI Semester Project, NTUA ECE**

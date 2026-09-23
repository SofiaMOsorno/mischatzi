# Mi Schatzi

**Mi Schatzi** is a personal mobile application built with **Flutter** and **Firebase**, designed as a private space for two users to share messages, language lessons, affectionate interactions, and future plans.

The project is being developed with **scalability and customization in mind**, allowing its architecture and features to evolve over time.

## Features

### Home — Shared Board

### 🇩🇪 Phrases & Lessons

**Phrases**

**Lessons**

### Kisses & Hugs

### Bucket List

## Customization

The application supports:

- Normal theme with a soft and light color palette.
- 🇩🇪 German-inspired theme.
- 🇲🇽 Mexican-inspired theme.
- 🇬🇧 English
- 🇪🇸 Spanish
- 🇩🇪 German

## Notifications

The main features are designed to notify the other user when relevant changes or interactions occur.

Notifications are handled through a dedicated notification service, keeping this functionality separated from the application UI and business logic.

## Architecture

The project follows a modular structure separating screens, reusable widgets, providers, services, models, configuration, and utilities.

```text
lib/
├── main.dart
├── config/
│   ├── firebase_config.dart
│   └── routes.dart
├── models/
│   ├── user_model.dart
│   └── app_state.dart
├── providers/
│   ├── theme_provider.dart
│   ├── language_provider.dart
│   └── user_provider.dart
├── widgets/
│   ├── custom_modal.dart
│   ├── bottom_navigation_bar.dart
│   └── top_app_bar.dart
├── screens/
│   ├── user_selection_screen.dart
│   ├── home_screen.dart
│   ├── phrases_screen.dart
│   ├── kisses_screen.dart
│   └── bucket_list_screen.dart
├── services/
│   ├── database_service.dart
│   └── notification_service.dart
├── utils/
│   ├── app_colors.dart
│   ├── app_themes.dart
│   └── app_localization.dart
└── assets/
    ├── fonts/
    └── images/

# Mi Schatzi

**Mi Schatzi** is a personal mobile application built with **Flutter** and **Firebase**, designed as a private space for two users to share messages, language lessons, affectionate interactions, and future plans.

The project is being developed with **scalability and customization in mind**, allowing its architecture and features to evolve over time.

## Features

### Home — Shared Board

A real-time shared board where both users can:

- Create, edit, and delete messages.
- See changes in real time.
- See who created each message.
- Receive notifications when the board is updated.

### 🇩🇪 Phrases & Lessons

A shared language-learning section containing:

**Phrases**
- Spanish, English, and German entries.
- Create, edit, and delete phrases.
- Real-time synchronization.

**Lessons**
- Title and content.
- Create, edit, and delete lessons.
- Scrollable list.

Changes to these sections notify the other user.

### Kisses & Hugs

A real-time counter for two types of interactions:

- Kisses
- Hugs

Users can add or subtract custom quantities. Confirmed interactions update the shared counter and notify the other user.

### Bucket List

A shared list of things to do together.

- Create, edit, and delete items.
- Mark completed items with strikethrough.
- Real-time synchronization.
- Copy the entire list in a WhatsApp-friendly numbered format.
- Notifications for relevant list changes.

## Customization

The application supports:

- Normal theme with a soft and light color palette.
- 🇩🇪 German-inspired theme.
- 🇲🇽 Mexican-inspired theme.
- 🇬🇧 English
- 🇪🇸 Spanish
- 🇩🇪 German

User preferences are persisted so they can be maintained between sessions.

The application also uses a custom background image, logo, and Google Font.

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

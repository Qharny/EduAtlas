# Localization Setup for EduAtlas

This document explains how to use the localization system that has been added to your Flutter app.

## What's Been Added

1. **Dependencies**: Added `flutter_localizations` and `intl` packages to `pubspec.yaml`
2. **Localization Files**: Created ARB files for English, Spanish, and French
3. **Localization Delegate**: Created `AppLocalizations` class to handle translations
4. **Language Provider**: Created `LanguageProvider` to manage language state
5. **Language Switcher**: Created a widget to switch between languages
6. **Settings Screen**: Created a settings screen with language and theme options

## How to Use

### 1. Install Dependencies

Run this command to install the new packages:

```bash
flutter pub get
```

### 2. Using Localized Strings

In any widget, you can access localized strings like this:

```dart
import 'package:eduatlas/l10n/app_localizations.dart';

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    
    return Text(l10n.welcome); // This will show "Welcome", "Bienvenido", or "Bienvenue"
  }
}
```

### 3. Adding the Language Switcher

You can add the language switcher to any app bar:

```dart
AppBar(
  title: Text('My Screen'),
  actions: [
    LanguageSwitcher(), // Add this line
  ],
)
```

### 4. Accessing Language Provider

To access or change the language programmatically:

```dart
import 'package:provider/provider.dart';
import 'package:eduatlas/provider/language_provider.dart';

// In a Consumer widget
Consumer<LanguageProvider>(
  builder: (context, languageProvider, child) {
    return Text('Current language: ${languageProvider.locale.languageCode}');
  },
)

// Or change language
context.read<LanguageProvider>().changeLanguage('es');
```

## Supported Languages

- **English (en)**: Default language
- **Spanish (es)**: Español
- **French (fr)**: Français

## Adding New Languages

1. Create a new ARB file in `lib/l10n/` (e.g., `app_de.arb` for German)
2. Add the language code to `AppLocalizations.supportedLocales`
3. Add the language to `LanguageProvider.getSupportedLanguages()`
4. Add the language to `_localizedValues` in `AppLocalizations`

## Adding New Strings

1. Add the string to all ARB files (`app_en.arb`, `app_es.arb`, `app_fr.arb`)
2. Add a getter in `AppLocalizations` class
3. Add the string to `_localizedValues` map for all languages

## Example: Adding a New String

1. Add to `lib/l10n/app_en.arb`:

```json
{
  "newString": "New String"
}
```

2. Add to `lib/l10n/app_es.arb`:

```json
{
  "newString": "Nueva Cadena"
}
```

3. Add to `lib/l10n/app_fr.arb`:

```json
{
  "newString": "Nouvelle Chaîne"
}
```

4. Add getter in `lib/l10n/app_localizations.dart`:

```dart
String get newString => _localizedValues[locale.languageCode]!['newString']!;
```

5. Add to `_localizedValues` map for all languages.

## Integration with Existing Screens

To integrate localization with your existing screens:

1. **Splash Screen**: Replace hardcoded text with localized strings
2. **Onboarding**: Use localized strings for all text
3. **Home Screen**: Replace hardcoded strings with localized versions
4. **Settings**: The language switcher is already integrated

## Troubleshooting

- **Linter Errors**: Make sure to run `flutter pub get` after updating dependencies
- **Strings Not Showing**: Check that the string exists in all ARB files
- **Language Not Changing**: Ensure the LanguageProvider is properly set up in main.dart

## Next Steps

1. Run `flutter pub get` to install dependencies
2. Test the language switcher in the settings screen
3. Gradually replace hardcoded strings in your existing screens
4. Add more languages as needed
5. Add more localized strings as your app grows

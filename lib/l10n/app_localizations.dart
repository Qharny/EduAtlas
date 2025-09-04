import 'package:flutter/material.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = [
    delegate,
  ];

  static const List<Locale> supportedLocales = [
    Locale('en'), // English
    Locale('es'), // Spanish
    Locale('fr'), // French
  ];

  static Locale? localeResolutionCallback(
    Locale? locale,
    Iterable<Locale> supportedLocales,
  ) {
    for (Locale supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale?.languageCode) {
        return supportedLocale;
      }
    }
    return supportedLocales.first;
  }

  // Localized strings
  String get appTitle => _localizedValues[locale.languageCode]!['appTitle']!;
  String get welcome => _localizedValues[locale.languageCode]!['welcome']!;
  String get settings => _localizedValues[locale.languageCode]!['settings']!;
  String get language => _localizedValues[locale.languageCode]!['language']!;
  String get theme => _localizedValues[locale.languageCode]!['theme']!;
  String get darkMode => _localizedValues[locale.languageCode]!['darkMode']!;
  String get lightMode => _localizedValues[locale.languageCode]!['lightMode']!;
  String get systemDefault =>
      _localizedValues[locale.languageCode]!['systemDefault']!;

  static final Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'appTitle': 'EduAtlas',
      'welcome': 'Welcome',
      'settings': 'Settings',
      'language': 'Language',
      'theme': 'Theme',
      'darkMode': 'Dark Mode',
      'lightMode': 'Light Mode',
      'systemDefault': 'System Default',
    },
    'es': {
      'appTitle': 'EduAtlas',
      'welcome': 'Bienvenido',
      'settings': 'Configuración',
      'language': 'Idioma',
      'theme': 'Tema',
      'darkMode': 'Modo Oscuro',
      'lightMode': 'Modo Claro',
      'systemDefault': 'Predeterminado del Sistema',
    },
    'fr': {
      'appTitle': 'EduAtlas',
      'welcome': 'Bienvenue',
      'settings': 'Paramètres',
      'language': 'Langue',
      'theme': 'Thème',
      'darkMode': 'Mode Sombre',
      'lightMode': 'Mode Clair',
      'systemDefault': 'Par Défaut du Système',
    },
  };
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'es', 'fr'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

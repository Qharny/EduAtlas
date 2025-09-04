import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Theme/theme.dart';
import '../l10n/app_localizations.dart';
import '../provider/language_provider.dart';
import '../widgets/language_switcher.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.settings),
        actions: const [
          LanguageSwitcher(),
        ],
      ),
      body: Consumer2<ThemeProvider, LanguageProvider>(
        builder: (context, themeProvider, languageProvider, child) {
          return ListView(
            children: [
              ListTile(
                leading: const Icon(Icons.language),
                title: Text(l10n.language),
                subtitle: Text(languageProvider.getLanguageName(
                  languageProvider.locale.languageCode,
                )),
                trailing: const LanguageSwitcher(),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.palette),
                title: Text(l10n.theme),
                subtitle: Text(_getThemeModeText(themeProvider.themeMode, l10n)),
                onTap: () => _showThemeDialog(context, themeProvider, l10n),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.info),
                title: const Text('About'),
                onTap: () {
                  // Navigate to about screen
                },
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.help),
                title: const Text('Help'),
                onTap: () {
                  // Navigate to help screen
                },
              ),
            ],
          );
        },
      ),
    );
  }

  String _getThemeModeText(ThemeMode themeMode, AppLocalizations l10n) {
    switch (themeMode) {
      case ThemeMode.light:
        return l10n.lightMode;
      case ThemeMode.dark:
        return l10n.darkMode;
      case ThemeMode.system:
        return l10n.systemDefault;
    }
  }

  void _showThemeDialog(
    BuildContext context,
    ThemeProvider themeProvider,
    AppLocalizations l10n,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(l10n.theme),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RadioListTile<ThemeMode>(
                title: Text(l10n.lightMode),
                value: ThemeMode.light,
                groupValue: themeProvider.themeMode,
                onChanged: (ThemeMode? value) {
                  themeProvider.toggleTheme(false);
                  Navigator.of(context).pop();
                },
              ),
              RadioListTile<ThemeMode>(
                title: Text(l10n.darkMode),
                value: ThemeMode.dark,
                groupValue: themeProvider.themeMode,
                onChanged: (ThemeMode? value) {
                  themeProvider.toggleTheme(true);
                  Navigator.of(context).pop();
                },
              ),
              RadioListTile<ThemeMode>(
                title: Text(l10n.systemDefault),
                value: ThemeMode.system,
                groupValue: themeProvider.themeMode,
                onChanged: (ThemeMode? value) {
                  // For system mode, we'll use light theme as default
                  themeProvider.toggleTheme(false);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }
} 
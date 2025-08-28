import 'package:eduatlas/Theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/settings/settings_list_item.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String _selectedLanguage = 'English';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings'), elevation: 0),
      body: ListView(
        children: [
          Consumer<ThemeProvider>(
            builder: (context, themeProvider, child) {
              return SwitchListTile(
                title: const Text('Dark Mode'),
                subtitle: const Text('Toggle between light and dark themes'),
                value: themeProvider.isDarkMode,
                onChanged: (bool value) {
                  themeProvider.toggleTheme(value);
                },
                secondary: Icon(
                  themeProvider.isDarkMode ? Icons.dark_mode : Icons.light_mode,
                  color: Theme.of(context).primaryColor,
                ),
              );
            },
          ),
          const Divider(),
          SettingsListItem(
            icon: Icons.language,
            title: 'Language',
            subtitle: _selectedLanguage,
            onTap: _showLanguageDialog,
          ),
          SettingsListItem(
            icon: Icons.info_outline,
            title: 'About',
            onTap: _showAboutDialog,
          ),
          SettingsListItem(
            icon: Icons.privacy_tip_outlined,
            title: 'Privacy Policy',
            onTap: _showPrivacyPolicy,
            showDivider: false,
          ),
        ],
      ),
    );
  }

  void _showLanguageDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Language'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildLanguageOption('English', 'English'),
              _buildLanguageOption('Spanish', 'Español'),
              _buildLanguageOption('French', 'Français'),
            ],
          ),
        );
      },
    );
  }

  Widget _buildLanguageOption(String language, String displayName) {
    return ListTile(
      title: Text(displayName),
      trailing: _selectedLanguage == language
          ? Icon(Icons.check, color: Theme.of(context).primaryColor)
          : null,
      onTap: () {
        setState(() {
          _selectedLanguage = language;
        });
        Navigator.pop(context);
      },
    );
  }

  void _showAboutDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('About EduAtlas'),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Version: 1.0.0'),
              SizedBox(height: 8),
              Text('EduAtlas is your global gateway to higher education.'),
              SizedBox(height: 8),
              Text(
                'Discover universities from around the world and make informed decisions about your academic future.',
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  void _showPrivacyPolicy() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Privacy Policy'),
          content: const SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Privacy Policy for EduAtlas'),
                SizedBox(height: 16),
                Text(
                  'This app collects minimal data necessary for functionality:',
                ),
                SizedBox(height: 8),
                Text('• Search queries for university information'),
                Text('• App preferences (theme, language)'),
                Text('• Onboarding completion status'),
                SizedBox(height: 16),
                Text(
                  'No personal information is collected or shared with third parties.',
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}

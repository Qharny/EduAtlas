import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/language_provider.dart';

class LanguageSwitcher extends StatelessWidget {
  const LanguageSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageProvider>(
      builder: (context, languageProvider, child) {
        return PopupMenuButton<String>(
          icon: const Icon(Icons.language),
          onSelected: (String languageCode) {
            languageProvider.changeLanguage(languageCode);
          },
          itemBuilder: (BuildContext context) {
            return languageProvider.getSupportedLanguages().map((language) {
              return PopupMenuItem<String>(
                value: language['code']!,
                child: Row(
                  children: [
                    Text(
                      language['native']!,
                      style: TextStyle(
                        fontWeight:
                            languageProvider.locale.languageCode ==
                                language['code']
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                    if (languageProvider.locale.languageCode ==
                        language['code'])
                      const Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Icon(Icons.check, size: 16),
                      ),
                  ],
                ),
              );
            }).toList();
          },
        );
      },
    );
  }
}

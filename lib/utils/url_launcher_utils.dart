import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

import '../screens/web_view_screen.dart';
import '../widgets/common/custom_snackbar.dart';

class UrlLauncherUtils {
  static Future<void> openUniversityLink(
    BuildContext context,
    String urlString,
  ) async {
    try {
      String cleanUrl = urlString.trim();
      if (!cleanUrl.startsWith('http://') && !cleanUrl.startsWith('https://')) {
        cleanUrl = 'https://$cleanUrl';
      }

      // Navigate to in-app web view
      if (context.mounted) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => WebViewScreen(
              url: cleanUrl,
              title: _extractDomainName(cleanUrl),
            ),
          ),
        );
      }
    } catch (e) {
      // Fallback to external browser if in-app web view fails
      try {
        final Uri url = Uri.parse(urlString);
        await launchUrl(url, mode: LaunchMode.externalApplication);
      } catch (fallbackError) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Row(
                children: [
                  Icon(Icons.link_off, color: Colors.white),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Unable to open link. Please check your connection.',
                    ),
                  ),
                ],
              ),
              backgroundColor: Colors.orange.shade600,
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              margin: const EdgeInsets.all(16),
              action: SnackBarAction(
                label: 'Copy URL',
                textColor: Colors.white,
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: urlString));
                  CustomSnackBar.showSuccess(
                    context,
                    'URL copied to clipboard',
                  );
                },
              ),
            ),
          );
        }
      }
    }
  }

  static String _extractDomainName(String url) {
    try {
      final uri = Uri.parse(url);
      String domain = uri.host;
      if (domain.startsWith('www.')) {
        domain = domain.substring(4);
      }
      return domain;
    } catch (e) {
      return 'Website';
    }
  }
}

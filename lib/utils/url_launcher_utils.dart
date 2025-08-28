import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

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

      final Uri url = Uri.parse(cleanUrl);

      try {
        final bool launched = await launchUrl(
          url,
          mode: LaunchMode.externalApplication,
        );
        if (!launched) {
          throw 'Launch returned false';
        }
      } catch (e) {
        try {
          await launchUrl(url, mode: LaunchMode.inAppBrowserView);
        } catch (e2) {
          await launchUrl(url);
        }
      }
    } catch (e) {
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
                CustomSnackBar.showSuccess(context, 'URL copied to clipboard');
              },
            ),
          ),
        );
      }
    }
  }
}

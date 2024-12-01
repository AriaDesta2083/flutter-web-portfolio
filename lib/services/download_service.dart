import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DownloadProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> downloadCV(BuildContext context) async {
    try {
      _isLoading = true;
      notifyListeners();

      await Future.delayed(const Duration(seconds: 1));
      // URL relative to assets
      const String fileUrl = 'assets/assets/docs/cv_ariadestaprabu.pdf';

      // Launch URL to download the file
      final Uri uri = Uri.base.resolve(fileUrl);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      } else {
        throw Exception('Could not launch $uri');
      }

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to download file: $e')),
      );
    }
  }
}

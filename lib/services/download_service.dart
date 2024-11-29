// file: providers/download_provider.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'dart:io';

class DownloadProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> downloadCV(BuildContext context) async {
    try {
      _isLoading = true;
      notifyListeners();

      await Future.delayed(const Duration(seconds: 2));

      // Load PDF file from assets
      final ByteData data = await rootBundle.load('docs/cv_ariadestap.pdf');
      final bytes = data.buffer.asUint8List();

      // Get temporary directory
      final tempDir = await getTemporaryDirectory();
      final tempPath = tempDir.path;
      final filePath = '$tempPath/cv_ariadestap.pdf';

      // Write to temporary file
      final file = File(filePath);
      await file.writeAsBytes(bytes);

      // Share the file
      await Share.shareXFiles(
        [XFile(filePath)],
        subject: 'My CV',
      );

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      notifyListeners();
    }
  }
}
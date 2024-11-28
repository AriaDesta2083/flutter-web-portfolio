import 'package:url_launcher/url_launcher.dart';

Future<void> iconLaunchURL(String urlString) async {
  final Uri url = Uri.parse(urlString);
  try {
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.platformDefault);
    }
  } catch (e) {
    print('Tidak dapat membuka URL: $e');
  }
}

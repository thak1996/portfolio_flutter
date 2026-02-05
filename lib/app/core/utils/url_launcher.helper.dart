import 'package:url_launcher/url_launcher.dart';

Future<void> openUrl(String url) async {
  final trimmed = url.trim();
  if (trimmed.isEmpty || trimmed == '#') {
    return;
  }

  final uri = Uri.parse(trimmed);
  await launchUrl(uri, mode: LaunchMode.platformDefault);
}

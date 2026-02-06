import 'dart:async';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ContactService {
  Future<bool> postWebhook(Map<String, dynamic> data) async {
    try {
      // Tenta pegar a URL do env, se falhar usa a sua URL como fallback
      final String url = dotenv.env['WEB_HOOK'] ??
          'https://n8n.franklyndev.com.br/webhook/contato';

      final response = await http
          .post(
            Uri.parse(url),
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode(data),
          )
          .timeout(const Duration(seconds: 10));
      return response.statusCode >= 200 && response.statusCode < 300;
    } on TimeoutException catch (_) {
      return false;
    } on Exception {
      return false;
    }
  }
}

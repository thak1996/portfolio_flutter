import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ContactService {
  Future<bool> postWebhook(Map<String, dynamic> data) async {
    final response = await http.post(
      Uri.parse(dotenv.env['WEB_HOOK'] ?? ''),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(data),
    );
    return response.statusCode == 200 || response.statusCode == 204;
  }
}

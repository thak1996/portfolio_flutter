import 'package:http/http.dart' as http;
import 'dart:convert';

class ContactService {
  Future<bool> postWebhook(Map<String, dynamic> data) async {
    final response = await http.post(
      Uri.parse('SUA_URL_WEBHOOK'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(data),
    );
    return response.statusCode == 200 || response.statusCode == 204;
  }
}
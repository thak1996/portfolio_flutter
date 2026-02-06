import '../../core/service/contact.service.dart';
import 'package:flutter/material.dart';

class ContactController extends ChangeNotifier {
  final ContactService _service = ContactService();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<bool> send(
    String name,
    String email,
    String subject,
    String message,
  ) async {
    _isLoading = true;
    notifyListeners();

    final success = await _service.postWebhook({
      "name": name,
      "email": email,
      "subject": subject,
      "message": message,
    });

    _isLoading = false;
    notifyListeners();
    return success;
  }
}

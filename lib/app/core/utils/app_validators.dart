import 'package:portfolio_flutter/l10n/app_localizations.dart';

class AppValidators {
  static String? validateRequired(String? value, AppLocalizations l10n) {
    if (value == null || value.trim().isEmpty) return l10n.errorRequired;
    return null;
  }

  static String? validateEmail(String? value, AppLocalizations l10n) {
    if (value == null || value.trim().isEmpty) return l10n.errorRequired;
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) return l10n.errorInvalidEmail;
    return null;
  }

  static String? validatePhone(String? value, AppLocalizations l10n) {
    if (value == null || value.trim().isEmpty) return l10n.errorRequired;
    final numbers = value.replaceAll(RegExp(r'[^0-9]'), '');
    if (numbers.length < 10) return l10n.errorInvalidPhone;
    return null;
  }
}

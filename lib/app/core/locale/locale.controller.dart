import 'package:flutter/material.dart';
import '../utils/app_lang.helper.dart';

class LocaleController extends ChangeNotifier {
  AppLang _lang = AppLang.pt;
  AppLang get lang => _lang;

  Locale get locale => _lang == AppLang.en //
      ? const Locale('en')
      : const Locale('pt');

  void setLang(AppLang value) {
    if (_lang == value) return;
    _lang = value;
    notifyListeners();
  }

  void toggle() => setLang(_lang == AppLang.pt ? AppLang.en : AppLang.pt);
}

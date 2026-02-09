enum AppLang { pt, en }

extension AppLangExtension on AppLang {
  String get code => name;
}

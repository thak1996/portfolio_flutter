import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_pt.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('pt')
  ];

  /// No description provided for @sectionAbout.
  ///
  /// In pt, this message translates to:
  /// **'Sobre'**
  String get sectionAbout;

  /// No description provided for @heroTagline.
  ///
  /// In pt, this message translates to:
  /// **'Criando Soluções Digitais com '**
  String get heroTagline;

  /// No description provided for @heroTaglineHighlight.
  ///
  /// In pt, this message translates to:
  /// **'Precisão.'**
  String get heroTaglineHighlight;

  /// No description provided for @heroDescription.
  ///
  /// In pt, this message translates to:
  /// **'Desenvolvedor Mobile com foco em Flutter, atuando na construção de aplicações Android e iOS com uso de Dart, Firebase e arquitetura limpa.'**
  String get heroDescription;

  /// No description provided for @heroCtaProjects.
  ///
  /// In pt, this message translates to:
  /// **'Ver Projetos'**
  String get heroCtaProjects;

  /// No description provided for @heroCtaContact.
  ///
  /// In pt, this message translates to:
  /// **'Contato'**
  String get heroCtaContact;

  /// No description provided for @experienceTitle.
  ///
  /// In pt, this message translates to:
  /// **'Experiência'**
  String get experienceTitle;

  /// No description provided for @expJob1Role.
  ///
  /// In pt, this message translates to:
  /// **'Desenvolvedor Full Stack'**
  String get expJob1Role;

  /// No description provided for @expJob1Stack.
  ///
  /// In pt, this message translates to:
  /// **'Modernização e Infraestrutura'**
  String get expJob1Stack;

  /// No description provided for @expJob1Company.
  ///
  /// In pt, this message translates to:
  /// **'FDS Logística e Terceirização'**
  String get expJob1Company;

  /// No description provided for @expJob1Period.
  ///
  /// In pt, this message translates to:
  /// **'jul de 2025 - até o momento'**
  String get expJob1Period;

  /// No description provided for @expJob1Location.
  ///
  /// In pt, this message translates to:
  /// **'Remoto'**
  String get expJob1Location;

  /// No description provided for @expJob1Points.
  ///
  /// In pt, this message translates to:
  /// **'Reformulação completa de interface (UI/UX) visando a modernização e responsividade|Implementação e migração de sistema utilizando PHP Laravel e Filament PHP|Configuração e deploy de ambiente de produção em servidor VPS|Gestão de infraestrutura de rede e zonas DNS|Administração e migração de serviços de e-mail corporativo'**
  String get expJob1Points;

  /// No description provided for @expJob1Skills.
  ///
  /// In pt, this message translates to:
  /// **'PHP Laravel|Filament PHP|Administração de Servidores (VPS)|DNS & Domínios|UI/UX Design'**
  String get expJob1Skills;

  /// No description provided for @expJob2Role.
  ///
  /// In pt, this message translates to:
  /// **'Desenvolvedor de Software'**
  String get expJob2Role;

  /// No description provided for @expJob2Stack.
  ///
  /// In pt, this message translates to:
  /// **'Automação & Integração'**
  String get expJob2Stack;

  /// No description provided for @expJob2Company.
  ///
  /// In pt, this message translates to:
  /// **'Autônomo'**
  String get expJob2Company;

  /// No description provided for @expJob2Period.
  ///
  /// In pt, this message translates to:
  /// **'set de 2025 - dez de 2025'**
  String get expJob2Period;

  /// No description provided for @expJob2Location.
  ///
  /// In pt, this message translates to:
  /// **'Remoto'**
  String get expJob2Location;

  /// No description provided for @expJob2Points.
  ///
  /// In pt, this message translates to:
  /// **'Desenvolvimento de integrações para captura de formulários web|Criação de automações utilizando Google Apps Script|Integração entre sistemas via Google Sheets'**
  String get expJob2Points;

  /// No description provided for @expJob2Skills.
  ///
  /// In pt, this message translates to:
  /// **'Google Apps Script|WebHooks|Google Sheets|Integrações de APIs|JavaScript|JSON|Automação de Processos'**
  String get expJob2Skills;

  /// No description provided for @expJob3Role.
  ///
  /// In pt, this message translates to:
  /// **'Desenvolvedor Mobile Flutter'**
  String get expJob3Role;

  /// No description provided for @expJob3Stack.
  ///
  /// In pt, this message translates to:
  /// **'Projeto Pontual'**
  String get expJob3Stack;

  /// No description provided for @expJob3Company.
  ///
  /// In pt, this message translates to:
  /// **'Autônomo'**
  String get expJob3Company;

  /// No description provided for @expJob3Period.
  ///
  /// In pt, this message translates to:
  /// **'Mai de 2025'**
  String get expJob3Period;

  /// No description provided for @expJob3Location.
  ///
  /// In pt, this message translates to:
  /// **'Remoto'**
  String get expJob3Location;

  /// No description provided for @expJob3Points.
  ///
  /// In pt, this message translates to:
  /// **'Implementação de Clean Architecture visando escalabilidade|Sincronização de dados entre Firebase e ObjectBox'**
  String get expJob3Points;

  /// No description provided for @expJob3Skills.
  ///
  /// In pt, this message translates to:
  /// **'Clean Architecture|ObjectBox|Firebase|Android & iOS|Dart|Flutter|Cubit'**
  String get expJob3Skills;

  /// No description provided for @expJob4Role.
  ///
  /// In pt, this message translates to:
  /// **'Desenvolvedor de Software'**
  String get expJob4Role;

  /// No description provided for @expJob4Stack.
  ///
  /// In pt, this message translates to:
  /// **'Flutter & Backend'**
  String get expJob4Stack;

  /// No description provided for @expJob4Company.
  ///
  /// In pt, this message translates to:
  /// **'Eagless'**
  String get expJob4Company;

  /// No description provided for @expJob4Period.
  ///
  /// In pt, this message translates to:
  /// **'nov de 2023 - nov de 2024'**
  String get expJob4Period;

  /// No description provided for @expJob4Location.
  ///
  /// In pt, this message translates to:
  /// **'Remoto'**
  String get expJob4Location;

  /// No description provided for @expJob4Points.
  ///
  /// In pt, this message translates to:
  /// **'Desenvolvimento de aplicações mobile e web utilizando Flutter|Criação de APIs REST com PHP Laravel para integração com apps mobile|Integração eficiente entre frontend e backend|Desenvolvimento de painéis administrativos para gestão de dados|Otimização de aplicações com foco em performance e usabilidade'**
  String get expJob4Points;

  /// No description provided for @expJob4Skills.
  ///
  /// In pt, this message translates to:
  /// **'Git/GitFlow|REST APIs|Flutter|Dart|PHP Laravel|MySQL'**
  String get expJob4Skills;

  /// No description provided for @educationTitle.
  ///
  /// In pt, this message translates to:
  /// **'Educação'**
  String get educationTitle;

  /// No description provided for @eduDegree1.
  ///
  /// In pt, this message translates to:
  /// **'Análise e Desenvolvimento de Sistemas'**
  String get eduDegree1;

  /// No description provided for @eduInst1.
  ///
  /// In pt, this message translates to:
  /// **'Uninter Centro Universitário Internacional'**
  String get eduInst1;

  /// No description provided for @eduLocation1.
  ///
  /// In pt, this message translates to:
  /// **'São Paulo, Brasil'**
  String get eduLocation1;

  /// No description provided for @eduYear1.
  ///
  /// In pt, this message translates to:
  /// **'Jan de 2026 - Fev de 2027'**
  String get eduYear1;

  /// No description provided for @eduDegree2.
  ///
  /// In pt, this message translates to:
  /// **'Desenvolvimento Mobile'**
  String get eduDegree2;

  /// No description provided for @eduInst2.
  ///
  /// In pt, this message translates to:
  /// **'Raro Academy'**
  String get eduInst2;

  /// No description provided for @eduLocation2.
  ///
  /// In pt, this message translates to:
  /// **'São Paulo, Brasil'**
  String get eduLocation2;

  /// No description provided for @eduYear2.
  ///
  /// In pt, this message translates to:
  /// **'Jul de 2023 - Nov de 2025'**
  String get eduYear2;

  /// No description provided for @eduDegree3.
  ///
  /// In pt, this message translates to:
  /// **'Flutter & Dart'**
  String get eduDegree3;

  /// No description provided for @eduInst3.
  ///
  /// In pt, this message translates to:
  /// **'Raro Academy'**
  String get eduInst3;

  /// No description provided for @eduLocation3.
  ///
  /// In pt, this message translates to:
  /// **'São Paulo, Brasil'**
  String get eduLocation3;

  /// No description provided for @eduYear3.
  ///
  /// In pt, this message translates to:
  /// **'Jul de 2022 - Set de 2022'**
  String get eduYear3;

  /// No description provided for @skillsTitle.
  ///
  /// In pt, this message translates to:
  /// **'Habilidades'**
  String get skillsTitle;

  /// No description provided for @skillSoftArchTitle.
  ///
  /// In pt, this message translates to:
  /// **'Arquitetura Limpa'**
  String get skillSoftArchTitle;

  /// No description provided for @skillSoftArchDesc.
  ///
  /// In pt, this message translates to:
  /// **'Foco em código desacoplado, testável e escalável utilizando Clean Architecture.'**
  String get skillSoftArchDesc;

  /// No description provided for @skillSoftProbTitle.
  ///
  /// In pt, this message translates to:
  /// **'Resolução de Problemas'**
  String get skillSoftProbTitle;

  /// No description provided for @skillSoftProbDesc.
  ///
  /// In pt, this message translates to:
  /// **'Habilidade em analisar problemas técnicos e implementar automações eficientes.'**
  String get skillSoftProbDesc;

  /// No description provided for @skillSoftFullTitle.
  ///
  /// In pt, this message translates to:
  /// **'Mentalidade Full Stack'**
  String get skillSoftFullTitle;

  /// No description provided for @skillSoftFullDesc.
  ///
  /// In pt, this message translates to:
  /// **'Visão holística do projeto, desde a infraestrutura VPS até a interface mobile.'**
  String get skillSoftFullDesc;

  /// No description provided for @strategicAreas.
  ///
  /// In pt, this message translates to:
  /// **'Integração de APIs REST|Gerenciamento de Estado (Cubit/Bloc)|CI/CD & Deploy Automatizado|Otimização de Performance|Gestão de Infraestrutura de Rede'**
  String get strategicAreas;

  /// No description provided for @skillTools.
  ///
  /// In pt, this message translates to:
  /// **'Git / GitFlow|Docker (Sail)|VPS & Linux (SSH)|Filament PHP|Firebase (Auth/Firestore)|Figma (UI/UX)|ObjectBox|Postman'**
  String get skillTools;

  /// No description provided for @skillHard1.
  ///
  /// In pt, this message translates to:
  /// **'Flutter & Dart'**
  String get skillHard1;

  /// No description provided for @skillHard2.
  ///
  /// In pt, this message translates to:
  /// **'PHP (Laravel)'**
  String get skillHard2;

  /// No description provided for @skillHard3.
  ///
  /// In pt, this message translates to:
  /// **'JavaScript'**
  String get skillHard3;

  /// No description provided for @skillHard4.
  ///
  /// In pt, this message translates to:
  /// **'SQL (MySQL)'**
  String get skillHard4;

  /// No description provided for @skillHard5.
  ///
  /// In pt, this message translates to:
  /// **'Google Apps Script'**
  String get skillHard5;

  /// No description provided for @projectsTitle.
  ///
  /// In pt, this message translates to:
  /// **'Projetos'**
  String get projectsTitle;

  /// No description provided for @proj1Title.
  ///
  /// In pt, this message translates to:
  /// **'FDS Logística Website'**
  String get proj1Title;

  /// No description provided for @proj1Desc.
  ///
  /// In pt, this message translates to:
  /// **'Sistema de gerenciamento de mudanças e logística com painel administrativo e dashboards de controle.'**
  String get proj1Desc;

  /// No description provided for @proj1Technologies.
  ///
  /// In pt, this message translates to:
  /// **'PHP Laravel|VPS|Domínios|UI/UX'**
  String get proj1Technologies;

  /// No description provided for @proj2Title.
  ///
  /// In pt, this message translates to:
  /// **'Brincar e Conectar App'**
  String get proj2Title;

  /// No description provided for @proj2Desc.
  ///
  /// In pt, this message translates to:
  /// **'Aplicação mobile para instituições e orfanatos, focada em conexão social.'**
  String get proj2Desc;

  /// No description provided for @proj2Technologies.
  ///
  /// In pt, this message translates to:
  /// **'Flutter|UI/UX|Dart|Bloc'**
  String get proj2Technologies;

  /// No description provided for @proj3Title.
  ///
  /// In pt, this message translates to:
  /// **'RH Manager'**
  String get proj3Title;

  /// No description provided for @proj3Desc.
  ///
  /// In pt, this message translates to:
  /// **'Gerenciador de RH construído com Laravel 10, Docker e MySQL.'**
  String get proj3Desc;

  /// No description provided for @proj3Technologies.
  ///
  /// In pt, this message translates to:
  /// **'UI/UX|PHP Laravel|MySQL|Docker'**
  String get proj3Technologies;

  /// No description provided for @contactTitle.
  ///
  /// In pt, this message translates to:
  /// **'Contato'**
  String get contactTitle;

  /// No description provided for @contactSubtitle.
  ///
  /// In pt, this message translates to:
  /// **'Vamos discutir seu próximo projeto'**
  String get contactSubtitle;

  /// No description provided for @contactHeading.
  ///
  /// In pt, this message translates to:
  /// **'Entre em Contato'**
  String get contactHeading;

  /// No description provided for @contactDesc.
  ///
  /// In pt, this message translates to:
  /// **'Estou disponível para trabalhos freelancer ou posições de tempo integral. Sinta-se livre para entrar em contato.'**
  String get contactDesc;

  /// No description provided for @contactLabelName.
  ///
  /// In pt, this message translates to:
  /// **'Seu Nome'**
  String get contactLabelName;

  /// No description provided for @contactHintName.
  ///
  /// In pt, this message translates to:
  /// **'Digite seu nome completo'**
  String get contactHintName;

  /// No description provided for @contactLabelEmail.
  ///
  /// In pt, this message translates to:
  /// **'Seu Email'**
  String get contactLabelEmail;

  /// No description provided for @contactHintEmail.
  ///
  /// In pt, this message translates to:
  /// **'Digite seu email'**
  String get contactHintEmail;

  /// No description provided for @contactLabelSubject.
  ///
  /// In pt, this message translates to:
  /// **'Assunto'**
  String get contactLabelSubject;

  /// No description provided for @contactHintSubject.
  ///
  /// In pt, this message translates to:
  /// **'Digite o assunto'**
  String get contactHintSubject;

  /// No description provided for @contactLabelPhone.
  ///
  /// In pt, this message translates to:
  /// **'Telefone'**
  String get contactLabelPhone;

  /// No description provided for @contactHintPhone.
  ///
  /// In pt, this message translates to:
  /// **'Digite seu telefone'**
  String get contactHintPhone;

  /// No description provided for @contactLabelMessage.
  ///
  /// In pt, this message translates to:
  /// **'Mensagem'**
  String get contactLabelMessage;

  /// No description provided for @contactHintMessage.
  ///
  /// In pt, this message translates to:
  /// **'Conte-me sobre o seu projeto...'**
  String get contactHintMessage;

  /// No description provided for @contactBtnSubmit.
  ///
  /// In pt, this message translates to:
  /// **'Enviar Mensagem'**
  String get contactBtnSubmit;

  /// No description provided for @contactInfoEmailTitle.
  ///
  /// In pt, this message translates to:
  /// **'Envie um Email'**
  String get contactInfoEmailTitle;

  /// No description provided for @contactInfoLocationTitle.
  ///
  /// In pt, this message translates to:
  /// **'Localização'**
  String get contactInfoLocationTitle;

  /// No description provided for @contactInfoLocationValue.
  ///
  /// In pt, this message translates to:
  /// **'São Paulo, SP - Brasil'**
  String get contactInfoLocationValue;

  /// No description provided for @contactInfoHoursTitle.
  ///
  /// In pt, this message translates to:
  /// **'Horário de Funcionamento'**
  String get contactInfoHoursTitle;

  /// No description provided for @contactInfoHoursValue.
  ///
  /// In pt, this message translates to:
  /// **'Seg - Sex: 9:00 - 18:00'**
  String get contactInfoHoursValue;

  /// No description provided for @footerCopyright.
  ///
  /// In pt, this message translates to:
  /// **'© {year} Software Engineer. All rights reserved.'**
  String footerCopyright(String year);

  /// No description provided for @footerBrand.
  ///
  /// In pt, this message translates to:
  /// **'Franklyn Viana dos Santos'**
  String get footerBrand;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'pt'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'pt':
      return AppLocalizationsPt();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}

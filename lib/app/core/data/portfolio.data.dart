import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:portfolio_flutter/l10n/app_localizations.dart';
import '../../modules/contact_section/contact.model.dart';
import '../../modules/experience_section/experience.model.dart';
import '../../modules/footer_section/footer.model.dart';
import '../../modules/hero_section/hero.model.dart';
import '../../modules/projects_section/projects.model.dart';
import '../../modules/skills_section/skill.model.dart';
import '../../modules/study_section/study.model.dart';
import '../model/section.model.dart';
import '../model/section.sealed.dart';
import '../styles/colors.dart';

const String _email = "dev@franklyndev.com.br";
const String _githubUrl = "https://github.com/thak1996";
const String _linkedinUrl = "https://www.linkedin.com/in/franklyn-v-santos/";
const String _profilePic = "https://i.imgur.com/te69F3I.png";

String? _encodeQueryParameters(Map<String, String> params) {
  return params.entries
      .map((MapEntry<String, String> e) =>
          '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
      .join('&');
}

List<SectionModel> getPortfolioSections(
  BuildContext context,
  Map<SectionType, GlobalKey> sectionKeys,
) {
  final l10n = AppLocalizations.of(context)!;

  final Uri emailUri = Uri(
    scheme: 'mailto',
    path: _email,
    query: _encodeQueryParameters({
      'subject': l10n.contactEmailSubject,
      'body': l10n.contactEmailBody,
    }),
  );

  final List<SocialIcon> heroSocials = [
    SocialIcon(Bootstrap.github, _githubUrl),
    SocialIcon(Bootstrap.linkedin, _linkedinUrl),
    SocialIcon(Bootstrap.envelope_at, emailUri.toString()),
  ];

  final List<SocialLinkModel> footerSocials = [
    SocialLinkModel(icon: Bootstrap.github, url: _githubUrl),
    SocialLinkModel(icon: Bootstrap.linkedin, url: _linkedinUrl),
    SocialLinkModel(icon: Bootstrap.envelope_at, url: emailUri.toString()),
  ];

  return [
    // --- HERO / ABOUT ---
    SectionModel(
      id: SectionType.hero,
      key: sectionKeys[SectionType.hero] ?? GlobalKey(),
      title: l10n.sectionAbout,
      backgroundColor: AppColors.bgDeep,
      heightFactor: 1,
      data: HeroData(
        content: HeroModel(
          tagline: l10n.heroTagline,
          taglineHighlight: l10n.heroTaglineHighlight,
          description: l10n.heroDescription,
          profileImageUrl: _profilePic,
          actions: [
            HeroCTA(l10n.heroCtaProjects, isPrimary: true),
            HeroCTA(l10n.heroCtaContact, isPrimary: false),
          ],
          socials: heroSocials,
        ),
      ),
    ),

    // --- EXPERIENCE ---
    SectionModel(
      id: SectionType.experience,
      key: sectionKeys[SectionType.experience] ?? GlobalKey(),
      title: l10n.experienceTitle,
      backgroundColor: AppColors.bgDeep,
      heightFactor: 0,
      data: ExperienceData(
        content: ExperienceModel(
          sectionTitle: l10n.experienceTitle,
          jobs: [
            ExperienceItemModel(
              role: l10n.expJob1Role,
              stack: l10n.expJob1Stack,
              company: l10n.expJob1Company,
              currentCompany: true,
              period: l10n.expJob1Period,
              location: l10n.expJob1Location,
              icon: Icons.badge,
              points: l10n.expJob1Points.split('|'),
              skills: l10n.expJob1Skills.split('|'),
            ),
            ExperienceItemModel(
              role: l10n.expJob2Role,
              stack: l10n.expJob2Stack,
              company: l10n.expJob2Company,
              period: l10n.expJob2Period,
              location: l10n.expJob2Location,
              icon: Icons.laptop_mac,
              points: l10n.expJob2Points.split('|'),
              skills: l10n.expJob2Skills.split('|'),
            ),
            ExperienceItemModel(
              role: l10n.expJob3Role,
              stack: l10n.expJob3Stack,
              company: l10n.expJob3Company,
              period: l10n.expJob3Period,
              location: l10n.expJob3Location,
              icon: Icons.laptop_mac,
              points: l10n.expJob3Points.split('|'),
              skills: l10n.expJob3Skills.split('|'),
            ),
            ExperienceItemModel(
              role: l10n.expJob4Role,
              stack: l10n.expJob4Stack,
              company: l10n.expJob4Company,
              period: l10n.expJob4Period,
              location: l10n.expJob4Location,
              icon: Icons.home_work,
              points: l10n.expJob4Points.split('|'),
              skills: l10n.expJob4Skills.split('|'),
            ),
          ],
        ),
      ),
    ),

    // --- Education ---
    SectionModel(
      id: SectionType.study,
      key: sectionKeys[SectionType.study] ?? GlobalKey(),
      title: l10n.educationTitle,
      backgroundColor: AppColors.bgDeep,
      heightFactor: 0,
      data: StudyData(
        content: StudyModel(
          sectionTitle: l10n.educationTitle,
          history: [
            EducationItemModel(
              year: l10n.eduYear1,
              currentEducation: true,
              degree: l10n.eduDegree1,
              institution: l10n.eduInst1,
              location: l10n.eduLocation1,
              icon: Icons.school,
            ),
            EducationItemModel(
              year: l10n.eduYear2,
              degree: l10n.eduDegree2,
              institution: l10n.eduInst2,
              location: l10n.eduLocation2,
              icon: Icons.school,
            ),
            EducationItemModel(
              year: l10n.eduYear3,
              degree: l10n.eduDegree3,
              institution: l10n.eduInst3,
              location: l10n.eduLocation3,
              icon: Icons.terminal,
            ),
          ],
        ),
      ),
    ),

    // --- Skills ---
    SectionModel(
      id: SectionType.skills,
      key: sectionKeys[SectionType.skills] ?? GlobalKey(),
      title: l10n.skillsTitle,
      backgroundColor: AppColors.bgDeep,
      heightFactor: 0,
      data: SkillsData(
        content: SkillsModel(
          sectionTitle: l10n.skillsTitle,
          programmingLanguages: [
            HardSkillModel(name: l10n.skillHard1, level: 0.85),
            HardSkillModel(name: l10n.skillHard2, level: 0.75),
            HardSkillModel(name: l10n.skillHard3, level: 0.65),
            HardSkillModel(name: l10n.skillHard4, level: 0.70),
            HardSkillModel(name: l10n.skillHard5, level: 0.75),
          ],
          softSkills: [
            SoftSkillModel(
              title: l10n.skillSoftArchTitle,
              description: l10n.skillSoftArchDesc,
              icon: Icons.architecture,
            ),
            SoftSkillModel(
              title: l10n.skillSoftProbTitle,
              description: l10n.skillSoftProbDesc,
              icon: Icons.psychology,
            ),
            SoftSkillModel(
              title: l10n.skillSoftFullTitle,
              description: l10n.skillSoftFullDesc,
              icon: Icons.layers_outlined,
            ),
          ],
          skillCategories: [
            SkillCategoryModel(
              title: l10n.skillToolsTitle,
              items: l10n.skillTools.split('|'),
            ),
            SkillCategoryModel(
              title: l10n.skillStrategicTitle,
              items: l10n.strategicAreas.split('|'),
            ),
          ],
        ),
      ),
    ),

    // --- Projects ---
    SectionModel(
      id: SectionType.projects,
      key: sectionKeys[SectionType.projects] ?? GlobalKey(),
      title: l10n.projectsTitle,
      backgroundColor: AppColors.bgDeep,
      heightFactor: 0,
      data: ProjectsData(
        content: ProjectsModel(
          sectionTitle: l10n.projectsTitle,
          projects: [
            ProjectItemModel(
              title: l10n.proj1Title,
              description: l10n.proj1Desc,
              technologies: l10n.proj1Technologies.split('|'),
              urlProject: 'https://www.fdslogistica.com.br/',
              labelButton: l10n.projLabelButtonView,
            ),
            ProjectItemModel(
              title: l10n.proj2Title,
              description: l10n.proj2Desc,
              technologies: l10n.proj2Technologies.split('|'),
              urlProject:
                  'https://github.com/thak1996/brincar_e_conectar_flutter',
              labelButton: l10n.projLabelButtonView,
            ),
            ProjectItemModel(
              title: l10n.proj3Title,
              description: l10n.proj3Desc,
              technologies: l10n.proj3Technologies.split('|'),
              urlProject: 'https://github.com/thak1996/rh-manager',
              labelButton: l10n.projLabelButtonView,
            ),
          ],
        ),
      ),
    ),

    // --- Contact ---
    SectionModel(
      id: SectionType.contact,
      key: sectionKeys[SectionType.contact] ?? GlobalKey(),
      title: l10n.contactTitle,
      backgroundColor: AppColors.bgDeep,
      heightFactor: 0,
      data: ContactData(
        content: ContactModel(
          title: l10n.contactHeading,
          subtitle: l10n.contactSubtitle,
          description: l10n.contactDesc,
          infoItems: [
            ContactInfoItem(
              title: l10n.contactInfoEmailTitle,
              value: _email,
              icon: Icons.mail,
            ),
            ContactInfoItem(
              title: l10n.contactInfoLocationTitle,
              value: l10n.contactInfoLocationValue,
              icon: Icons.location_on,
            ),
            ContactInfoItem(
              title: l10n.contactInfoHoursTitle,
              value: l10n.contactInfoHoursValue,
              icon: Icons.schedule,
            ),
          ],
          formLabels: ContactFormLabels(
            nameLabel: l10n.contactLabelName,
            nameHint: l10n.contactHintName,
            emailLabel: l10n.contactLabelEmail,
            emailHint: l10n.contactHintEmail,
            phoneLabel: l10n.contactLabelPhone,
            phoneHint: l10n.contactHintPhone,
            subjectLabel: l10n.contactLabelSubject,
            subjectHint: l10n.contactHintSubject,
            messageLabel: l10n.contactLabelMessage,
            messageHint: l10n.contactHintMessage,
            submitButtonText: l10n.contactBtnSubmit,
            successMessage: l10n.contactFormSuccess,
            errorMessage: l10n.contactFormError,
          ),
        ),
      ),
    ),

    // --- FOOTER ---
    SectionModel(
      id: SectionType.footer,
      key: sectionKeys[SectionType.footer] ?? GlobalKey(),
      title: "",
      backgroundColor: AppColors.bgDeep,
      heightFactor: 0,
      data: FooterData(
        content: FooterModel(
          brandName: l10n.footerBrand,
          copyright: l10n.footerCopyright(DateTime.now().year.toString()),
          socials: footerSocials,
        ),
      ),
    ),
  ];
}

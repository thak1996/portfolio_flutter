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

// Constantes que não mudam entre idiomas
const String _email = "dev@franklyndev.com.br";
const String _githubUrl = "https://github.com/thak1996";
const String _linkedinUrl = "https://www.linkedin.com/in/franklyn-v-santos/";
const String _profilePic = "https://i.imgur.com/te69F3I.png";
const String _mailtoUrl =
    "mailto:$_email?subject=Proposta%20de%20Projeto&body=Olá,%20gostaria%20de%20conversar%20sobre%20um%20projeto";

List<SectionModel> getPortfolioSections(
  BuildContext context,
  Map<SectionType, GlobalKey> sectionKeys,
) {
  final l10n = AppLocalizations.of(context)!;

  final List<SocialIcon> heroSocials = [
    SocialIcon(Bootstrap.github, _githubUrl),
    SocialIcon(Bootstrap.linkedin, _linkedinUrl),
    SocialIcon(Bootstrap.envelope_at, _mailtoUrl),
  ];

  final List<SocialLinkModel> footerSocials = [
    SocialLinkModel(icon: Bootstrap.github, url: _githubUrl),
    SocialLinkModel(icon: Bootstrap.linkedin, url: _linkedinUrl),
    SocialLinkModel(icon: Bootstrap.envelope_at, url: _mailtoUrl),
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
              skills: [
                "PHP Laravel",
                "Filament PHP",
                "Administração de Servidores (VPS)",
                "DNS & Domínios",
                "UI/UX Design"
              ],
            ),
            ExperienceItemModel(
              role: l10n.expJob2Role,
              stack: l10n.expJob2Stack,
              company: l10n.expJob2Company,
              period: l10n.expJob2Period,
              location: "Remoto",
              icon: Icons.laptop_mac,
              points: l10n.expJob2Points.split('|'),
              skills: [
                "Google Apps Script",
                "WebHooks",
                "Google Sheets",
                "Integrações de APIs",
                "JavaScript",
                "Json",
                "Automação de Processos"
              ],
            ),
            ExperienceItemModel(
              role: l10n.expJob3Role,
              stack: l10n.expJob3Stack,
              company: l10n.expJob3Company,
              period: l10n.expJob3Period,
              location: "Remoto",
              icon: Icons.laptop_mac,
              points: l10n.expJob3Points.split('|'),
              skills: [
                "Clean Architecture",
                "ObjectBox",
                "Firebase",
                "Android & IOS",
                "Dart",
                "Flutter",
                "Cubit"
              ],
            ),
            ExperienceItemModel(
              role: l10n.expJob4Role,
              stack: "Flutter & Backend",
              company: l10n.expJob4Company,
              period: l10n.expJob4Period,
              location: "Remoto",
              icon: Icons.home_work,
              points: l10n.expJob4Points.split('|'),
              skills: [
                "Git/GitFlow",
                "APIs REST",
                "Flutter",
                "Dart",
                "PHP Laravel",
                "MySQL"
              ],
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
          history: [
            EducationItemModel(
              year: "jan de 2026 - fev de 2027",
              currentEducation: true,
              degree: l10n.eduDegree1,
              institution: l10n.eduInst1,
              location: "São Paulo, SP",
              icon: Icons.school,
            ),
            EducationItemModel(
              year: "jul de 2023 - nov de 2025",
              degree: l10n.eduDegree2,
              institution: "Uninter Centro Universitário Internacional",
              location: "São Paulo, SP",
              icon: Icons.school,
            ),
            EducationItemModel(
              year: "jul de 2022 - set de 2022",
              degree: l10n.eduDegree3,
              institution: l10n.eduInst3,
              location: "Remoto",
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
          programmingLanguages: [
            HardSkillModel(name: "Flutter & Dart", level: 0.85),
            HardSkillModel(name: "PHP (Laravel)", level: 0.75),
            HardSkillModel(name: "JavaScript", level: 0.65),
            HardSkillModel(name: "SQL (MySQL)", level: 0.70),
            HardSkillModel(name: "Google Apps Script", level: 0.75),
          ],
          tools: [
            "Git / GitFlow",
            "Docker (Sail)",
            "VPS & Linux (SSH)",
            "Filament PHP",
            "Firebase (Auth/Firestore)",
            "Figma (UI/UX)",
            "ObjectBox",
            "Postman"
          ],
          softSkills: [
            SoftSkillModel(
                title: l10n.skillSoftArchTitle,
                description: l10n.skillSoftArchDesc,
                icon: Icons.architecture),
            SoftSkillModel(
                title: l10n.skillSoftProbTitle,
                description: l10n.skillSoftProbDesc,
                icon: Icons.psychology),
            SoftSkillModel(
                title: l10n.skillSoftFullTitle,
                description: l10n.skillSoftFullDesc,
                icon: Icons.layers_outlined),
          ],
          strategicAreas: l10n.strategicAreas.split('|'),
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
                technologies: ["PHP Laravel", "VPS", "Domínios", "UI/UX"],
                urlProject: 'https://www.fdslogistica.com.br/'),
            ProjectItemModel(
                title: l10n.proj2Title,
                description: l10n.proj2Desc,
                technologies: ["Flutter", "UI/UX", "Dart", "Bloc"],
                urlProject:
                    'https://github.com/thak1996/brincar_e_conectar_flutter'),
            ProjectItemModel(
                title: l10n.proj3Title,
                description: l10n.proj3Desc,
                technologies: ["UI/UX", "PHP Laravel", "MySQL", "Docker"],
                urlProject: 'https://github.com/thak1996/rh-manager'),
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
          brandName: "Franklyn Viana dos Santos",
          copyright: l10n.footerCopyright(DateTime.now().year.toString()),
          socials: footerSocials,
        ),
      ),
    ),
  ];
}

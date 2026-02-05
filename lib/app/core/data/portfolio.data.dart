import 'package:flutter/material.dart';
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

final List<SectionModel> portfolioSections = [
  SectionModel(
    id: SectionType.hero,
    title: "Sobre",
    backgroundColor: AppColors.bgDeep,
    heightFactor: 1.0,
    data: HeroData(
      content: HeroModel(
        tagline: "Criando Soluções Digitais com ",
        taglineHighlight: "Precisão.",
        description:
            "Desenvolvedor Mobile com foco em Flutter, atuando na construção de aplicações Android e iOS com uso de Dart, Firebase e arquitetura limpa.",
        profileImageUrl: "https://i.imgur.com/te69F3I.png",
        actions: [
          HeroCTA("Ver Projetos", isPrimary: true),
          HeroCTA("Contato", isPrimary: false),
        ],
        socials: [
          SocialIcon(Icons.code, "#"),
          SocialIcon(Icons.alternate_email, "#"),
          SocialIcon(Icons.share, "#"),
        ],
      ),
    ),
  ),
  SectionModel(
    id: SectionType.experience,
    title: "Experiência",
    backgroundColor: AppColors.bgSlateDeep,
    heightFactor: 0,
    data: ExperienceData(
      content: ExperienceModel(
        jobs: [
          ExperienceItemModel(
            role: "Desenvolvedor Full Stack",
            stack: "Modernização e Infraestrutura",
            company: "FDS Logística e Terceirização",
            currentCompany: true,
            period: "jul de 2025 - até o momento",
            location: "Remoto",
            icon: Icons.badge,
            points: [
              "Reformulação completa de interface (UI/UX) visando a modernização e responsividade de site legado.",
              "Implementação e migração de sistema de gerenciamento utilizando PHP Laravel e Filament PHP.",
              "Configuração e deploy de ambiente de produção em servidor VPS, garantindo maior performance e autonomia.",
              "Gestão de infraestrutura de rede, incluindo transferência de domínios e configuração de zonas DNS.",
              "Administração e migração de serviços de e-mail corporativo e suporte técnico à transição de plataforma.",
            ],
            skills: [
              "PHP Laravel",
              "Filament PHP",
              "Administração de Servidores (VPS)",
              "DNS & Domínios",
              "UI/UX Design",
            ],
          ),
          ExperienceItemModel(
            role: "Desenvolvedor de Software",
            stack: "Automação & Integração",
            company: "Autônomo",
            period: "set de 2025 - dez de 2025",
            location: "Remoto",
            icon: Icons.laptop_mac,
            points: [
              "Desenvolvimento de integrações para captura e processamento de formulários web.",
              "Criação de automações personalizadas utilizando Google Apps Script para otimização de fluxos.",
              "Implementação de integração entre sistemas via Google Sheets para gestão e exportação de dados.",
              "Estruturação de pipeline de dados para envio automatizado de leads para a plataforma do cliente.",
              "Melhoria na eficiência operacional através da sincronização de dados em tempo real.",
            ],
            skills: [
              "Google Apps Script",
              "WebHooks",
              "Google Sheets",
              "Integrações de APIs",
              "JavaScript",
              "Json",
              "Automação de Processos",
            ],
          ),
          ExperienceItemModel(
            role: "Desenvolvedor Mobile Flutter",
            stack: "Projeto Pontual",
            company: "Autônomo",
            period: "Mai de 2025",
            location: "Remoto",
            icon: Icons.laptop_mac,
            points: [
              "Desenvolvimento de aplicativo mobile utilizando Flutter e Dart.",
              "Implementação de Clean Architecture visando escalabilidade e organização do código.",
              "Gerenciamento de estado com Cubit.",
              "Integração com Firebase (Authentication e Firestore).",
              "Sincronização de dados entre Firebase (cloud) e ObjectBox (armazenamento local).",
              "Criação de interfaces responsivas para Android e iOS.",
            ],
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
            role: "Desenvolvedor de Software",
            stack: "Flutter & Backend",
            company: "Eagless",
            period: "Nov de 2023 - Nov de 2024",
            location: "Remoto",
            icon: Icons.home_work,
            points: [
              "Desenvolvimento de aplicações mobile e web utilizando Flutter.",
              "Criação de APIs REST com PHP Laravel para integração com apps mobile.",
              "Integração eficiente entre frontend e backend.",
              "Desenvolvimento de painéis administrativos para gestão de dados.",
              "Otimização de aplicações com foco em performance e usabilidade.",
            ],
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

  SectionModel(
    id: SectionType.study,
    title: "Educação",
    backgroundColor: AppColors.bgDeep,
    heightFactor: 0,
    data: StudyData(
      content: StudyModel(
        history: [
          EducationItemModel(
            year: "jan de 2026 - fev de 2027",
            currentEducation: true,
            degree: "Análise e Desenvolvimento de Sistemas",
            institution: "Uninter Centro Universitário Internacional",
            location: "São Paulo, SP",
            icon: Icons.school,
          ),
          EducationItemModel(
            year: "jul de 2023 - nov de 2025",
            degree: "Desenvolvimento Mobile",
            institution: "Uninter Centro Universitário Internacional",
            location: "São Paulo, SP",
            icon: Icons.school,
          ),
          EducationItemModel(
            year: "jul de 2022 - set de 2022",
            degree: "Flutter & Dart",
            institution: "Raro Academy",
            location: "Remoto",
            icon: Icons.terminal,
          ),
        ],
      ),
    ),
  ),

  SectionModel(
    id: SectionType.skills,
    title: "Habilidades",
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
          "Postman",
        ],
        softSkills: [
          SoftSkillModel(
            title: "Arquitetura Limpa",
            description:
                "Foco em código desacoplado, testável e escalável utilizando Clean Architecture.",
            icon: Icons.architecture,
          ),
          SoftSkillModel(
            title: "Resolução de Problemas",
            description:
                "Habilidade em analisar problemas técnicos e implementar automações eficientes.",
            icon: Icons.psychology,
          ),
          SoftSkillModel(
            title: "Mentalidade Full Stack",
            description:
                "Visão holística do projeto, desde a infraestrutura VPS até a interface mobile.",
            icon: Icons.layers_outlined,
          ),
        ],
        strategicAreas: [
          "Integração de APIs REST",
          "Gerenciamento de Estado (Cubit/Bloc)",
          "CI/CD & Deploy Automatizado",
          "Otimização de Performance",
          "Gestão de Infraestrutura de Rede",
        ],
      ),
    ),
  ),

  SectionModel(
    id: SectionType.projects,
    title: "Projetos",
    backgroundColor: AppColors.bgSlateDeep,
    heightFactor: 0,
    data: ProjectsData(
      content: ProjectsModel(
        sectionTitle: "Projetos",
        projects: [
          ProjectItemModel(
            title: "FDS Logística Website",
            description:
                "Sistema de gerenciamento de mudanças e logística com painel administrativo.",
            technologies: ["PHP Laravel", "VPS", "Domínios", "UI/UX"],
            urlProject: 'https://www.fdslogistica.com.br/',
          ),
          ProjectItemModel(
            title: "Brincar e Conectar App",
            description:
                "Aplicação mobile para instituições e orfanatos. Foi criado como estudo da faculdade, que pode ser aprimorado a ideia.",
            technologies: ["Flutter", "UI/UX", "Dart", "Bloc"],
            urlProject:
                'https://github.com/thak1996/brincar_e_conectar_flutter',
          ),
          ProjectItemModel(
            title: "RH Manager (skeleton)",
            description:
                "Gerenciador de RH (skeleton) construído com Laravel 10. Projeto configurado para desenvolvimento via Laravel Sail (Docker), MySQL e Vite para empacotamento de assets.",
            technologies: ["UI/UX", "PHP Laravel", "MySQL", "Docker"],
            urlProject: 'https://github.com/thak1996/rh-manager',
          ),
        ],
      ),
    ),
  ),

  SectionModel(
    id: SectionType.contact,
    title: "Contato",
    backgroundColor: AppColors.bgSlateDeep,
    heightFactor: 0.8,
    data: ContactData(
      content: ContactModel(
        title: "Get In Touch",
        description:
            "I'm currently available for freelance work or full-time roles. If you have a project that needs some creative hacking, feel free to reach out.",
        infoItems: [
          ContactInfoItem(
            title: "Email Me",
            value: "hello@portfolio.com",
            icon: Icons.mail,
          ),
          ContactInfoItem(
            title: "Location",
            value: "San Francisco, California, US",
            icon: Icons.location_on,
          ),
          ContactInfoItem(
            title: "Working Hours",
            value: "Mon - Fri: 9:00 AM - 6:00 PM",
            icon: Icons.schedule,
          ),
        ],
        formLabels: ContactFormLabels(
          nameLabel: "Your Name",
          emailLabel: "Your Email",
          submitButtonText: "Send Message",
        ),
      ),
    ),
  ),

  SectionModel(
    id: SectionType.footer,
    title: "",
    backgroundColor: AppColors.bgDeep,
    heightFactor: 0,
    data: FooterData(
      content: FooterModel(
        bio:
            "Crafting high-quality software with a focus on performance, accessibility, and scalability.",
        copyright: "© 2024 Software Engineer Portfolio. All rights reserved.",
        socials: [
          SocialLinkModel(icon: Icons.share, url: "#"),
          SocialLinkModel(icon: Icons.code, url: "#"),
          SocialLinkModel(icon: Icons.alternate_email, url: "#"),
        ],
        columns: [
          FooterColumn(
            title: "Quick Links",
            links: [
              FooterLink(label: "About", url: "#"),
              FooterLink(label: "Experience", url: "#experience"),
            ],
          ),
          FooterColumn(
            title: "Socials",
            links: [
              FooterLink(label: "LinkedIn", url: "#"),
              FooterLink(label: "GitHub", url: "#"),
            ],
          ),
        ],
      ),
    ),
  ),
];

import 'package:flutter/material.dart';
import '../../modules/contact_section/contact.model.dart';
import '../../modules/experience_section/experience.model.dart';
import '../../modules/footer_section/footer.model.dart';
import '../../modules/hero_section/hero.model.dart';
import '../../modules/projects_section/projects.model.dart';
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
    title: "Education",
    backgroundColor: AppColors.bgDeep,
    heightFactor: 1.2,
    data: StudyData(
      content: StudyModel(
        sectionLabel: "Academic Background",
        history: [
          EducationItemModel(
            year: "2016",
            degree: "B.S. in Computer Science",
            institution: "Stanford University",
            location: "Stanford, CA",
            icon: Icons.school,
          ),
          EducationItemModel(
            year: "2018",
            degree: "Advanced Web Architecture",
            institution: "Tech Institute of Technology",
            location: "Professional Certification",
            icon: Icons.terminal,
          ),
          EducationItemModel(
            year: "2021",
            degree: "Cloud Solutions Architect",
            institution: "AWS Global Training",
            location: "Expert Level",
            icon: Icons.verified,
          ),
        ],
      ),
    ),
  ),

  // --- Section Projects ---
  SectionModel(
    id: SectionType.projects,
    title: "Projects",
    backgroundColor: AppColors.bgSlateDeep,
    heightFactor: 1.3,
    data: ProjectsData(
      content: ProjectsModel(
        sectionLabel: "Portfolio",
        projects: [
          ProjectItemModel(
            title: "Enterprise Analytics Dashboard",
            description:
                "A high-performance dashboard featuring real-time data visualization and complex filtering for SaaS management.",
            imageUrl:
                "https://lh3.googleusercontent.com/aida-public/AB6AXuAubGE6_OUsXl_7f41x9QfSD1IZIi4WnjSnvwy_Bu1fT8DS__meTEvCT-k1aARkC4mYwTxO8UVcX4EGnkdxB8-cdDLaPBcP5YTZ4tfDiohvojysxD6z_Umz8un0i5EMTjdnFBhyqjxfVaW5lAaCMavDesGkiuxo9H2knvUHJSl7UIAiNZ74CRvFUw0I42PgLqo1X4buY9wC4AsnNh_xEyUnQFOkmPXZn3otLVZ-iQR0y1CLUJ4hzo6wHaFY1QtHX5MU8l-lPrn4Fh_y",
            categoryLabel: "Case Study",
            technologies: ["React", "D3.js", "Tailwind"],
          ),
          ProjectItemModel(
            title: "FinTech Wallet Application",
            description:
                "Encrypted mobile wallet architecture focused on seamless user experience and secure transactions.",
            imageUrl:
                "https://lh3.googleusercontent.com/aida-public/AB6AXuAQHoSKTA6goMhrhSFE5lCLHTsnpPfkKbR-922h0RQScVbyKTNTz-Cas88BQeuyWx5E9Xy_hiB4vICjOLN2xfW4dKemdem5LlOuUl8t3hJQw6Ah_46CKytHRbT1cC1Lhaxd_Ol7JXK3XL62i9UblwsE6LcS4DacZueaMyydxtHf8MPCSe-wZZySE6qP26uCAjAUwlNGRxfrdbDBOPyrSffymMy_ZwehDpBVGDccE2pQ_N8284BOcOxFn7HaF9ZGvHJfeY6qJqJ8S-TX",
            categoryLabel: "Mobile First",
            technologies: ["Python", "UI/UX", "PostgreSQL"],
          ),
          ProjectItemModel(
            title: "Cloud Infrastructure Manager",
            description:
                "Automated provisioning tool for multi-cloud environments with integrated monitoring and alerting.",
            imageUrl:
                "https://lh3.googleusercontent.com/aida-public/AB6AXuBcmq2IbjDtRuFwtlnL97GI4TSur1O1w86Yoi_7Pqv0P8VeOMavt5OLTbJ9AH47AhUwnUuNGiaEr838zvyRwsx0uHMWPqlApmtoela3YeeDXHSTnQuiZNLxCkyTd3F1qDO8vZstnw1xQxDdTeHTmrvta2bjDfN19MwVekhlanWsAMGPUuNrW6_ad2dHq7TN1zOrFoKJcv5ERchC1KgEoGbuNReb3Dxat03_yCn2b3Q_lMs9fYimmHCmUs2QJL6_8Iy8oSDDGRixCNvf",
            categoryLabel: "Automation",
            technologies: ["Go", "Terraform", "AWS"],
          ),
        ],
      ),
    ),
  ),
  SectionModel(
    id: SectionType.contact,
    title: "Contact",
    backgroundColor: AppColors.bgDeep,
    heightFactor: 0,
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
    backgroundColor: AppColors.bgSlateDeep,
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
          FooterColumn(title: "Quick Links", links: [
            FooterLink(label: "About", url: "#"),
            FooterLink(label: "Experience", url: "#experience"),
          ]),
          FooterColumn(title: "Socials", links: [
            FooterLink(label: "LinkedIn", url: "#"),
            FooterLink(label: "GitHub", url: "#"),
          ]),
        ],
      ),
    ),
  ),
];

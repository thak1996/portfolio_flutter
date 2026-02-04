import 'package:flutter/material.dart';
import '../../modules/contact_section/contact.model.dart';
import '../../modules/experience_section/experience.model.dart';
import '../../modules/footer_section/footer.model.dart';
import '../../modules/hero_section/hero.model.dart';
import '../../modules/projects_section/projects.model.dart';
import '../../modules/study_section/study.model.dart';
import '../model/section.model.dart';
import '../model/section.sealed.dart';

final List<SectionModel> portfolioSections = [
  SectionModel(
    id: SectionType.hero,
    title: "About",
    backgroundColor: const Color(0xFFF6F7F8),
    heightFactor: 1.0,
    data: HeroData(
      content: HeroModel(
        tagline: "Building Digital Excellence with Precision.",
        description:
            "Senior Software Engineer specialized in crafting high-performance web applications and scalable architecture. Let's build something exceptional together.",
        profileImageUrl:
            "https://lh3.googleusercontent.com/aida-public/AB6AXuDeS4LCrgfuuwhhf5RP-ysNZS0CXwq7qFJEZHBxZer_6WSYyAg7XL21dn9NwNC4vv9c1-_2tcbQ45YrMTpSK_pF2zF_wzhP9TieyK8wXb9DRmizzhPCV3bqSlgk19nVan1BHCUARzJnR9LDnb38JbqB2baqC5IyFgIjyBaKALyErZB9b2FWwpAfy2pC_Fg5woQ2pHbCmDTsGgXQ2TKxjFC62ys6pnPAwV4xMZticknRPQCWfdc4gWvTIQOjq9XEN3qHDmUC8drQM-N9",
        actions: [
          HeroCTA("View Work", isPrimary: true),
          HeroCTA("Contact Me", isPrimary: false),
        ],
        socials: [
          SocialIcon(Icons.code, "#"),
          SocialIcon(Icons.alternate_email, "#"),
          SocialIcon(Icons.share, "#"),
        ],
      ),
    ),
  ),

  // --- SEÇÃO EXPERIENCE ---
  SectionModel(
    id: SectionType.experience,
    title: "Experience",
    backgroundColor: const Color(0xFFF1F5F9), // slate-50
    heightFactor: 1.5, // Seção mais longa para a timeline
    data: ExperienceData(
      content: ExperienceModel(
        sectionLabel: "My Career Path",
        jobs: [
          ExperienceItemModel(
            role: "Senior Software Engineer",
            company: "TechCorp",
            period: "Jan 2021 - Present",
            location: "San Francisco, CA",
            icon: Icons.work,
            points: [
              "Led a cross-functional team of 5 engineers to deliver a high-performance cloud platform servicing 200k+ MAU.",
              "Reduced application latency by 40% through code optimization and strategic implementation of Redis caching layers."
            ],
          ),
          ExperienceItemModel(
            role: "Full Stack Developer",
            company: "InnovateSoft",
            period: "June 2018 - Dec 2020",
            location: "Remote",
            icon: Icons.corporate_fare,
            points: [
              "Maintained and optimized legacy React components, improving lighthouse accessibility scores from 65 to 98."
            ],
          ),
        ],
      ),
    ),
  ),

  // --- SEÇÃO STUDY (EDUCATION) ---
  SectionModel(
    id: SectionType.study,
    title: "Education",
    backgroundColor: Colors.white,
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

  // --- SEÇÃO PROJECTS ---
  SectionModel(
    id: SectionType.projects,
    title: "Projects",
    backgroundColor: Colors.white,
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
    backgroundColor: const Color(0xFFF1F5F9),
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
              icon: Icons.mail),
          ContactInfoItem(
              title: "Location",
              value: "San Francisco, California, US",
              icon: Icons.location_on),
          ContactInfoItem(
              title: "Working Hours",
              value: "Mon - Fri: 9:00 AM - 6:00 PM",
              icon: Icons.schedule),
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
    backgroundColor: Colors.white,
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

import 'package:flutter/material.dart';
import '../../core/model/section.model.dart';
import '../../core/model/section.sealed.dart';
import '../contact_section/contact.section.dart';
import '../experience_section/experience.section.dart';
import '../footer_section/footer.section.dart';
import '../hero_section/hero.section.dart';
import '../projects_section/projects.section.dart';
import '../study_section/study.section.dart';
  
class SectionBuilder extends StatelessWidget {
  const SectionBuilder({super.key, required this.model});

  final SectionModel model;

  @override
  Widget build(BuildContext context) {
    return switch (model.data) {
      HeroData d => HeroSection(content: d.content),
      ExperienceData d => ExperienceSection(content: d.content),
      StudyData d => StudySection(content: d.content),
      ProjectsData d => ProjectsSection(content: d.content),
      ContactData d => ContactSection(content: d.content),
      FooterData d => FooterSection(content: d.content),
    };
  }
}

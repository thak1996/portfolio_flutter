import 'package:flutter/material.dart';
import '../../core/model/section.model.dart';
import '../../core/model/section.sealed.dart';
import '../contact_section/contact.section.dart';
import '../experience_section/experience.section.dart';
import '../footer_section/footer.section.dart';
import '../hero_section/hero.section.dart';
import '../projects_section/projects.section.dart';
import '../study_section/study.section.dart';

class SectionWidget extends StatelessWidget {
  const SectionWidget({super.key, required this.model, required this.onAction});

  final SectionModel model;
  final Function(SectionType) onAction;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: model.backgroundColor,
      width: double.infinity,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: switch (model.data) {
              HeroData d => HeroSection(content: d.content, onAction: onAction),
              ExperienceData d => ExperienceSection(content: d.content),
              StudyData d => StudySection(content: d.content),
              ProjectsData d => ProjectsSection(content: d.content),
              ContactData d => ContactSection(content: d.content),
              FooterData d => FooterSection(content: d.content),
            },
          ),
        ),
      ),
    );
  }
}

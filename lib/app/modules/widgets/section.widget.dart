import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../core/model/section.model.dart';
import '../../core/model/section.sealed.dart';
import '../contact_section/contact.section.dart';
import '../experience_section/experience.section.dart';
import '../footer_section/footer.section.dart';
import '../hero_section/hero.section.dart';
import '../projects_section/projects.section.dart';
import '../skills_section/skills.section.dart';
import '../study_section/study.section.dart';

class SectionWidget extends StatelessWidget {
  const SectionWidget({
    super.key,
    required this.model,
    required this.onAction,
  });

  final SectionModel model;
  final Function(SectionType) onAction;
  final padding = const EdgeInsets.symmetric(vertical: 40);

  @override
  Widget build(BuildContext context) {
    final double horizontalPadding = ResponsiveValue<double>(
      context,
      defaultValue: 0,
      conditionalValues: [
        const Condition.largerThan(name: MOBILE, value: 10.0),
        const Condition.largerThan(name: TABLET, value: 20.0),
      ],
    ).value;

    final double verticalPadding = ResponsiveValue<double>(
      context,
      defaultValue: 10,
      conditionalValues: [
        const Condition.largerThan(name: TABLET, value: 20.0),
      ],
    ).value;

    final currentPadding = EdgeInsets.symmetric(
      vertical: verticalPadding,
      horizontal: horizontalPadding,
    );

    return Container(
      color: model.backgroundColor.withValues(alpha: 0.6),
      width: double.infinity,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: switch (model.data) {
                HeroData d => HeroSection(
                    content: d.content,
                    onAction: onAction,
                  ),
                ExperienceData d => ExperienceSection(
                    content: d.content,
                    padding: currentPadding,
                  ),
                SkillsData d => SkillsSection(
                    content: d.content,
                    padding: currentPadding,
                  ),
                StudyData d => StudySection(
                    content: d.content,
                    padding: currentPadding,
                  ),
                ProjectsData d => ProjectsSection(
                    content: d.content,
                    padding: currentPadding,
                  ),
                ContactData d => ContactSection(
                    content: d.content,
                    padding: currentPadding,
                  ),
                FooterData d => FooterSection(
                    content: d.content,
                    onAction: onAction,
                  ),
              },
            ),
          ),
        ),
      ),
    );
  }
}

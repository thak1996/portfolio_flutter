import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../../core/model/section.model.dart';
import '../../core/model/section.sealed.dart';
import '../contact_section/contact.section.dart';
import '../experience_section/experience.section.dart';
import '../footer_section/footer.section.dart';
import '../hero_section/hero.section.dart';
import '../projects_section/projects.section.dart';
import '../skills_section/skills.section.dart';
import '../study_section/study.section.dart';

class SectionWidget extends StatefulWidget {
  const SectionWidget({
    super.key,
    required this.model,
    required this.onAction,
  });

  final SectionModel model;
  final Function(SectionType) onAction;

  @override
  State<SectionWidget> createState() => _SectionWidgetState();
}

class _SectionWidgetState extends State<SectionWidget> {
  bool _hasBeenVisible = false;

  @override
  Widget build(BuildContext context) {
    final currentPadding = _getResponsivePadding(context);

    return VisibilityDetector(
      key: Key(widget.model.data.runtimeType.toString()),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.2 && !_hasBeenVisible) {
          setState(() {
            _hasBeenVisible = true;
          });
        }
      },
      child: Container(
        color: widget.model.backgroundColor.withValues(alpha: 0.6),
        width: double.infinity,
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1200),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: _buildSectionContent(currentPadding),
            ),
          ),
        ),
      )
          .animate(target: _hasBeenVisible ? 1 : 0)
          .fadeIn(duration: 600.ms, curve: Curves.easeOut)
          .moveY(begin: 50, end: 0, duration: 600.ms, curve: Curves.easeOut),
    );
  }

  EdgeInsets _getResponsivePadding(BuildContext context) {
    final double horizontal =
        ResponsiveValue<double>(context, defaultValue: 0, conditionalValues: [
      const Condition.largerThan(name: MOBILE, value: 10.0),
      const Condition.largerThan(name: TABLET, value: 20.0),
    ]).value;
    return EdgeInsets.symmetric(vertical: 20, horizontal: horizontal);
  }

  Widget _buildSectionContent(EdgeInsets currentPadding) {
    return switch (widget.model.data) {
      HeroData d => HeroSection(
          content: d.content,
          onAction: widget.onAction,
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
          onAction: widget.onAction,
        ),
    };
  }
}

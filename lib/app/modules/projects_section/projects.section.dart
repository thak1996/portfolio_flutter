import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:portfolio_flutter/app/core/utils/url_launcher.helper.dart';
import '../../core/styles/colors.dart';
import 'projects.model.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({
    super.key,
    required this.content,
    required this.padding,
  });

  final ProjectsModel content;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    final breakpoint = ResponsiveBreakpoints.of(context);

    final double horizontalPadding = ResponsiveValue<double>(
      context,
      defaultValue: 20.0,
      conditionalValues: [
        const Condition.largerThan(name: MOBILE, value: 40.0),
        const Condition.largerThan(name: TABLET, value: 0.0),
      ],
    ).value;

    return Padding(
      padding: EdgeInsets.only(
        bottom: padding.bottom,
        left: horizontalPadding,
        right: horizontalPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            content.sectionTitle,
            style: TextStyle(
              color: Colors.white,
              fontSize: breakpoint.isMobile ? 32 : 42,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 48),
          Align(
            alignment: Alignment.center,
            child: Wrap(
              spacing: 24,
              runSpacing: 32,
              alignment: WrapAlignment.center,
              children: content.projects.map((project) {
                return _ProjectCard(project: project);
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProjectCard extends StatefulWidget {
  final ProjectItemModel project;
  const _ProjectCard({required this.project});

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final cardWidth = ResponsiveValue<double>(
      context,
      defaultValue: 340.0,
      conditionalValues: [
        Condition.smallerThan(
          name: MOBILE,
          value: MediaQuery.of(context).size.width - 40,
        ),
        const Condition.largerThan(name: MOBILE, value: 360.0),
        const Condition.largerThan(name: TABLET, value: 380.0),
      ],
    ).value;

    final cardHeight = ResponsiveValue<double>(
      context,
      defaultValue: 320.0,
      conditionalValues: [
        const Condition.smallerThan(name: MOBILE, value: 420.0),
      ],
    ).value;

    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        width: cardWidth,
        height: cardHeight,
        transform: isHovered
            ? Matrix4.translationValues(0, -10, 0)
            : Matrix4.identity(),
        decoration: BoxDecoration(
          color: isHovered
              ? AppColors.bgSlateDeep.withValues(alpha: 0.6)
              : AppColors.bgSlateDeep.withValues(alpha: 0.4),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: isHovered
                ? AppColors.primary.withValues(alpha: 0.8)
                : const Color(0xFF1E293B),
            width: isHovered ? 2 : 1.5,
          ),
          boxShadow: [
            if (isHovered)
              BoxShadow(
                color: AppColors.primary.withValues(alpha: 0.25),
                blurRadius: 30,
                spreadRadius: -5,
                offset: const Offset(0, 15),
              )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: isHovered
                      ? AppColors.primary.withValues(alpha: 0.15)
                      : const Color(0xFF1E293B),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    if (isHovered)
                      BoxShadow(
                        color: AppColors.primary.withValues(alpha: 0.2),
                        blurRadius: 10,
                      )
                  ],
                ),
                child: Icon(
                  Icons.folder_open_outlined,
                  color: isHovered ? Colors.white : AppColors.primary,
                  size: 28,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                widget.project.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: isHovered
                      ? Colors.white
                      : Colors.white.withValues(alpha: 0.9),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                widget.project.description,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: isHovered
                      ? const Color(0xFFCBD5E1)
                      : const Color(0xFF94A3B8),
                  fontSize: 13,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 20),
              Wrap(
                spacing: 6,
                runSpacing: 6,
                children: widget.project.technologies
                    .map((tech) => _buildTechTag(tech))
                    .toList(),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                height: 44,
                child: ElevatedButton(
                  onPressed: () => openUrl(widget.project.urlProject),
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        isHovered ? AppColors.primary : const Color(0xFF1E293B),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Ver Detalhes",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 13),
                      ),
                      const SizedBox(width: 8),
                      Icon(
                        Icons.arrow_right_alt,
                        size: 18,
                        color: isHovered ? Colors.white : AppColors.primary,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTechTag(String tech) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: isHovered
            ? AppColors.primary.withValues(alpha: 0.1)
            : const Color(0xFF0F172A),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
            color: isHovered
                ? AppColors.primary.withValues(alpha: 0.3)
                : const Color(0xFF1E293B)),
      ),
      child: Text(
        tech.toUpperCase(),
        style: TextStyle(
          color: isHovered
              ? Colors.white
              : AppColors.primary.withValues(alpha: 0.8),
          fontSize: 9,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}

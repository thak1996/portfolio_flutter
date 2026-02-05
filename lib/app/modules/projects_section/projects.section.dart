import 'package:flutter/material.dart';
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
    return Padding(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            content.sectionTitle,
            style: TextStyle(
              color: Colors.white,
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 48),
          Align(
            alignment: Alignment.center,
            child: Wrap(
              spacing: 24,
              runSpacing: 32,
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
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 360,
        decoration: BoxDecoration(
          color: AppColors.bgSlateDeep,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isHovered
                ? AppColors.primary.withValues(alpha: 0.3)
                : const Color(0xFF1E293B),
          ),
          boxShadow: [
            if (isHovered)
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.3),
                blurRadius: 20,
                offset: const Offset(0, 10),
              )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.project.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    widget.project.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Color(0xFF94A3B8),
                      fontSize: 14,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Align(
                    alignment: Alignment.center,
                    child: Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: widget.project.technologies
                          .map((tech) => Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF1E293B),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Text(
                                  tech.toUpperCase(),
                                  style: const TextStyle(
                                    color: Color(0xFF94A3B8),
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ))
                          .toList(),
                    ),
                  ),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => openUrl(widget.project.urlProject),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Ver Projeto",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 8),
                          Icon(Icons.arrow_forward, size: 18),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

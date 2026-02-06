import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../core/styles/colors.dart';
import 'skill.model.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({
    super.key,
    required this.content,
    required this.padding,
  });

  final SkillsModel content;
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
            "EXPERTISE",
            style: TextStyle(
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
              fontSize: 14,
              letterSpacing: 2.0,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Habilidades",
            style: TextStyle(
              color: Colors.white,
              fontSize: breakpoint.isMobile ? 32 : 42,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 48),
          SizedBox(
            width: double.infinity,
            child: Wrap(
              spacing: 80,
              runSpacing: 60,
              alignment: breakpoint.isMobile
                  ? WrapAlignment.center
                  : WrapAlignment.start,
              children: [
                _buildHardSkillsColumn(breakpoint),
                _buildSoftSkillsColumn(breakpoint),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHardSkillsColumn(ResponsiveBreakpointsData breakpoint) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 500),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCategoryHeader(Icons.code, "Hard Skills"),
          const SizedBox(height: 32),
          _buildSubCategoryDivider("LINGUAGENS E FRAMEWORKS"),
          ...content.programmingLanguages
              .map((skill) => _buildProgressBar(skill)),
          const SizedBox(height: 32),
          _buildSubCategoryDivider("FERRAMENTAS & TECNOLOGIAS"),
          SizedBox(
            width: double.infinity,
            child: Wrap(
              spacing: 12,
              runSpacing: 12,
              alignment: breakpoint.isMobile
                  ? WrapAlignment.center
                  : WrapAlignment.start,
              children: content.tools
                  .map((tool) => _buildTag(tool, isOutline: false))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSoftSkillsColumn(ResponsiveBreakpointsData breakpoint) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 500),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCategoryHeader(Icons.psychology_outlined, "Soft Skills"),
          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            child: Wrap(
              spacing: 20,
              runSpacing: 20,
              alignment: breakpoint.isMobile
                  ? WrapAlignment.center
                  : WrapAlignment.start,
              children: content.softSkills
                  .map((soft) => _buildSoftSkillCard(soft, breakpoint))
                  .toList(),
            ),
          ),
          const SizedBox(height: 48),
          _buildSubCategoryDivider("ÁREAS ESTRATÉGICAS"),
          SizedBox(
            width: double.infinity,
            child: Wrap(
              spacing: 10,
              runSpacing: 10,
              alignment: breakpoint.isMobile
                  ? WrapAlignment.center
                  : WrapAlignment.start,
              children: content.strategicAreas
                  .map((area) => _buildTag(area, isOutline: true))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryHeader(IconData icon, String title) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: AppColors.primary, size: 20),
        ),
        const SizedBox(width: 12),
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildSubCategoryDivider(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Row(
        children: [
          Container(width: 20, height: 1, color: Colors.white24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.white38,
                fontSize: 12,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
          ),
          Expanded(child: Container(height: 1, color: Colors.white24)),
        ],
      ),
    );
  }

  Widget _buildProgressBar(HardSkillModel skill) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                skill.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "${(skill.level * 100).toInt()}%",
                style: TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: skill.level,
              minHeight: 8,
              backgroundColor: const Color(0xFF1E293B),
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSoftSkillCard(
    SoftSkillModel soft,
    ResponsiveBreakpointsData breakpoint,
  ) {
    return Container(
      width: breakpoint.isMobile ? double.infinity : 235,
      constraints: BoxConstraints(maxWidth: breakpoint.isMobile ? 400 : 235),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF0F172A).withValues(alpha: 0.4),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF1E293B)),
      ),
      child: Column(
        crossAxisAlignment: breakpoint.isMobile
            ? CrossAxisAlignment.center
            : CrossAxisAlignment.start,
        children: [
          Icon(soft.icon, color: AppColors.primary, size: 28),
          const SizedBox(height: 16),
          Text(
            soft.title,
            textAlign: breakpoint.isMobile ? TextAlign.center : TextAlign.start,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            soft.description,
            textAlign: breakpoint.isMobile ? TextAlign.center : TextAlign.start,
            style: const TextStyle(
              color: Color(0xFF94A3B8),
              fontSize: 13,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTag(String label, {required bool isOutline}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isOutline ? Colors.transparent : const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(8),
        border: isOutline ? Border.all(color: Colors.white10) : null,
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isOutline ? Colors.white38 : Colors.white70,
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

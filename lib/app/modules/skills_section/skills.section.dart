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
            "Habilidades",
            style: TextStyle(
              color: Colors.white,
              fontSize: breakpoint.isMobile ? 32 : 42,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 48),
          ResponsiveRowColumn(
            layout: breakpoint.smallerThan(DESKTOP)
                ? ResponsiveRowColumnType.COLUMN
                : ResponsiveRowColumnType.ROW,
            rowSpacing: 50,
            columnSpacing: 60,
            rowCrossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ResponsiveRowColumnItem(
                rowFlex: 1,
                child: _buildHardSkillsColumn(breakpoint),
              ),
              ResponsiveRowColumnItem(
                rowFlex: 1,
                child: _buildSoftSkillsColumn(breakpoint),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHardSkillsColumn(ResponsiveBreakpointsData breakpoint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildCategoryHeader(Icons.code, "Hard Skills"),
        const SizedBox(height: 32),
        _buildSubCategoryDivider("LINGUAGENS E FRAMEWORKS"),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: content.programmingLanguages
              .map((skill) => _SkillTag(label: skill.name))
              .toList(),
        ),
        const SizedBox(height: 40),
        _buildSubCategoryDivider("FERRAMENTAS & TECNOLOGIAS"),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children:
              content.tools.map((tool) => _SkillTag(label: tool)).toList(),
        ),
      ],
    );
  }

  Widget _buildSoftSkillsColumn(ResponsiveBreakpointsData breakpoint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildCategoryHeader(Icons.psychology_outlined, "Soft Skills"),
        const SizedBox(height: 32),
        LayoutBuilder(
          builder: (context, constraints) {
            int crossAxisCount = breakpoint.isMobile ? 1 : 2;
            double spacing = 20;
            double availableWidth =
                constraints.maxWidth - (spacing * (crossAxisCount - 1));
            double cardWidth = availableWidth / crossAxisCount;
            double fixedCardHeight = 220.0;
            double childAspectRatio = cardWidth / fixedCardHeight;
            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: spacing,
                mainAxisSpacing: spacing,
                childAspectRatio: childAspectRatio,
              ),
              itemCount: content.softSkills.length,
              itemBuilder: (context, index) {
                return _SoftSkillCard(soft: content.softSkills[index]);
              },
            );
          },
        ),
        const SizedBox(height: 48),
        _buildSubCategoryDivider("ÁREAS ESTRATÉGICAS"),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: content.strategicAreas
              .map((area) => _SkillTag(label: area))
              .toList(),
        ),
      ],
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
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Colors.white38,
              fontSize: 11,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(child: Container(height: 1, color: Colors.white10)),
        ],
      ),
    );
  }
}

class _SoftSkillCard extends StatefulWidget {
  final SoftSkillModel soft;

  const _SoftSkillCard({required this.soft});

  @override
  State<_SoftSkillCard> createState() => _SoftSkillCardState();
}

class _SoftSkillCardState extends State<_SoftSkillCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(24),
        transform: _isHovered
            ? Matrix4.translationValues(0, -8, 0)
            : Matrix4.identity(),
        decoration: BoxDecoration(
          color: _isHovered
              ? const Color(0xFF1E293B).withValues(alpha: 0.6)
              : const Color(0xFF0F172A).withValues(alpha: 0.4),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: _isHovered ? AppColors.primary : const Color(0xFF1E293B),
            width: 1.5,
          ),
          boxShadow: [
            if (_isHovered)
              BoxShadow(
                color: AppColors.primary.withValues(alpha: 0.15),
                blurRadius: 30,
                spreadRadius: -5,
                offset: const Offset(0, 15),
              ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: _isHovered
                    ? AppColors.primary.withValues(alpha: 0.2)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                widget.soft.icon,
                color: _isHovered ? Colors.white : AppColors.primary,
                size: 26,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              widget.soft.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: Text(
                widget.soft.description,
                overflow: TextOverflow.ellipsis,
                maxLines: 4,
                style: TextStyle(
                  color: _isHovered ? Colors.white70 : const Color(0xFF94A3B8),
                  fontSize: 12,
                  height: 1.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SkillTag extends StatefulWidget {
  final String label;
  const _SkillTag({required this.label});

  @override
  State<_SkillTag> createState() => _SkillTagState();
}

class _SkillTagState extends State<_SkillTag> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        transform: _isHovered
            ? Matrix4.translationValues(0, -1, 0)
            : Matrix4.identity(),
        decoration: BoxDecoration(
          color: _isHovered
              ? AppColors.primary.withValues(alpha: 0.08)
              : const Color(0xFF1E293B),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: _isHovered
                ? AppColors.primary.withValues(alpha: 0.6)
                : const Color(0xFF334155),
            width: 1,
          ),
          boxShadow: [
            if (_isHovered)
              BoxShadow(
                color: AppColors.primary.withValues(alpha: 0.05),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
          ],
        ),
        child: Text(
          widget.label,
          style: TextStyle(
            color: _isHovered ? Colors.white : Colors.white70,
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

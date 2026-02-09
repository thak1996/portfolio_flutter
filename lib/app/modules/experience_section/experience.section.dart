import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../core/styles/colors.dart';
import 'experience.model.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({
    super.key,
    required this.content,
    required this.padding,
  });

  final ExperienceModel content;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    final breakpoint = ResponsiveBreakpoints.of(context);

    final double horizontalPadding = ResponsiveValue<double>(
      context,
      defaultValue: 20.0,
      conditionalValues: [
        const Condition<double>.largerThan(name: TABLET, value: 0.0),
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
          const SizedBox(height: 64),
          ...content.jobs.asMap().entries.map((entry) {
            int index = entry.key;
            var job = entry.value;
            bool isLast = index == content.jobs.length - 1;
            return _ExperienceTimelineItem(
              job: job,
              isLast: isLast,
              breakpoint: breakpoint,
            );
          }),
        ],
      ),
    );
  }
}

class _ExperienceTimelineItem extends StatefulWidget {
  final ExperienceItemModel job;
  final bool isLast;
  final ResponsiveBreakpointsData breakpoint;

  const _ExperienceTimelineItem({
    required this.job,
    required this.isLast,
    required this.breakpoint,
  });

  @override
  State<_ExperienceTimelineItem> createState() =>
      _ExperienceTimelineItemState();
}

class _ExperienceTimelineItemState extends State<_ExperienceTimelineItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final bool isActive = widget.job.currentCompany || _isHovered;
    final Color activeColor = isActive //
        ? AppColors.primary
        : const Color(0xFF475569);

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    color: isActive
                        ? activeColor.withValues(alpha: 0.15)
                        : const Color(0xFF1E293B),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isActive ? activeColor : const Color(0xFF334155),
                      width: isActive ? 2.5 : 2,
                    ),
                    boxShadow: [
                      if (isActive)
                        BoxShadow(
                          color: activeColor.withValues(alpha: 0.3),
                          blurRadius: 15,
                          spreadRadius: 2,
                        ),
                    ],
                  ),
                  child: Icon(
                    widget.job.icon,
                    color: isActive ? Colors.white : activeColor,
                    size: 22,
                  ),
                ),
                if (!widget.isLast)
                  Expanded(
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 400),
                      width: 2,
                      color: isActive
                          ? activeColor.withValues(alpha: 0.5)
                          : const Color(0xFF1E293B),
                      margin: const EdgeInsets.symmetric(vertical: 8),
                    ),
                  ),
              ],
            ),
            const SizedBox(width: 32),
            Expanded(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOut,
                padding: const EdgeInsets.only(bottom: 56),
                transform: _isHovered
                    ? Matrix4.translationValues(10, 0, 0)
                    : Matrix4.identity(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ResponsiveRowColumn(
                      layout: widget.breakpoint.isMobile
                          ? ResponsiveRowColumnType.COLUMN
                          : ResponsiveRowColumnType.ROW,
                      rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
                      rowCrossAxisAlignment: CrossAxisAlignment.center,
                      columnCrossAxisAlignment: CrossAxisAlignment.start,
                      columnSpacing: 12,
                      children: [
                        ResponsiveRowColumnItem(
                          child: Text.rich(
                            TextSpan(
                              text: widget.job.role,
                              style: TextStyle(
                                color: isActive ? Colors.white : Colors.white70,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                              children: [
                                TextSpan(
                                  text: " | ${widget.job.company}",
                                  style: TextStyle(
                                    color: activeColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        ResponsiveRowColumnItem(
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: isActive
                                  ? activeColor.withValues(alpha: 0.1)
                                  : const Color(0xFF0F172A),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: isActive
                                    ? activeColor.withValues(alpha: 0.3)
                                    : Colors.transparent,
                              ),
                            ),
                            child: Text(
                              widget.job.period.toUpperCase(),
                              style: TextStyle(
                                color: isActive
                                    ? Colors.white
                                    : const Color(0xFF64748B),
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      widget.job.location,
                      style: TextStyle(
                        color: isActive ? Colors.white38 : Colors.white24,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 24),
                    ...widget.job.points.map((point) => Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 6),
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  width: 6,
                                  height: 6,
                                  decoration: BoxDecoration(
                                    color: isActive
                                        ? activeColor
                                        : const Color(0xFF334155),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Text(
                                  point,
                                  style: TextStyle(
                                    color: isActive
                                        ? const Color(0xFFCBD5E1)
                                        : const Color(0xFF94A3B8),
                                    fontSize: 15,
                                    height: 1.6,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                    const SizedBox(height: 24),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: widget.job.skills
                          .map((skill) => AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: _isHovered
                                      ? activeColor.withValues(alpha: 0.1)
                                      : const Color(0xFF1E293B),
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(
                                    color: _isHovered
                                        ? activeColor.withValues(alpha: 0.4)
                                        : const Color(0xFF334155),
                                    width: 1,
                                  ),
                                ),
                                child: Text(
                                  skill,
                                  style: TextStyle(
                                    color: _isHovered
                                        ? Colors.white
                                        : const Color(0xFF94A3B8),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ))
                          .toList(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

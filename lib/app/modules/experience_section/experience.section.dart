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
            "Trajetória Profissional",
            style: TextStyle(
              color: Colors.white,
              fontSize: breakpoint.isMobile ? 32 : 42,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 48),
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
        : const Color(0xFF64748B);

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.basic,
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: activeColor.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: activeColor.withValues(alpha: 0.2),
                      width: 2,
                    ),
                  ),
                  child: Icon(widget.job.icon, color: activeColor, size: 20),
                ),
                if (!widget.isLast)
                  Expanded(
                    child: Container(
                      width: 2,
                      color: const Color(0xFF334155),
                      margin: const EdgeInsets.symmetric(vertical: 4),
                    ),
                  ),
              ],
            ),
            const SizedBox(width: 24),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 48),
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
                      columnSpacing: 8,
                      children: [
                        ResponsiveRowColumnItem(
                          child: Text.rich(
                            TextSpan(
                              text: widget.job.role,
                              style: TextStyle(
                                color: widget.job.currentCompany || _isHovered
                                    ? Colors.white
                                    : Colors.white70,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              children: [
                                const TextSpan(
                                  text: " | ",
                                  style: TextStyle(color: Colors.white24),
                                ),
                                TextSpan(
                                  text: widget.job.stack,
                                  style: TextStyle(
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        ResponsiveRowColumnItem(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: activeColor.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              widget.job.period.toUpperCase(),
                              style: TextStyle(
                                color: activeColor,
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(
                      "${widget.job.company} • ${widget.job.location}",
                      style: const TextStyle(
                        color: Color(0xFF94A3B8),
                        fontSize: 14,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 20),
                    ...widget.job.points.map((point) => Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 4),
                                child: Icon(
                                  Icons.check_circle_outline,
                                  color: activeColor.withValues(alpha: 0.5),
                                  size: 16,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  point,
                                  style: TextStyle(
                                    color: widget.job.currentCompany
                                        ? const Color(0xFFCBD5E1)
                                        : const Color(0xFF94A3B8),
                                    fontSize: 15,
                                    height: 1.5,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                    const SizedBox(height: 24),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: widget.job.skills
                          .map((skill) => Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 5,
                                ),
                                decoration: BoxDecoration(
                                  color: activeColor.withValues(alpha: 0.1),
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(
                                    color: activeColor.withValues(alpha: 0.2),
                                    width: 0.5,
                                  ),
                                ),
                                child: Text(
                                  skill,
                                  style: TextStyle(
                                    color: activeColor,
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

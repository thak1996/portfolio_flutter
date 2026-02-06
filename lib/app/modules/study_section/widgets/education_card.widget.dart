import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../../core/styles/colors.dart';
import '../study.model.dart';

class EducationCard extends StatefulWidget {
  const EducationCard({super.key, required this.edu});

  final EducationItemModel edu;

  @override
  State<EducationCard> createState() => _EducationCardState();
}

class _EducationCardState extends State<EducationCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final bool isActive = widget.edu.currentEducation || isHovered;

    final Color highlightColor =
        isActive ? AppColors.primary : const Color(0xFF64748B);

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
      defaultValue: 260.0,
      conditionalValues: [
        const Condition.smallerThan(name: MOBILE, value: 340.0),
      ],
    ).value;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        width: cardWidth,
        height: cardHeight,
        padding: const EdgeInsets.all(32),
        transform: isHovered
            ? Matrix4.translationValues(0, -10, 0)
            : Matrix4.identity(),
        decoration: BoxDecoration(
          color: isHovered
              ? AppColors.bgSlateDeep.withValues(alpha: 0.6)
              : AppColors.bgSlateDeep.withValues(alpha: 0.4),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: isActive
                ? highlightColor.withValues(alpha: 0.8)
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
              ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: highlightColor.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [
                      if (isHovered)
                        BoxShadow(
                          color: highlightColor.withValues(alpha: 0.2),
                          blurRadius: 10,
                        )
                    ],
                  ),
                  child: Icon(widget.edu.icon, color: highlightColor, size: 28),
                ),
                Text(
                  widget.edu.year.toUpperCase(),
                  style: TextStyle(
                    color:
                        isActive ? AppColors.primary : const Color(0xFF64748B),
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Text(
              widget.edu.degree,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                height: 1.3,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              widget.edu.institution,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: isActive
                    ? const Color(0xFFE2E8F0)
                    : const Color(0xFF94A3B8),
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  size: 16,
                  color: highlightColor.withValues(alpha: 0.8),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    widget.edu.location.toUpperCase(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: highlightColor.withValues(alpha: 0.8),
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
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

    final Color highlightColor = isActive //
        ? AppColors.primary
        : const Color(0xFF64748B);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        width: 320,
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: const Color(0xFF0F172A).withValues(alpha: 0.4),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isActive
                ? highlightColor.withValues(alpha: 0.5)
                : const Color(0xFF1E293B),
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: highlightColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(widget.edu.icon, color: highlightColor, size: 30),
                ),
                Text(
                  widget.edu.year.toUpperCase(),
                  style: TextStyle(
                    color: isActive
                        ? AppColors.primary.withValues(alpha: 0.8)
                        : const Color(0xFF64748B),
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Text(
              widget.edu.degree,
              style: TextStyle(
                color: isActive ? Colors.white : Colors.white70,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                height: 1.2,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              widget.edu.institution,
              style: TextStyle(
                color: isActive
                    ? const Color(0xFFCBD5E1)
                    : const Color(0xFF94A3B8),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Icon(
                  widget.edu.icon,
                  size: 16,
                  color: highlightColor.withValues(alpha: 0.7),
                ),
                const SizedBox(width: 8),
                Text(
                  widget.edu.location.toUpperCase(),
                  style: TextStyle(
                    color: highlightColor.withValues(alpha: 0.7),
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0,
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

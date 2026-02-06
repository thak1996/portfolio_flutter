import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio_flutter/app/core/model/section.model.dart';
import '../../core/styles/colors.dart';
import '../../core/utils/url_launcher.helper.dart';
import 'footer.model.dart';

class FooterSection extends StatefulWidget {
  const FooterSection({
    super.key,
    required this.content,
    required this.onAction,
  });

  final FooterModel content;
  final Function(SectionType) onAction;

  @override
  State<FooterSection> createState() => _FooterSectionState();
}

class _FooterSectionState extends State<FooterSection> {
  bool _isGlobalHovered = false;

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;

    return MouseRegion(
      onEnter: (_) => setState(() => _isGlobalHovered = true),
      onExit: (_) => setState(() => _isGlobalHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        decoration: BoxDecoration(
          color: AppColors.backgroundDark.withValues(alpha: 0.8),
          border: Border.all(
            color: _isGlobalHovered
                ? AppColors.primary.withValues(alpha: 0.8)
                : const Color(0xFF1E293B),
            width: _isGlobalHovered ? 2 : 1,
          ),
          boxShadow: [
            if (_isGlobalHovered)
              BoxShadow(
                color: AppColors.primary.withValues(alpha: 0.08),
                blurRadius: 15,
                offset: const Offset(0, -2),
              ),
          ],
        ),
        child: ResponsiveRowColumn(
          layout: isMobile
              ? ResponsiveRowColumnType.COLUMN
              : ResponsiveRowColumnType.ROW,
          rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
          columnMainAxisAlignment: MainAxisAlignment.center,
          columnMainAxisSize: MainAxisSize.min,
          columnSpacing: 20,
          children: [
            ResponsiveRowColumnItem(
              child: _FooterBrand(
                name: widget.content.brandName,
                onTap: () => widget.onAction(SectionType.hero),
              ),
            ),
            ResponsiveRowColumnItem(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: widget.content.socials.asMap().entries.map((entry) {
                  return _FooterSocialIcon(
                    index: entry.key,
                    social: entry.value,
                  );
                }).toList(),
              ),
            ),
            ResponsiveRowColumnItem(
              child: Text(
                widget.content.copyright,
                textAlign: isMobile ? TextAlign.center : TextAlign.end,
                style: const TextStyle(
                  color: Color(0xFF475569),
                  fontSize: 11,
                  letterSpacing: 0.3,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FooterBrand extends StatefulWidget {
  final String name;
  final VoidCallback onTap;

  const _FooterBrand({required this.name, required this.onTap});

  @override
  State<_FooterBrand> createState() => _FooterBrandState();
}

class _FooterBrandState extends State<_FooterBrand> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 300),
          style: TextStyle(
            color: _isHovered ? AppColors.primary : Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.blur_on,
                color: _isHovered ? AppColors.primary : Colors.white70,
                size: 20,
              ),
              const SizedBox(width: 10),
              Text(widget.name),
            ],
          ),
        ),
      ),
    );
  }
}

class _FooterSocialIcon extends StatefulWidget {
  final int index;
  final dynamic social;

  const _FooterSocialIcon({required this.index, required this.social});

  @override
  State<_FooterSocialIcon> createState() => _FooterSocialIconState();
}

class _FooterSocialIconState extends State<_FooterSocialIcon> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final Color activeColor =
        _isHovered ? AppColors.primary : const Color(0xFF475569);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () => openUrl(widget.social.url),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFF0F172A),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: _isHovered ? AppColors.primary : const Color(0xFF1E293B),
                width: 1,
              ),
              boxShadow: [
                if (_isHovered)
                  BoxShadow(
                    color: AppColors.primary.withValues(alpha: 0.2),
                    blurRadius: 10,
                  )
              ],
            ),
            child: Icon(
              widget.social.icon,
              color: activeColor,
              size: 18,
            ),
          ),
        ),
      ),
    ).animate().fadeIn(delay: (widget.index * 80).ms, duration: 400.ms).scale(
          delay: (widget.index * 80).ms,
          begin: const Offset(0.9, 0.9),
          end: const Offset(1, 1),
          curve: Curves.easeOutBack,
        );
  }
}

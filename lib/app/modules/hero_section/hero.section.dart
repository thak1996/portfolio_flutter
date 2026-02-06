import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio_flutter/app/core/utils/url_launcher.helper.dart';
import 'package:portfolio_flutter/app/modules/widgets/primary_button.widget.dart';
import '../../core/model/section.model.dart';
import '../../core/styles/colors.dart';
import 'hero.model.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({
    super.key,
    required this.content,
    required this.onAction,
  });

  final HeroModel content;
  final Function(SectionType) onAction;

  @override
  Widget build(BuildContext context) {
    final breakpoint = ResponsiveBreakpoints.of(context);
    final bool isMobile = breakpoint.isMobile;

    return ResponsiveRowColumn(
      layout: isMobile
          ? ResponsiveRowColumnType.COLUMN
          : ResponsiveRowColumnType.ROW,
      rowCrossAxisAlignment: CrossAxisAlignment.center,
      columnCrossAxisAlignment: CrossAxisAlignment.center,
      columnMainAxisSize: MainAxisSize.min,
      columnSpacing: 40,
      children: [
        ResponsiveRowColumnItem(
          rowFlex: 3,
          child: Column(
            crossAxisAlignment:
                isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                textAlign: isMobile ? TextAlign.center : TextAlign.start,
                text: TextSpan(
                  style: TextStyle(
                    fontSize: isMobile ? 38 : 55,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                    height: 1.1,
                  ),
                  children: [
                    TextSpan(text: content.tagline),
                    TextSpan(
                      text: content.taglineHighlight,
                      style: TextStyle(color: AppColors.primary),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text(
                content.description,
                textAlign: isMobile ? TextAlign.center : TextAlign.start,
                style: const TextStyle(
                  color: Colors.white60,
                  fontSize: 18,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: isMobile
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.start,
                children: [
                  PrimaryButton(
                    label: content.actions[0].label,
                    isPrimary: content.actions[0].isPrimary,
                    onPressed: () => onAction(SectionType.projects),
                  ),
                  const SizedBox(width: 15),
                  PrimaryButton(
                    label: content.actions[1].label,
                    isPrimary: content.actions[1].isPrimary,
                    onPressed: () => onAction(SectionType.contact),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: isMobile
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.start,
                children: content.socials.asMap().entries.map((entry) {
                  return _SocialIcon(
                    index: entry.key,
                    social: entry.value,
                  );
                }).toList(),
              ),
            ],
          ),
        ),
        if (!isMobile)
          const ResponsiveRowColumnItem(child: SizedBox(width: 60)),
        ResponsiveRowColumnItem(
          rowFlex: 2,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: isMobile ? 200 : 300,
                height: isMobile ? 200 : 300,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withValues(alpha: 0.3),
                      blurRadius: isMobile ? 60 : 100,
                      spreadRadius: isMobile ? 20 : 50,
                    )
                  ],
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Image.network(
                  content.profileImageUrl,
                  height: isMobile ? 300 : 450,
                  width: isMobile ? 300 : null,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _SocialIcon extends StatefulWidget {
  final int index;
  final dynamic social;

  const _SocialIcon({required this.index, required this.social});

  @override
  State<_SocialIcon> createState() => _SocialIconState();
}

class _SocialIconState extends State<_SocialIcon> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final Color activeColor =
        _isHovered ? AppColors.primary : const Color(0xFF475569);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () => openUrl(widget.social.url),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFF1E293B),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: _isHovered ? AppColors.primary : Colors.transparent,
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
              size: 20,
            ),
          ),
        ),
      ),
    )
        .animate()
        .fadeIn(delay: (widget.index * 150).ms, duration: 400.ms) //
        .scale(
          delay: (widget.index * 150).ms,
          begin: const Offset(0.7, 0.7),
          end: const Offset(1, 1),
          curve: Curves.bounceIn,
        );
  }
}

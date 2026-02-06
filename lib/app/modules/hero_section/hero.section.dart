import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
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
                children: content.socials
                    .map((social) => Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.white10,
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              onPressed: () => openUrl(social.url),
                              icon: Icon(social.icon, color: Colors.white70),
                            ),
                          ),
                        ))
                    .toList(),
              ),
            ],
          ),
        ),
        if (!isMobile)
          const ResponsiveRowColumnItem(
            child: SizedBox(width: 60),
          ),
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

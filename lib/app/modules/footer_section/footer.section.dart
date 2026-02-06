import 'package:flutter/material.dart';
import 'package:portfolio_flutter/app/core/model/section.model.dart';
import 'package:responsive_framework/responsive_framework.dart';
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
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;

    final bool isActive = _isHovered;

    final Color activeColor = isActive //
        ? AppColors.primary
        : Color(0xFF475569);

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.basic,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        decoration: BoxDecoration(
          color: AppColors.backgroundDark,
          border: Border.all(color: Color(0xFF1E293B), width: 1),
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
              child: InkWell(
                hoverColor: Colors.transparent,
                onTap: () => widget.onAction(SectionType.hero),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.blur_on, color: AppColors.primary, size: 28),
                    Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Text(
                        widget.content.brandName,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ResponsiveRowColumnItem(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: widget.content.socials.map((social) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: InkWell(
                      onTap: () => openUrl(social.url),
                      borderRadius: BorderRadius.circular(8),
                      customBorder: Border.all(
                        color: activeColor,
                        width: 1,
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1E293B),
                          borderRadius: BorderRadius.circular(8),
                          border: isActive
                              ? Border.all(
                                  color: activeColor,
                                  width: 1,
                                )
                              : Border.all(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                        ),
                        child: Icon(
                          social.icon,
                          color: activeColor,
                          size: 18,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            ResponsiveRowColumnItem(
              child: Text(
                widget.content.copyright,
                textAlign: isMobile ? TextAlign.center : TextAlign.end,
                style: TextStyle(color: Color(0xFF475569), fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

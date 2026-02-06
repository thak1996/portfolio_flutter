import 'package:flutter/material.dart';
import 'package:portfolio_flutter/app/core/model/section.model.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../core/styles/colors.dart';
import '../../core/utils/url_launcher.helper.dart';
import 'footer.model.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({
    super.key,
    required this.content,
    required this.onAction,
  });

  final FooterModel content;
  final Function(SectionType) onAction;

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      decoration: const BoxDecoration(
        color: AppColors.backgroundDark,
        border: Border(
          top: BorderSide(color: Color(0xFF1E293B), width: 1),
        ),
      ),
      child: Flex(
        direction: isMobile ? Axis.vertical : Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () => onAction(SectionType.hero),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.blur_on, color: AppColors.primary, size: 28),
                const SizedBox(width: 12),
                Text(
                  content.brandName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
          ),
          if (isMobile) const SizedBox(height: 24),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: content.socials.map((social) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: InkWell(
                  onTap: () => openUrl(social.url),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1E293B),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      social.icon,
                      color: const Color(0xFF64748B),
                      size: 20,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          if (isMobile) const SizedBox(height: 24),
          Text(
            content.copyright,
            style: const TextStyle(
              color: Color(0xFF475569),
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

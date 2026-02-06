import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:portfolio_flutter/app/core/model/section.model.dart';
import '../../core/data/portfolio.data.dart';
import '../../core/styles/colors.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final Function(SectionType) onSectionClick;

  const AppBarWidget({super.key, required this.onSectionClick});

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.bgDeep.withValues(alpha: 0.8),
            border: Border(
              bottom: BorderSide(color: AppColors.borderColor, width: 1),
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SafeArea(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1200),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () => onSectionClick(SectionType.hero),
                      child: Row(
                        children: [
                          Icon(
                            Icons.blur_on,
                            color: AppColors.primary,
                            size: 28,
                          ),
                          ResponsiveVisibility(
                            visible: false,
                            visibleConditions: [
                              const Condition<bool>.largerThan(
                                name: MOBILE,
                                value: true,
                              )
                            ],
                            replacement: const SizedBox.shrink(),
                            child: const Padding(
                              padding: EdgeInsets.only(left: 12),
                              child: Text(
                                "Franklyn Viana dos Santos",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ResponsiveVisibility(
                          visible: false,
                          visibleConditions: [
                            const Condition<bool>.largerThan(
                              name: TABLET,
                              value: true,
                            )
                          ],
                          replacement: const SizedBox.shrink(),
                          child: Row(
                            children: portfolioSections
                                .where((s) => s.title.isNotEmpty)
                                .map((section) => TextButton(
                                      onPressed: () =>
                                          onSectionClick(section.id),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 10,
                                        ),
                                        child: Text(
                                          section.title,
                                          style: const TextStyle(
                                            color: Colors.white70,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ))
                                .toList(),
                          ),
                        ),
                        ResponsiveValue<Widget?>(
                              context,
                              defaultValue: null,
                              conditionalValues: [
                                Condition.smallerThan(
                                  name: DESKTOP,
                                  value: IconButton(
                                    onPressed: () =>
                                        Scaffold.of(context).openEndDrawer(),
                                    icon: const Icon(
                                      Icons.menu,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ).value ??
                            const SizedBox.shrink(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

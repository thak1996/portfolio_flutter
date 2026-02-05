import 'dart:ui';
import 'package:flutter/material.dart';
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
            color: AppColors.bgDeep,
            border: Border(
              bottom: BorderSide(
                color: AppColors.borderDark,
                width: 1,
              ),
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: SafeArea(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1200),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Franklyn Viana dos Santos",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        ...portfolioSections
                            .where((s) => s.title.isNotEmpty)
                            .map(
                              (section) => TextButton(
                                onPressed: () => onSectionClick(section.id),
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
                              ),
                            ),
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

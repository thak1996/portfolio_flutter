import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../styles/colors.dart';
import '../utils/app_lang.helper.dart';
import 'locale.controller.dart';

class LocaleToggleWidget extends StatefulWidget {
  const LocaleToggleWidget({super.key});

  @override
  State<LocaleToggleWidget> createState() => _LocaleToggleWidgetState();
}

class _LocaleToggleWidgetState extends State<LocaleToggleWidget> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final langCtrl = context.watch<LocaleController>();
    final isPt = langCtrl.lang == AppLang.pt;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => langCtrl.toggle(),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: _isHovered
                    ? AppColors.primary.withValues(alpha: 0.15)
                    : Colors.white.withValues(alpha: 0.05),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: _isHovered
                      ? AppColors.primary.withValues(alpha: 0.8)
                      : AppColors.primary.withValues(alpha: 0.2),
                  width: _isHovered ? 1.5 : 1,
                ),
                boxShadow: [
                  if (_isHovered)
                    BoxShadow(
                      color: AppColors.primary.withValues(alpha: 0.3),
                      blurRadius: 12,
                      spreadRadius: -2,
                    ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.language,
                    size: 16,
                    color: _isHovered ? Colors.white : AppColors.primary,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    isPt ? "PT-BR" : "EN-US",
                    style: TextStyle(
                      color: _isHovered ? Colors.white : Colors.white70,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      letterSpacing: 1.1,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

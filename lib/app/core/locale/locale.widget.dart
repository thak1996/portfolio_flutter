import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../styles/colors.dart';
import '../utils/app_lang.helper.dart';
import 'locale.controller.dart';

class LocaleToggleWidget extends StatelessWidget {
  const LocaleToggleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final langCtrl = context.watch<LocaleController>();
    final isPt = langCtrl.lang == AppLang.pt;

    return InkWell(
      onTap: () => langCtrl.toggle(),
      borderRadius: BorderRadius.circular(8),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.primary.withValues(alpha: 0.5)),
          borderRadius: BorderRadius.circular(8),
          color: AppColors.primary.withValues(alpha: 0.05),
        ),
        child: Text(
          isPt ? "PT" : "EN",
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}

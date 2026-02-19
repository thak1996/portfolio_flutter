import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../core/data/portfolio.data.dart';
import '../../core/locale/locale.widget.dart';
import '../../core/model/section.model.dart';
import '../../core/styles/colors.dart';

class AppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  final Function(SectionType) onSectionClick;

  const AppBarWidget({super.key, required this.onSectionClick});

  @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  bool _isAppBarHovered = false;

  @override
  Widget build(BuildContext context) {
    final breakpoint = ResponsiveBreakpoints.of(context);
   final sections = getPortfolioSections(context, {});

    return MouseRegion(
      onEnter: (_) => setState(() => _isAppBarHovered = true),
      onExit: (_) => setState(() => _isAppBarHovered = false),
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: 80,
            decoration: BoxDecoration(
              color: AppColors.bgDeep.withValues(alpha: 0.8),
              border: Border(
                bottom: BorderSide(
                  color: _isAppBarHovered
                      ? AppColors.primary.withValues(alpha: 0.8)
                      : const Color(0xFF1E293B),
                  width: _isAppBarHovered ? 2 : 1,
                ),
              ),
              boxShadow: [
                if (_isAppBarHovered)
                  BoxShadow(
                    color: AppColors.primary.withValues(alpha: 0.15),
                    blurRadius: 20,
                    offset: const Offset(0, 4),
                  ),
              ],
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1200),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _NavBrand(
                      onTap: () => widget.onSectionClick(SectionType.hero),
                    ),

                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (breakpoint.isDesktop)
                          Row(
                            children: sections
                                .where((s) => s.title.isNotEmpty)
                                .map(
                                  (section) => _NavBarItem(
                                    title: section.title,
                                    onTap: () =>
                                        widget.onSectionClick(section.id),
                                  ),
                                )
                                .toList(),
                          ),

                        const SizedBox(width: 16),

                        LocaleToggleWidget(),

                        if (!breakpoint.isDesktop) ...[
                          const SizedBox(width: 8),
                          IconButton(
                            onPressed: () =>
                                Scaffold.of(context).openEndDrawer(),
                            icon: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: AppColors.primary.withValues(alpha: 0.1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Icon(
                                Icons.menu,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ),
                        ],
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

class _NavBrand extends StatefulWidget {
  final VoidCallback onTap;
  const _NavBrand({required this.onTap});

  @override
  State<_NavBrand> createState() => _NavBrandState();
}

class _NavBrandState extends State<_NavBrand> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final bool isMobile = ResponsiveBreakpoints.of(context).isMobile;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: _isHovered
                    ? AppColors.primary.withValues(alpha: 0.2)
                    : AppColors.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                Icons.blur_on,
                color: _isHovered ? Colors.white : AppColors.primary,
                size: 24,
              ),
            ),
            if (!isMobile) ...[
              const SizedBox(width: 12),
              AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 300),
                style: TextStyle(
                  color: _isHovered
                      ? Colors.white
                      : Colors.white.withValues(alpha: 0.9),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -0.5,
                ),
                child: const Text("Franklyn Viana dos Santos"),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _NavBarItem extends StatefulWidget {
  final String title;
  final VoidCallback onTap;

  const _NavBarItem({required this.title, required this.onTap});

  @override
  State<_NavBarItem> createState() => _NavBarItemState();
}

class _NavBarItemState extends State<_NavBarItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        cursor: SystemMouseCursors.click,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 200),
                style: TextStyle(
                  color: _isHovered ? AppColors.primary : Colors.white70,
                  fontSize: 14,
                  fontWeight: _isHovered ? FontWeight.bold : FontWeight.w500,
                  letterSpacing: 0.5,
                ),
                child: Text(widget.title),
              ),
              const SizedBox(height: 4),
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height: 2,
                width: _isHovered ? 20 : 0,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(2),
                  boxShadow: [
                    if (_isHovered)
                      BoxShadow(
                        color: AppColors.primary.withValues(alpha: 0.8),
                        blurRadius: 8,
                      )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

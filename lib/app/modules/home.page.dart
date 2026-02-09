import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../core/data/portfolio.data.dart';
import '../core/model/section.model.dart';
import '../core/styles/colors.dart';
import 'widgets/appbar.widget.dart';
import 'widgets/section.widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ValueNotifier<Offset> _mousePos = ValueNotifier(const Offset(0, 0));
  final ScrollController _scrollController = ScrollController();

  final Map<SectionType, GlobalKey> _sectionKeys = {
    for (var type in SectionType.values) type: GlobalKey(),
  };

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final sectionIdName =
          GoRouterState.of(context).uri.queryParameters['section'];
      if (sectionIdName != null) {
        try {
          final id = SectionType.values.byName(sectionIdName);
          _scrollToSection(id);
        } catch (_) {}
      }
    });
  }

  void _scrollToSection(SectionType id) {
    final key = _sectionKeys[id];
    if (key?.currentContext != null) {
      Scrollable.ensureVisible(
        key!.currentContext!,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOutQuart,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final sections = getPortfolioSections(context, _sectionKeys);

    final breakpoint = ResponsiveBreakpoints.of(context);
    final isDesktop = breakpoint.isDesktop;

    return Scaffold(
      backgroundColor: AppColors.bgDeep,
      appBar: AppBarWidget(onSectionClick: (id) => _scrollToSection(id)),
      endDrawer: Drawer(
        backgroundColor: AppColors.bgDeep,
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 40),
              ...sections.where((s) => s.title.isNotEmpty).map(
                    (section) => ListTile(
                      title: Text(
                        section.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                        _scrollToSection(section.id);
                      },
                    ),
                  ),
            ],
          ),
        ),
      ),
      body: MouseRegion(
        onHover: (event) => _mousePos.value = event.localPosition,
        child: Stack(
          children: [
            if (isDesktop)
              ValueListenableBuilder(
                valueListenable: _mousePos,
                builder: (context, pos, _) {
                  return Positioned(
                    left: pos.dx - 450,
                    top: pos.dy - 450,
                    child: Container(
                      width: 900,
                      height: 900,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: RadialGradient(
                          colors: [
                            AppColors.primary.withValues(alpha: 0.12),
                            AppColors.primary.withValues(alpha: 0.04),
                            Colors.transparent,
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            LayoutBuilder(
              builder: (context, constraints) {
                final double viewportHeight = constraints.maxHeight;
                return SingleChildScrollView(
                  controller: _scrollController,
                  child: Column(
                    children: sections.map((section) {
                      final double? sectionHeight =
                          (isDesktop && section.heightFactor > 0)
                              ? viewportHeight * section.heightFactor
                              : null;
                      return SizedBox(
                        key: section.key,
                        width: double.infinity,
                        height: sectionHeight,
                        child: SectionWidget(
                          model: section,
                          onAction: (id) => _scrollToSection(id),
                        ),
                      );
                    }).toList(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

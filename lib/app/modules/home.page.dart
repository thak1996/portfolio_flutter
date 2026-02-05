import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgSlateDeep,
      appBar: AppBarWidget(onSectionClick: (id) => _scrollToSection(id)),
      body: MouseRegion(
        onHover: (event) => _mousePos.value = event.localPosition,
        child: Stack(
          children: [
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
                    children: portfolioSections.map((section) {
                      return SizedBox(
                        key: section.key,
                        width: double.infinity,
                        height: section.heightFactor > 0
                            ? viewportHeight * section.heightFactor
                            : null,
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

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final sectionIdName = GoRouterState.of(context) //
          .uri
          .queryParameters['section'];
      if (sectionIdName != null) {
        try {
          final id = SectionType.values.byName(sectionIdName);
          _scrollToSection(id);
        } catch (_) {}
      }
    });
  }

  void _scrollToSection(SectionType id) {
    try {
      final section = portfolioSections.firstWhere((s) => s.id == id);

      if (section.key.currentContext != null) {
        Scrollable.ensureVisible(
          section.key.currentContext!,
          duration: const Duration(seconds: 1),
          curve: Curves.easeInOutQuart,
        );
      }
    } catch (e) {
      debugPrint("Section $id not found");
    }
  }
}

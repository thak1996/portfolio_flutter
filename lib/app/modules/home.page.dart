import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../core/data/portfolio.data.dart';
import '../core/model/section.model.dart';
import 'widgets/section.widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text("FDS Dev",
            style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white.withValues(alpha: 0.8),
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        actions: [
          ...portfolioSections.map((section) => TextButton(
                onPressed: () {
                  context.go('/?section=${section.id.name}');
                  _scrollToSection(section.id);
                },
                child: Text(
                  section.title.toUpperCase(),
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w600),
                ),
              )),
          const SizedBox(width: 20),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final double viewportHeight = constraints.maxHeight;

          return SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                // const SizedBox(height: kToolbarHeight + 20),
                ...portfolioSections.map((section) {
                  return SizedBox(
                    key: section.key,
                    width: double.infinity,
                    height: section.heightFactor > 0
                        ? viewportHeight * section.heightFactor
                        : null,
                    child: SectionBuilder(model: section),
                  );
                })
              ],
            ),
          );
        },
      ),
    );
  }
}

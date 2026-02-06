import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'study.model.dart';
import 'widgets/education_card.widget.dart';

class StudySection extends StatelessWidget {
  const StudySection({
    super.key,
    required this.content,
    required this.padding,
  });

  final StudyModel content;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    final breakpoint = ResponsiveBreakpoints.of(context);

    final double horizontalPadding = ResponsiveValue<double>(
      context,
      defaultValue: 20.0,
      conditionalValues: [
        const Condition.largerThan(name: MOBILE, value: 40.0),
        const Condition.largerThan(name: TABLET, value: 0.0),
      ],
    ).value;

    return Padding(
      padding: EdgeInsets.only(
        bottom: padding.bottom,
        left: horizontalPadding,
        right: horizontalPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            content.sectionTitle,
            style: TextStyle(
              color: Colors.white,
              fontSize: breakpoint.isMobile ? 32 : 42,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 48),
          SizedBox(
            width: double.infinity,
            child: Wrap(
              spacing: 24,
              runSpacing: 24,
              alignment: breakpoint.isMobile
                  ? WrapAlignment.center
                  : WrapAlignment.start,
              children: content.history.map((edu) {
                return ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: breakpoint.isMobile ? double.infinity : 400,
                  ),
                  child: EducationCard(edu: edu),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'study.model.dart';
import 'widgets/education_card.widget.dart';

class StudySection extends StatelessWidget {
  const StudySection({super.key, required this.content});

  final StudyModel content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 60, bottom: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Formação Acadêmica",
            style: TextStyle(
              color: Colors.white,
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 48),
          Align(
            alignment: Alignment.center,
            child: Wrap(
              spacing: 24,
              runSpacing: 24,
              children: content.history.map((edu) {
                return EducationCard(edu: edu);
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

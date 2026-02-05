import 'package:flutter/material.dart';
import '../../core/styles/colors.dart';
import 'skill.model.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({
    super.key,
    required this.content,
    required this.padding,
  });

  final SkillsModel content;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: padding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Habilidades",
              style: TextStyle(
                color: Colors.white,
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 48),
            Wrap(
              spacing: 80,
              runSpacing: 40,
              children: [
                _buildHardSkillsColumn(),
                _buildSoftSkillsColumn(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHardSkillsColumn() {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 500),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCategoryHeader(Icons.code, "Hard Skills"),
          const SizedBox(height: 32),
          _buildSubCategoryDivider("Linguagens de Programação"),
          ...content.programmingLanguages
              .map((skill) => _buildProgressBar(skill)),
          const SizedBox(height: 32),
          _buildSubCategoryDivider("Ferramentas & Tecnologias"),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: content.tools
                .map((tool) => _buildTag(tool, isOutline: false))
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildSoftSkillsColumn() {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 500),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCategoryHeader(Icons.psychology_outlined, "Soft Skills"),
          const SizedBox(height: 32),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            children: content.softSkills
                .map((soft) => _buildSoftSkillCard(soft))
                .toList(),
          ),
          const SizedBox(height: 48),
          _buildSubCategoryDivider("STRATEGIC AREAS"),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: content.strategicAreas
                .map((area) => _buildTag(area, isOutline: true))
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryHeader(IconData icon, String title) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: AppColors.primary, size: 20),
        ),
        const SizedBox(width: 12),
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildSubCategoryDivider(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Row(
        children: [
          Container(width: 20, height: 1, color: Colors.white24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.white38,
                fontSize: 12,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 1,
              color: Colors.white24,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressBar(HardSkillModel skill) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                skill.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "${(skill.level * 100).toInt()}%",
                style: TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: skill.level,
              minHeight: 8,
              backgroundColor: const Color(0xFF1E293B),
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSoftSkillCard(SoftSkillModel soft) {
    return Container(
      width: 235,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF0F172A).withValues(alpha: 0.4),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF1E293B)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(soft.icon, color: AppColors.primary, size: 28),
          const SizedBox(height: 16),
          Text(
            soft.title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            soft.description,
            style: const TextStyle(
              color: Color(0xFF94A3B8),
              fontSize: 13,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTag(String label, {required bool isOutline}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isOutline ? Colors.transparent : const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(8),
        border: isOutline ? Border.all(color: Colors.white10) : null,
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isOutline ? Colors.white38 : Colors.white70,
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

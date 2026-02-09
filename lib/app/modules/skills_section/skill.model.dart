import 'package:flutter/material.dart';

class SkillsModel {
  final String sectionTitle;
  final List<HardSkillModel> programmingLanguages;
  final List<SoftSkillModel> softSkills;
  final List<SkillCategoryModel> skillCategories;

  SkillsModel({
    required this.programmingLanguages,
    required this.softSkills,
    required this.sectionTitle,
    required this.skillCategories,
  });
}

class HardSkillModel {
  final String name;
  final double level;

  HardSkillModel({
    required this.name,
    this.level = 0.0,
  });
}

class SkillCategoryModel {
  final String title;
  final List<String> items;

  SkillCategoryModel({
    required this.title,
    required this.items,
  });
}

class SoftSkillModel {
  final String title;
  final String description;
  final IconData icon;

  SoftSkillModel({
    required this.title,
    required this.description,
    required this.icon,
  });
}

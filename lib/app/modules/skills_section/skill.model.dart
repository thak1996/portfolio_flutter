import 'package:flutter/material.dart';

class SkillsModel {
  final List<HardSkillModel> programmingLanguages;
  final List<String> tools;
  final List<SoftSkillModel> softSkills;
  final List<String> strategicAreas;

  SkillsModel({
    required this.programmingLanguages,
    required this.tools,
    required this.softSkills,
    required this.strategicAreas,
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

import 'package:flutter/material.dart';

class ExperienceModel {
  ExperienceModel({required this.sectionLabel, required this.jobs});

  final List<ExperienceItemModel> jobs;
  final String sectionLabel;
}

class ExperienceItemModel {
  ExperienceItemModel({
    required this.role,
    required this.company,
    required this.period,
    required this.location,
    required this.points,
    this.icon = Icons.work,
  });

  final String company;
  final IconData icon;
  final String location;
  final String period;
  final List<String> points;
  final String role;
}

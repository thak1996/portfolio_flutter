import 'package:flutter/material.dart';

class ExperienceModel {
  ExperienceModel({required this.jobs});

  final List<ExperienceItemModel> jobs;
}

class ExperienceItemModel {
  ExperienceItemModel({
    required this.role,
    required this.stack,
    required this.company,
    required this.period,
    required this.location,
    required this.points,
    required this.skills,
    this.currentCompany = false,
    this.icon = Icons.work,
  });

  final String company;
  final IconData icon;
  final String location;
  final String period;
  final List<String> points;
  final List<String> skills;
  final String role;
  final String stack;
  final bool currentCompany;
}

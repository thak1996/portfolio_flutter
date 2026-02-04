import 'package:flutter/material.dart';

class StudyModel {
  final String sectionLabel;
  final List<EducationItemModel> history;

  StudyModel({
    required this.sectionLabel,
    required this.history,
  });
}

class EducationItemModel {
  final String year;
  final String degree;
  final String institution;
  final String location;
  final IconData icon;

  EducationItemModel({
    required this.year,
    required this.degree,
    required this.institution,
    required this.location,
    required this.icon,
  });
}

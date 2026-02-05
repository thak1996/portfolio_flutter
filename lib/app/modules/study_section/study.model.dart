import 'package:flutter/material.dart';

class StudyModel {
  StudyModel({required this.history});

  final List<EducationItemModel> history;
  final String sectionTitle = "Formação Acadêmica";
}

class EducationItemModel {
  EducationItemModel({
    required this.year,
    required this.degree,
    required this.institution,
    required this.location,
    required this.icon,
    this.currentEducation = false,
  });

  final bool currentEducation;
  final String degree;
  final IconData icon;
  final String institution;
  final String location;
  final String year;
}

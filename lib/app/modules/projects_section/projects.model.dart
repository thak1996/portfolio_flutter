import 'package:flutter/material.dart';

class ProjectsModel {
  final String sectionLabel;
  final List<ProjectItemModel> projects;

  ProjectsModel({
    required this.sectionLabel,
    required this.projects,
  });
}

class ProjectItemModel {
  final String title;
  final String description;
  final String imageUrl;
  final String categoryLabel;
  final List<String> technologies;
  final VoidCallback? onTap;

  ProjectItemModel({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.categoryLabel,
    required this.technologies,
    this.onTap,
  });
}

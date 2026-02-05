import 'package:flutter/material.dart';

class ProjectsModel {
  final String sectionTitle;
  final List<ProjectItemModel> projects;

  ProjectsModel({
    required this.sectionTitle,
    required this.projects,
  });
}

class ProjectItemModel {
  final String title;
  final String description;
  final String? imageUrl;
  final String urlProject;
  final String? categoryLabel;
  final List<String> technologies;
  final VoidCallback? onTap;

  ProjectItemModel({
    required this.title,
    required this.description,
    this.imageUrl,
    required this.urlProject,
    this.categoryLabel,
    required this.technologies,
    this.onTap,
  });
}

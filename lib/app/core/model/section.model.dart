import 'package:flutter/material.dart';
import 'section.sealed.dart';

enum SectionType {
  hero,
  experience,
  skills,
  study,
  projects,
  contact,
  footer,
}

class SectionModel {
  final SectionType id;
  final String title;
  final Color backgroundColor;
  final double heightFactor;
  final GlobalKey key;
  final SectionSealed data;

  SectionModel({
    required this.id,
    required this.title,
    required this.backgroundColor,
    this.heightFactor = 0,
    required this.data,
    required this.key,
  });
}

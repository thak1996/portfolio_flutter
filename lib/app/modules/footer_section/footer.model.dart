import 'package:flutter/material.dart';

class FooterModel {
  final String bio;
  final String copyright;
  final List<SocialLinkModel> socials;
  final List<FooterColumn> columns;

  FooterModel({
    required this.bio,
    required this.copyright,
    required this.socials,
    required this.columns,
  });
}

class SocialLinkModel {
  final IconData icon;
  final String url;

  SocialLinkModel({required this.icon, required this.url});
}

class FooterColumn {
  final String title;
  final List<FooterLink> links;

  FooterColumn({required this.title, required this.links});
}

class FooterLink {
  final String label;
  final String url;

  FooterLink({required this.label, required this.url});
}

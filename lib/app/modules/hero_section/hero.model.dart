import 'package:flutter/material.dart';

class HeroModel {
  HeroModel({
    required this.tagline,
    required this.taglineHighlight,
    required this.description,
    required this.profileImageUrl,
    required this.actions,
    required this.socials,
  });

  final List<HeroCTA> actions;
  final String description;
  final String profileImageUrl;
  final List<SocialIcon> socials;
  final String tagline;
  final String taglineHighlight;
}

class HeroCTA {
  HeroCTA(this.label, {this.isPrimary = false});

  final bool isPrimary;
  final String label;
}

class SocialIcon {
  SocialIcon(this.icon, this.url);

  final IconData icon;
  final String url;
}

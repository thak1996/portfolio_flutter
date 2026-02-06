import 'package:flutter/material.dart';

class FooterModel {
  final String brandName;
  final String copyright;
  final List<SocialLinkModel> socials;

  FooterModel({
    required this.brandName,
    required this.copyright,
    required this.socials,
  });
}

class SocialLinkModel {
  final IconData icon;
  final String url;

  SocialLinkModel({required this.icon, required this.url});
}

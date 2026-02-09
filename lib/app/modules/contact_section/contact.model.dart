import 'package:flutter/material.dart';

class ContactModel {
  final String title;
  final String subtitle;
  final String description;
  final List<ContactInfoItem> infoItems;
  final ContactFormLabels formLabels;

  ContactModel({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.infoItems,
    required this.formLabels,
  });
}

class ContactInfoItem {
  final String title;
  final String value;
  final IconData icon;

  ContactInfoItem({
    required this.title,
    required this.value,
    required this.icon,
  });
}

class ContactFormLabels {
  final String nameLabel;
  final String nameHint;
  final String emailLabel;
  final String emailHint;
  final String phoneLabel;
  final String phoneHint;
  final String subjectLabel;
  final String subjectHint;
  final String messageLabel;
  final String messageHint;
  final String submitButtonText;
  final String successMessage;
  final String errorMessage;

  ContactFormLabels({
    required this.nameLabel,
    required this.nameHint,
    required this.emailLabel,
    required this.emailHint,
    required this.phoneLabel,
    required this.phoneHint,
    required this.subjectLabel,
    required this.subjectHint,
    required this.messageLabel,
    required this.messageHint,
    required this.submitButtonText,
    required this.successMessage,
    required this.errorMessage,
  });
}

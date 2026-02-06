import 'package:flutter/material.dart';

class ContactModel {
  final String title;
  final String description;
  final List<ContactInfoItem> infoItems;
  final ContactFormLabels formLabels;

  ContactModel({
    required this.title,
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
  final String emailLabel;
  final String phoneLabel;
  final String subjectLabel;
  final String messageLabel;
  final String submitButtonText;

  ContactFormLabels({
    this.nameLabel = "Nome Completo",
    this.emailLabel = "Email",
    this.phoneLabel = "Telefone",
    this.subjectLabel = "Assunto",
    this.messageLabel = "Mensagem",
    this.submitButtonText = "Enviar Mensagem",
  });
}

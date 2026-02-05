import 'package:flutter/material.dart';
import 'contact.model.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({
    super.key,
    required this.content,
    required this.padding,
  });

  final ContactModel content;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

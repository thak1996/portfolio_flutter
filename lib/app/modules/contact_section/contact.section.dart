import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../core/styles/colors.dart';
import '../widgets/primary_button.widget.dart';
import 'contact.model.dart';
import 'contact.controller.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({
    super.key,
    required this.content,
    required this.padding,
  });

  final ContactModel content;
  final EdgeInsets padding;

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _subjectCtrl = TextEditingController();
  final _messageCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ContactController>();
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;

    return Padding(
      padding: EdgeInsetsGeometry.only(bottom: widget.padding.bottom),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.content.title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 42,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 48),
          Flex(
            direction: isMobile ? Axis.vertical : Axis.horizontal,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: isMobile ? 0 : 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Vamos discutir seu próximo projeto",
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.9),
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      widget.content.description,
                      style: const TextStyle(
                        color: Color(0xFF94A3B8),
                        fontSize: 16,
                        height: 1.6,
                      ),
                    ),
                    const SizedBox(height: 40),
                    ...widget.content.infoItems.map(
                      (item) => _buildInfoTile(item),
                    ),
                  ],
                ),
              ),
              if (!isMobile) const SizedBox(width: 80),
              if (isMobile) const SizedBox(height: 48),
              Expanded(
                flex: isMobile ? 0 : 1,
                child: Container(
                  padding: const EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    color: AppColors.bgSlateDeep,
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: const Color(0xFF1E293B)),
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: _buildInput(
                                widget.content.formLabels.nameLabel,
                                _nameCtrl,
                                "João Silva",
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: _buildInput(
                                widget.content.formLabels.emailLabel,
                                _emailCtrl,
                                "joao@exemplo.com",
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        _buildInput(
                          widget.content.formLabels.subjectLabel,
                          _subjectCtrl,
                          "Consulta de Projeto",
                        ),
                        const SizedBox(height: 24),
                        _buildInput(
                          "Mensagem",
                          _messageCtrl,
                          "Conte-me sobre o seu projeto...",
                          maxLines: 5,
                        ),
                        const SizedBox(height: 32),
                        SizedBox(
                          width: double.infinity,
                          height: 56,
                          child: controller.isLoading
                              ? Center(
                                  child: CircularProgressIndicator(
                                    color: AppColors.primary,
                                  ),
                                )
                              : PrimaryButton(
                                  label: widget
                                      .content.formLabels.submitButtonText,
                                  isPrimary: true,
                                  onPressed: () => _handleSend(controller),
                                ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInput(
    String label,
    TextEditingController ctrl,
    String hint, {
    int maxLines = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 10),
        TextFormField(
          controller: ctrl,
          maxLines: maxLines,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Color(0xFF475569)),
            filled: true,
            fillColor: const Color(0xFF1E293B).withValues(alpha: 0.5),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInfoTile(ContactInfoItem item) => Padding(
        padding: const EdgeInsets.only(bottom: 24),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFF1E293B),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(item.icon, color: AppColors.primary, size: 24),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  item.value,
                  style: const TextStyle(
                    color: Color(0xFF94A3B8),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ],
        ),
      );

  void _handleSend(ContactController controller) async {
    if (_formKey.currentState!.validate()) {
      final ok = await controller.send(
        _nameCtrl.text,
        _emailCtrl.text,
        _subjectCtrl.text,
        _messageCtrl.text,
      );
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(ok ? "Enviado!" : "Erro!"),
            backgroundColor: ok ? Colors.green : Colors.red,
          ),
        );
      }
    }
  }
}

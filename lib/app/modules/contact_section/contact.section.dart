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
  void dispose() {
    _nameCtrl.dispose();
    _emailCtrl.dispose();
    _subjectCtrl.dispose();
    _messageCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ContactController>();
    final breakpoint = ResponsiveBreakpoints.of(context);

    final double horizontalPadding = ResponsiveValue<double>(
      context,
      defaultValue: 20.0,
      conditionalValues: [
        const Condition.largerThan(name: MOBILE, value: 40.0),
        const Condition.largerThan(name: TABLET, value: 0.0),
      ],
    ).value;

    return Padding(
      padding: EdgeInsets.only(
        bottom: widget.padding.bottom,
        left: horizontalPadding,
        right: horizontalPadding,
        top: 36,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.content.title,
            style: TextStyle(
              color: Colors.white,
              fontSize: breakpoint.isMobile ? 32 : 42,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 48),
          ResponsiveRowColumn(
            layout: breakpoint.smallerThan(DESKTOP)
                ? ResponsiveRowColumnType.COLUMN
                : ResponsiveRowColumnType.ROW,
            rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
            rowCrossAxisAlignment: CrossAxisAlignment.start,
            columnSpacing: 48,
            children: [
              ResponsiveRowColumnItem(
                rowFlex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Vamos discutir seu próximo projeto",
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.9),
                        fontSize: breakpoint.isMobile ? 20 : 24,
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
                    ...widget.content.infoItems
                        .map((item) => _buildInfoTile(item)),
                  ],
                ),
              ),
              if (breakpoint.isDesktop)
                const ResponsiveRowColumnItem(child: SizedBox(width: 80)),
              ResponsiveRowColumnItem(
                rowFlex: 1,
                child: Container(
                  padding: EdgeInsets.all(breakpoint.isMobile ? 20 : 32),
                  decoration: BoxDecoration(
                    color: AppColors.bgSlateDeep.withValues(alpha: 0.4),
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: const Color(0xFF1E293B)),
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        ResponsiveRowColumn(
                          layout: breakpoint.isMobile
                              ? ResponsiveRowColumnType.COLUMN
                              : ResponsiveRowColumnType.ROW,
                          rowSpacing: 16,
                          columnSpacing: 24,
                          children: [
                            ResponsiveRowColumnItem(
                              rowFlex: 1,
                              child: _buildInput(
                                widget.content.formLabels.nameLabel,
                                _nameCtrl,
                                "João Silva",
                              ),
                            ),
                            ResponsiveRowColumnItem(
                              rowFlex: 1,
                              child: _buildInput(
                                widget.content.formLabels.emailLabel,
                                _emailCtrl,
                                "joao@exemplo.com",
                                isEmail: true,
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
    bool isEmail = false,
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
          validator: (value) {
            if (value == null || value.isEmpty) return "Campo obrigatório";
            if (isEmail && !value.contains("@")) return "E-mail inválido";
            return null;
          },
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Color(0xFF475569)),
            filled: true,
            fillColor: const Color(0xFF0F172A).withValues(alpha: 0.5),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFF1E293B)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFF1E293B)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.primary, width: 2),
            ),
            errorStyle: const TextStyle(color: Colors.redAccent),
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
                      fontSize: 16),
                ),
                Text(
                  item.value,
                  style:
                      const TextStyle(color: Color(0xFF94A3B8), fontSize: 14),
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
        _showFeedback(ok);
        if (ok) _formKey.currentState!.reset();
      }
    }
  }

  void _showFeedback(bool success) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(success
            ? "Mensagem enviada! Entrarei em contato em breve. 🚀"
            : "Ocorreu um erro ao enviar. Tente novamente."),
        backgroundColor: success ? Colors.green.shade800 : Colors.red.shade800,
        behavior: SnackBarBehavior.floating,
        width: 400,
      ),
    );
  }
}

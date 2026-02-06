import 'package:flutter/material.dart';
import 'package:portfolio_flutter/app/modules/widgets/text_field.widget.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import '../../core/styles/colors.dart';
import '../../core/utils/app_validators.dart';
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

  // Controllers
  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _subjectCtrl = TextEditingController();
  final _messageCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();

  final _phoneMask = MaskTextInputFormatter(
    mask: '(##) # ####-####',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  @override
  void dispose() {
    _nameCtrl.dispose();
    _emailCtrl.dispose();
    _subjectCtrl.dispose();
    _messageCtrl.dispose();
    _phoneCtrl.dispose();
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
                              child: TextFieldWidget(
                                label: widget.content.formLabels.nameLabel,
                                controller: _nameCtrl,
                                hint: "João Silva",
                                validator: AppValidators.validateRequired,
                              ),
                            ),
                            ResponsiveRowColumnItem(
                              rowFlex: 1,
                              child: TextFieldWidget(
                                label: widget.content.formLabels.emailLabel,
                                controller: _emailCtrl,
                                hint: "joao@exemplo.com",
                                keyboardType: TextInputType.emailAddress,
                                validator: AppValidators.validateEmail,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        ResponsiveRowColumn(
                          layout: breakpoint.isMobile
                              ? ResponsiveRowColumnType.COLUMN
                              : ResponsiveRowColumnType.ROW,
                          rowSpacing: 16,
                          columnSpacing: 24,
                          children: [
                            ResponsiveRowColumnItem(
                              rowFlex: 1,
                              child: TextFieldWidget(
                                label: widget.content.formLabels.subjectLabel,
                                controller: _subjectCtrl,
                                hint: "Consulta de Projeto",
                                validator: AppValidators.validateRequired,
                              ),
                            ),
                            ResponsiveRowColumnItem(
                              rowFlex: 1,
                              child: TextFieldWidget(
                                label: widget.content.formLabels.phoneLabel,
                                controller: _phoneCtrl,
                                hint: "(11) 99999-9999",
                                keyboardType: TextInputType.phone,
                                inputFormatters: [
                                  _phoneMask
                                ], // Aplica a máscara
                                validator: AppValidators.validatePhone,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        TextFieldWidget(
                          label: "Mensagem",
                          controller: _messageCtrl,
                          hint: "Conte-me sobre o seu projeto...",
                          maxLines: 5,
                          validator: AppValidators.validateRequired,
                        ),
                        const SizedBox(height: 32),
                        SizedBox(
                          width: double.infinity,
                          height: 56,
                          child: PrimaryButton(
                            label: widget.content.formLabels.submitButtonText,
                            isPrimary: true,
                            stateController: controller.isLoading,
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

  // O método _buildInput foi removido pois agora usamos o CustomTextField

  Widget _buildInfoTile(ContactInfoItem item) {
    return Padding(
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
  }

  void _handleSend(ContactController controller) async {
    if (_formKey.currentState!.validate()) {
      // O _phoneCtrl.text virá com a máscara (ex: (11) 99999-9999).
      // Se precisar enviar apenas números para a API, use: _phoneMask.getUnmaskedText()

      final ok = await controller.send(
        _nameCtrl.text,
        _emailCtrl.text,
        _subjectCtrl.text,
        _messageCtrl.text,
      ); // Adicione o parâmetro telefone no método send do controller se necessário

      if (mounted) {
        _showFeedback(ok);
        if (ok) {
          _formKey.currentState!.reset();
          // Controllers precisam ser limpos manualmente às vezes
          _nameCtrl.clear();
          _emailCtrl.clear();
          _subjectCtrl.clear();
          _messageCtrl.clear();
          _phoneCtrl.clear();
        }
      }
    }
  }

  void _showFeedback(bool success) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          success
              ? "Mensagem enviada! Entrarei em contato em breve. 🚀"
              : "Ocorreu um erro ao enviar. Tente novamente.",
        ),
        backgroundColor: success ? Colors.green.shade800 : Colors.red.shade800,
        behavior: SnackBarBehavior.floating,
        width: 400,
      ),
    );
  }
}
